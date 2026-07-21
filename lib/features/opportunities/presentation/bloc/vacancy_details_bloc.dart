import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/vacancy.dart';
import '../../domain/usecases/get_vacancy_detail_usecase.dart';
import '../../domain/usecases/apply_to_vacancy_usecase.dart';
import '../../domain/usecases/save_vacancy_usecase.dart';
import '../../domain/usecases/unsave_vacancy_usecase.dart';

part 'vacancy_details_event.dart';
part 'vacancy_details_state.dart';

@injectable
class VacancyDetailsBloc extends Bloc<VacancyDetailsEvent, VacancyDetailsState> {
  final GetVacancyDetailUseCase _getVacancyDetailUseCase;
  final ApplyToVacancyUseCase _applyToVacancyUseCase;
  final SaveVacancyUseCase _saveVacancyUseCase;
  final UnsaveVacancyUseCase _unsaveVacancyUseCase;

  VacancyDetailsBloc(
    this._getVacancyDetailUseCase,
    this._applyToVacancyUseCase,
    this._saveVacancyUseCase,
    this._unsaveVacancyUseCase,
  ) : super(const VacancyDetailsInitial()) {
    on<LoadVacancyDetails>(_onLoadVacancyDetails);
    on<ApplyToVacancy>(_onApplyToVacancy);
    on<ToggleSaveVacancy>(_onToggleSaveVacancy);
  }

  Future<void> _onLoadVacancyDetails(
    LoadVacancyDetails event,
    Emitter<VacancyDetailsState> emit,
  ) async {
    emit(const VacancyDetailsLoading());

    final result = await _getVacancyDetailUseCase(GetVacancyDetailParams(event.id));

    result.fold(
      (failure) => emit(VacancyDetailsError(failure.message)),
      (vacancy) => emit(VacancyDetailsLoaded(vacancy: vacancy)),
    );
  }

  Future<void> _onApplyToVacancy(
    ApplyToVacancy event,
    Emitter<VacancyDetailsState> emit,
  ) async {
    if (state is! VacancyDetailsLoaded) return;
    final currentState = state as VacancyDetailsLoaded;

    emit(currentState.copyWith(isApplying: true, applyError: null));

    final result = await _applyToVacancyUseCase(
      ApplyToVacancyParams(
        id: event.id,
        request: {
          'resume_id': event.resumeId,
          if (event.coverLetter != null && event.coverLetter!.isNotEmpty)
            'cover_letter': event.coverLetter,
        },
      ),
    );

    result.fold(
      (failure) => emit(currentState.copyWith(
        isApplying: false,
        applyError: failure.message,
      )),
      (_) {
        // Assume apply success changes the vacancy model's hasApplied state
        // or we just mark success flag
        final updatedVacancy = Vacancy(
          id: currentState.vacancy.id,
          jobTitle: currentState.vacancy.jobTitle,
          location: currentState.vacancy.location,
          specialization: currentState.vacancy.specialization,
          jobType: currentState.vacancy.jobType,
          experienceLevel: currentState.vacancy.experienceLevel,
          salaryFrom: currentState.vacancy.salaryFrom,
          salaryTo: currentState.vacancy.salaryTo,
          currency: currentState.vacancy.currency,
          keySkills: currentState.vacancy.keySkills,
          description: currentState.vacancy.description,
          requirements: currentState.vacancy.requirements,
          responsibilities: currentState.vacancy.responsibilities,
          contact: currentState.vacancy.contact,
          isTemporary: currentState.vacancy.isTemporary,
          status: currentState.vacancy.status,
          publishedAt: currentState.vacancy.publishedAt,
          updatedAt: currentState.vacancy.updatedAt,
          createdAt: currentState.vacancy.createdAt,
          organizationId: currentState.vacancy.organizationId,
          organization: currentState.vacancy.organization,
          latitude: currentState.vacancy.latitude,
          longitude: currentState.vacancy.longitude,
          hasApplied: true, // Optimistically updated
          hasSaved: currentState.vacancy.hasSaved,
          distance: currentState.vacancy.distance,
        );
        emit(currentState.copyWith(
          isApplying: false,
          applySuccess: true,
          vacancy: updatedVacancy,
        ));
      },
    );
  }

