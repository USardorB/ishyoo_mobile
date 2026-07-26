import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/chat.dart';
import '../../domain/repositories/messaging_repository.dart';

// --- EVENTS ---
abstract class MessagingEvent {}

class LoadChats extends MessagingEvent {
  final bool isEmployer;
  LoadChats({required this.isEmployer});
}

class LoadChatDetail extends MessagingEvent {
  final String id;
  final bool isEmployer;
  final bool isSilent;
  LoadChatDetail({
    required this.id,
    required this.isEmployer,
    this.isSilent = false,
  });
}

class StartChatPolling extends MessagingEvent {
  final String id;
  final bool isEmployer;
  StartChatPolling({required this.id, required this.isEmployer});
}

class StopChatPolling extends MessagingEvent {}

class SendMessage extends MessagingEvent {
  final String id;
  final String content;
  final bool isEmployer;
  SendMessage({
    required this.id,
    required this.content,
    required this.isEmployer,
  });
}

class EditMessage extends MessagingEvent {
  final String chatId;
  final String messageId;
  final String newContent;
  final bool isEmployer;
  EditMessage({
    required this.chatId,
    required this.messageId,
    required this.newContent,
    required this.isEmployer,
  });
}

class DeleteMessage extends MessagingEvent {
  final String chatId;
  final String messageId;
  final bool isEmployer;
  DeleteMessage({
    required this.chatId,
    required this.messageId,
    required this.isEmployer,
  });
}

class UploadChatFile extends MessagingEvent {
  final String chatId;
  final File file;
  final bool isEmployer;
  UploadChatFile({
    required this.chatId,
    required this.file,
    required this.isEmployer,
  });
}

// --- STATE ---
class MessagingState {
  final bool isLoadingChats;
  final bool isLoadingChatDetail;
  final bool isSending;
  final bool isUploading;
  final List<Chat>? chats;
  final Chat? currentChat;
  final String? error;

  MessagingState({
    this.isLoadingChats = false,
    this.isLoadingChatDetail = false,
    this.isSending = false,
    this.isUploading = false,
    this.chats,
    this.currentChat,
    this.error,
  });

  MessagingState copyWith({
    bool? isLoadingChats,
    bool? isLoadingChatDetail,
    bool? isSending,
    bool? isUploading,
    List<Chat>? chats,
    Chat? currentChat,
    String? error,
    bool clearError = false,
  }) {
    return MessagingState(
      isLoadingChats: isLoadingChats ?? this.isLoadingChats,
      isLoadingChatDetail: isLoadingChatDetail ?? this.isLoadingChatDetail,
      isSending: isSending ?? this.isSending,
      isUploading: isUploading ?? this.isUploading,
      chats: chats ?? this.chats,
      currentChat: currentChat ?? this.currentChat,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

// --- BLOC ---
@injectable
class MessagingBloc extends Bloc<MessagingEvent, MessagingState> {
  final MessagingRepository _repository;
  Timer? _pollingTimer;

  MessagingBloc(this._repository) : super(MessagingState()) {
    on<LoadChats>(_onLoadChats);
    on<LoadChatDetail>(_onLoadChatDetail);
    on<StartChatPolling>(_onStartPolling);
    on<StopChatPolling>(_onStopPolling);
    on<SendMessage>(_onSendMessage);
    on<EditMessage>(_onEditMessage);
    on<DeleteMessage>(_onDeleteMessage);
    on<UploadChatFile>(_onUploadChatFile);
  }

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }

  Future<void> _onStartPolling(
    StartChatPolling event,
    Emitter<MessagingState> emit,
  ) async {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(const Duration(seconds: 100000), (_) {
      add(
        LoadChatDetail(
          id: event.id,
          isEmployer: event.isEmployer,
          isSilent: true,
        ),
      );
    });
  }

  Future<void> _onStopPolling(
    StopChatPolling event,
    Emitter<MessagingState> emit,
  ) async {
    _pollingTimer?.cancel();
    _pollingTimer = null;
  }

  Future<void> _onLoadChats(
    LoadChats event,
    Emitter<MessagingState> emit,
  ) async {
    emit(state.copyWith(isLoadingChats: true, clearError: true));

    final result = await _repository.getChats(isEmployer: event.isEmployer);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoadingChats: false, error: failure.message)),
      (chats) => emit(state.copyWith(isLoadingChats: false, chats: chats)),
    );
  }

  Future<void> _onLoadChatDetail(
    LoadChatDetail event,
    Emitter<MessagingState> emit,
  ) async {
    if (!event.isSilent) {
      emit(state.copyWith(isLoadingChatDetail: true, clearError: true));
    }

    final result = await _repository.getChatDetail(
      event.id,
      isEmployer: event.isEmployer,
    );

    result.fold(
      (failure) {
        if (!event.isSilent) {
          emit(
            state.copyWith(isLoadingChatDetail: false, error: failure.message),
          );
        }
      },
      (chat) {
        emit(state.copyWith(isLoadingChatDetail: false, currentChat: chat));
        // Optionally mark chat as read immediately
        if (!event.isSilent || (chat.count?.messages ?? 0) > 0) {
          _repository.readChat(event.id, isEmployer: event.isEmployer);
        }
      },
    );
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<MessagingState> emit,
  ) async {
    emit(state.copyWith(isSending: true, clearError: true));

    final result = await _repository.sendMessage(
      event.id,
      {"content": event.content, "type": "text"},
      isEmployer: event.isEmployer,
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isSending: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isSending: false));
        // Refresh the chat detail to show the new message
        add(
          LoadChatDetail(
            id: event.id,
            isEmployer: event.isEmployer,
            isSilent: true,
          ),
        );
      },
    );
  }

  Future<void> _onEditMessage(
    EditMessage event,
    Emitter<MessagingState> emit,
  ) async {
    final result = await _repository.updateMessage(
      event.chatId,
      event.messageId,
      {'content': event.newContent},
      isEmployer: event.isEmployer,
    );
    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (_) => add(
        LoadChatDetail(
          id: event.chatId,
          isEmployer: event.isEmployer,
          isSilent: true,
        ),
      ),
    );
  }

  Future<void> _onDeleteMessage(
    DeleteMessage event,
    Emitter<MessagingState> emit,
  ) async {
    final result = await _repository.deleteMessage(
      event.chatId,
      event.messageId,
      isEmployer: event.isEmployer,
    );
    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (_) => add(
        LoadChatDetail(
          id: event.chatId,
          isEmployer: event.isEmployer,
          isSilent: true,
        ),
      ),
    );
  }

  Future<void> _onUploadChatFile(
    UploadChatFile event,
    Emitter<MessagingState> emit,
  ) async {
    emit(state.copyWith(isUploading: true, clearError: true));
    final result = await _repository.uploadChatFile(
      event.chatId,
      event.file,
      isEmployer: event.isEmployer,
    );
    await result.fold(
      (failure) async =>
          emit(state.copyWith(isUploading: false, error: failure.message)),
      (fileResult) async {
        await Future.delayed(Duration(seconds: 2));
        final body = {
          "files": [fileResult],
        };
        final sendMessageResult = await _repository.sendMessage(
          event.chatId,
          body,
          isEmployer: event.isEmployer,
        );
        sendMessageResult.fold(
          (failure) =>
              emit(state.copyWith(isUploading: false, error: failure.message)),
          (_) {
            emit(state.copyWith(isUploading: false));
            add(
              LoadChatDetail(
                id: event.chatId,
                isEmployer: event.isEmployer,
                isSilent: true,
              ),
            );
          },
        );
      },
    );
  }
}
