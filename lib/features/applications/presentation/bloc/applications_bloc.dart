import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/application.dart';
import '../../domain/usecases/get_applications_usecase.dart';
import '../../domain/usecases/update_application_status_usecase.dart';

abstract class ApplicationsEvent {}

class LoadApplications extends ApplicationsEvent {
  final String? status;
  LoadApplications([this.status]);
}

class UpdateApplicationStatus extends ApplicationsEvent {
  final String id;
  final String status;
  UpdateApplicationStatus(this.id, this.status);
}

class ApplicationsState {
  final bool isLoading;
  final List<Application>? applications;
  final String? error;
  final String? activeStatus;

  ApplicationsState({
    this.isLoading = false,
    this.applications,
    this.error,
    this.activeStatus,
  });

  ApplicationsState copyWith({
    bool? isLoading,
    List<Application>? applications,
    String? error,
    String? activeStatus,
  }) {
    return ApplicationsState(
      isLoading: isLoading ?? this.isLoading,
      applications: applications ?? this.applications,
      error: error,
      activeStatus: activeStatus ?? this.activeStatus,
    );
  }
}

@injectable
class ApplicationsBloc extends Bloc<ApplicationsEvent, ApplicationsState> {
  final GetApplicationsUseCase _getApplicationsUseCase;
  final UpdateApplicationStatusUseCase _updateApplicationStatusUseCase;

  ApplicationsBloc(
    this._getApplicationsUseCase,
    this._updateApplicationStatusUseCase,
  ) : super(ApplicationsState()) {
    on<LoadApplications>(_onLoadApplications);
    on<UpdateApplicationStatus>(_onUpdateApplicationStatus);
  }

  Future<void> _onLoadApplications(
    LoadApplications event,
    Emitter<ApplicationsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, activeStatus: event.status));

    final result = await _getApplicationsUseCase(
      GetApplicationsParams(status: event.status),
    );

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (applications) =>
          emit(state.copyWith(isLoading: false, applications: applications)),
    );
  }

  Future<void> _onUpdateApplicationStatus(
    UpdateApplicationStatus event,
    Emitter<ApplicationsState> emit,
  ) async {
    final result = await _updateApplicationStatusUseCase(
      UpdateApplicationStatusParams(id: event.id, status: event.status),
    );

    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (_) {
        // Reload list for the current active status
        add(LoadApplications(state.activeStatus));
      },
    );
  }
}
