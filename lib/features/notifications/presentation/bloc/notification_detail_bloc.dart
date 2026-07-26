import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/notification.dart';
import '../../domain/usecases/get_notification_detail_usecase.dart';

abstract class NotificationDetailEvent {}

class LoadNotificationDetail extends NotificationDetailEvent {
  final String role;
  final String id;
  LoadNotificationDetail(this.role, this.id);
}

class NotificationDetailState {
  final bool isLoading;
  final Notification? notification;
  final String? error;

  NotificationDetailState({
    this.isLoading = false,
    this.notification,
    this.error,
  });

  NotificationDetailState copyWith({
    bool? isLoading,
    Notification? notification,
    String? error,
  }) {
    return NotificationDetailState(
      isLoading: isLoading ?? this.isLoading,
      notification: notification ?? this.notification,
      error: error,
    );
  }
}

@injectable
class NotificationDetailBloc
    extends Bloc<NotificationDetailEvent, NotificationDetailState> {
  final GetNotificationDetailUseCase _getNotificationDetailUseCase;

  NotificationDetailBloc(this._getNotificationDetailUseCase)
    : super(NotificationDetailState()) {
    on<LoadNotificationDetail>(_onLoadNotificationDetail);
  }

  Future<void> _onLoadNotificationDetail(
    LoadNotificationDetail event,
    Emitter<NotificationDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _getNotificationDetailUseCase(
      GetNotificationDetailParams(event.role, event.id),
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (notification) =>
          emit(state.copyWith(isLoading: false, notification: notification)),
    );
  }
}
