import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/applicant.dart';
import '../../domain/repositories/applicants_repository.dart';

// --- EVENTS ---
abstract class ApplicantDetailEvent {}

class LoadApplicantDetail extends ApplicantDetailEvent {
  final String vacancyId;
  final String applicantId;
  LoadApplicantDetail({required this.vacancyId, required this.applicantId});
}

class UpdateApplicantDetailStatus extends ApplicantDetailEvent {
  final String vacancyId;
  final String applicantId;
  final String status;
  UpdateApplicantDetailStatus({
    required this.vacancyId,
    required this.applicantId,
    required this.status,
  });
}

class ScheduleApplicantInterview extends ApplicantDetailEvent {
  final String vacancyId;
  final String applicantId;
  final Map<String, dynamic> body;
  ScheduleApplicantInterview({
    required this.vacancyId,
    required this.applicantId,
    required this.body,
  });
}

// --- STATE ---
class ApplicantDetailState {
  final bool isLoading;
  final bool isUpdating;
  final bool isUpdateSuccess;
  final Applicant? applicant;
  final String? error;

  ApplicantDetailState({
    this.isLoading = false,
    this.isUpdating = false,
    this.isUpdateSuccess = false,
    this.applicant,
    this.error,
  });

  ApplicantDetailState copyWith({
    bool? isLoading,
    bool? isUpdating,
    bool? isUpdateSuccess,
    Applicant? applicant,
    String? error,
  }) {
    return ApplicantDetailState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
      applicant: applicant ?? this.applicant,
      error: error,
    );
  }
}

// --- BLOC ---
@injectable
class ApplicantDetailBloc
    extends Bloc<ApplicantDetailEvent, ApplicantDetailState> {
  final ApplicantsRepository _repository;

  ApplicantDetailBloc(this._repository) : super(ApplicantDetailState()) {
    on<LoadApplicantDetail>(_onLoad);
    on<UpdateApplicantDetailStatus>(_onUpdateStatus);
    on<ScheduleApplicantInterview>(_onScheduleInterview);
  }

  Future<void> _onLoad(
    LoadApplicantDetail event,
    Emitter<ApplicantDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _repository.getVacancyApplicantDetail(
      vacancyId: event.vacancyId,
      vacancyApplicantResumeId: event.applicantId,
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (applicant) =>
          emit(state.copyWith(isLoading: false, applicant: applicant)),
    );
  }

  Future<void> _onUpdateStatus(
    UpdateApplicantDetailStatus event,
    Emitter<ApplicantDetailState> emit,
  ) async {
    emit(state.copyWith(isUpdating: true, error: null));
    final result = await _repository.updateApplicationStatus(
      vacancyId: event.vacancyId,
      vacancyApplicantResumeId: event.applicantId,
      data: {'status': event.status},
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isUpdating: false, error: failure.message)),
      (_) {
        emit(state.copyWith(isUpdating: false, isUpdateSuccess: true));
        // Reload to get fresh data
        add(
          LoadApplicantDetail(
            vacancyId: event.vacancyId,
            applicantId: event.applicantId,
          ),
        );
      },
    );
  }

  Future<void> _onScheduleInterview(
    ScheduleApplicantInterview event,
    Emitter<ApplicantDetailState> emit,
  ) async {
    emit(state.copyWith(isUpdating: true, error: null));
    final result = await _repository.scheduleInterview(
      vacancyId: event.vacancyId,
      vacancyApplicantResumeId: event.applicantId,
      data: event.body,
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isUpdating: false, error: failure.message)),
      (_) => emit(state.copyWith(isUpdating: false, isUpdateSuccess: true)),
    );
  }
}
