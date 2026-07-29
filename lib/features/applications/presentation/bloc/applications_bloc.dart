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
  final Map<String?, List<Application>> applicationsByStatus;
  final String? error;
  final String? activeStatus;

  ApplicationsState({
    this.isLoading = false,
    this.applicationsByStatus = const {},
    this.error,
    this.activeStatus,
  });

  ApplicationsState copyWith({
    bool? isLoading,
    Map<String?, List<Application>>? applicationsByStatus,
    String? error,
    String? activeStatus,
  }) {
    return ApplicationsState(
      isLoading: isLoading ?? this.isLoading,
      applicationsByStatus: applicationsByStatus ?? this.applicationsByStatus,
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
      (applications) {
        final newMap = Map<String?, List<Application>>.from(state.applicationsByStatus);
        newMap[event.status] = applications;
        emit(state.copyWith(isLoading: false, applicationsByStatus: newMap));
      },
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
