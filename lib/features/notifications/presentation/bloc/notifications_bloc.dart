import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/notification.dart';
import '../../domain/usecases/get_notifications_usecase.dart';
import '../../domain/usecases/mark_all_notifications_as_read_usecase.dart';

abstract class NotificationsEvent {}

class LoadNotifications extends NotificationsEvent {
  final String role;
  LoadNotifications(this.role);
}

class MarkAllAsRead extends NotificationsEvent {
  final String role;
  MarkAllAsRead(this.role);
}

class NotificationsState {
  final bool isLoading;
  final List<Notification>? notifications;
  final String? error;

  NotificationsState({
    this.isLoading = false,
    this.notifications,
    this.error,
  });

  NotificationsState copyWith({
    bool? isLoading,
    List<Notification>? notifications,
    String? error,
  }) {
    return NotificationsState(
      isLoading: isLoading ?? this.isLoading,
      notifications: notifications ?? this.notifications,
      error: error,
    );
  }
}

@injectable
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final MarkAllNotificationsAsReadUseCase _markAllNotificationsAsReadUseCase;

  NotificationsBloc(
    this._getNotificationsUseCase,
    this._markAllNotificationsAsReadUseCase,
  ) : super(NotificationsState()) {
    on<LoadNotifications>(_onLoadNotifications);
    on<MarkAllAsRead>(_onMarkAllAsRead);
  }

  Future<void> _onLoadNotifications(
    LoadNotifications event,
    Emitter<NotificationsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _getNotificationsUseCase(GetNotificationsParams(event.role));

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (notifications) => emit(state.copyWith(isLoading: false, notifications: notifications)),
    );
  }

  Future<void> _onMarkAllAsRead(
    MarkAllAsRead event,
    Emitter<NotificationsState> emit,
  ) async {
    final result = await _markAllNotificationsAsReadUseCase(MarkAllNotificationsAsReadParams(event.role));

    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (_) {
        // Optimistically update the UI to show all as read
        if (state.notifications != null) {
          final updated = state.notifications!.map((n) {
            return Notification(
              id: n.id,
              type: n.type,
              title: n.title,
              message: n.message,
              isRead: true,
              createdAt: n.createdAt,
              updatedAt: n.updatedAt,
              userId: n.userId,
            );
          }).toList();
          emit(state.copyWith(notifications: updated));
        }
      },
    );
  }
}
