import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/applicant.dart';
import '../../domain/repositories/applicants_repository.dart';

abstract class ApplicantsEvent {}

class LoadApplicants extends ApplicantsEvent {
  final String? vacancyId;
  final String? status;
  LoadApplicants([this.vacancyId, this.status]);
}

class UpdateApplicantStatus extends ApplicantsEvent {
  final String vacancyId;
  final String applicantId;
  final String status;
  UpdateApplicantStatus({
    required this.vacancyId,
    required this.applicantId,
    required this.status,
  });
}

class ApplicantsState {
  final bool isLoading;
  final List<Applicant>? applicants;
  final String? error;

  ApplicantsState({
    this.isLoading = false,
    this.applicants,
    this.error,
  });

  ApplicantsState copyWith({
    bool? isLoading,
    List<Applicant>? applicants,
    String? error,
  }) {
    return ApplicantsState(
      isLoading: isLoading ?? this.isLoading,
      applicants: applicants ?? this.applicants,
      error: error,
    );
  }
}

@injectable
class ApplicantsBloc extends Bloc<ApplicantsEvent, ApplicantsState> {
  final ApplicantsRepository _applicantsRepository;

  ApplicantsBloc(this._applicantsRepository) : super(ApplicantsState()) {
    on<LoadApplicants>(_onLoad);
    on<UpdateApplicantStatus>(_onUpdateStatus);
  }

  Future<void> _onLoad(
    LoadApplicants event,
    Emitter<ApplicantsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = event.vacancyId != null && event.vacancyId!.isNotEmpty
        ? await _applicantsRepository.getVacancyApplicants(event.vacancyId!, status: event.status)
        : await _applicantsRepository.getApplicants(status: event.status);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (applicants) =>
          emit(state.copyWith(isLoading: false, applicants: applicants)),
    );
  }

  Future<void> _onUpdateStatus(
    UpdateApplicantStatus event,
    Emitter<ApplicantsState> emit,
  ) async {
    // Optionally show a loading indicator or optimistically update the list here
    final result = await _applicantsRepository.updateApplicationStatus(
      vacancyId: event.vacancyId,
      vacancyApplicantResumeId: event.applicantId,
      data: {'status': event.status},
    );

    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (_) {
        // Trigger a reload of the applicants list
        add(LoadApplicants(event.vacancyId));
      },
    );
  }
}