  Future<void> _onToggleSaveVacancy(
    ToggleSaveVacancy event,
    Emitter<VacancyDetailsState> emit,
  ) async {
    if (state is! VacancyDetailsLoaded) return;
    final currentState = state as VacancyDetailsLoaded;

    final originalHasSaved = currentState.vacancy.hasSaved ?? false;
    final newHasSaved = !originalHasSaved;

    // Optimistic UI update
    final updatedVacancy = Vacancy(
          id: currentState.vacancy.id,
          jobTitle: currentState.vacancy.jobTitle,
          location: currentState.vacancy.location,
          specialization: currentState.vacancy.specialization,
          jobType: currentState.vacancy.jobType,
          experienceLevel: currentState.vacancy.experienceLevel,
          salaryFrom: currentState.vacancy.salaryFrom,
          salaryTo: currentState.vacancy.salaryTo,
          currency: currentState.vacancy.currency,
          keySkills: currentState.vacancy.keySkills,
          description: currentState.vacancy.description,
          requirements: currentState.vacancy.requirements,
          responsibilities: currentState.vacancy.responsibilities,
          contact: currentState.vacancy.contact,
          isTemporary: currentState.vacancy.isTemporary,
          status: currentState.vacancy.status,
          publishedAt: currentState.vacancy.publishedAt,
          updatedAt: currentState.vacancy.updatedAt,
          createdAt: currentState.vacancy.createdAt,
          organizationId: currentState.vacancy.organizationId,
          organization: currentState.vacancy.organization,
          latitude: currentState.vacancy.latitude,
          longitude: currentState.vacancy.longitude,
          hasApplied: currentState.vacancy.hasApplied,
          hasSaved: newHasSaved,
          distance: currentState.vacancy.distance,
    );
    emit(currentState.copyWith(vacancy: updatedVacancy));

    // Perform API call
    final result = newHasSaved 
        ? await _saveVacancyUseCase(VacancyActionParams(event.id))
        : await _unsaveVacancyUseCase(VacancyActionParams(event.id));

    // Revert if failed
    result.fold(
      (failure) {
        final revertedVacancy = Vacancy(
          id: currentState.vacancy.id,
          jobTitle: currentState.vacancy.jobTitle,
          location: currentState.vacancy.location,
          specialization: currentState.vacancy.specialization,
          jobType: currentState.vacancy.jobType,
          experienceLevel: currentState.vacancy.experienceLevel,
          salaryFrom: currentState.vacancy.salaryFrom,
          salaryTo: currentState.vacancy.salaryTo,
          currency: currentState.vacancy.currency,
          keySkills: currentState.vacancy.keySkills,
          description: currentState.vacancy.description,
          requirements: currentState.vacancy.requirements,
          responsibilities: currentState.vacancy.responsibilities,
          contact: currentState.vacancy.contact,
          isTemporary: currentState.vacancy.isTemporary,
          status: currentState.vacancy.status,
          publishedAt: currentState.vacancy.publishedAt,
          updatedAt: currentState.vacancy.updatedAt,
          createdAt: currentState.vacancy.createdAt,
          organizationId: currentState.vacancy.organizationId,
          organization: currentState.vacancy.organization,
          latitude: currentState.vacancy.latitude,
          longitude: currentState.vacancy.longitude,
          hasApplied: currentState.vacancy.hasApplied,
          hasSaved: originalHasSaved,
          distance: currentState.vacancy.distance,
        );
        emit(currentState.copyWith(vacancy: revertedVacancy));
        // You might want to show a toast/snackbar via a global mechanism or another state flag here.
      },
      (_) {},
    );
  }
}
