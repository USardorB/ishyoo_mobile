import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/vacancy.dart';
import '../../domain/usecases/apply_to_vacancy_usecase.dart';
import '../../domain/usecases/get_vacancy_feed_usecase.dart';
import '../../domain/usecases/save_vacancy_usecase.dart';
import '../../domain/usecases/unsave_vacancy_usecase.dart';

part 'vacancy_feed_event.dart';
part 'vacancy_feed_state.dart';

@injectable
class VacancyFeedBloc extends Bloc<VacancyFeedEvent, VacancyFeedState> {
  final GetVacancyFeedUseCase _getVacancyFeedUseCase;
  final ApplyToVacancyUseCase _applyToVacancyUseCase;
  final SaveVacancyUseCase _saveVacancyUseCase;
  final UnsaveVacancyUseCase _unsaveVacancyUseCase;

  String? _currentTitle;
  String? _currentJobType;
  String? _currentExperienceLevel;
  String? _currentSpecialization;

  String? get currentTitle => _currentTitle;
  String? get currentJobType => _currentJobType;
  String? get currentExperienceLevel => _currentExperienceLevel;
  String? get currentSpecialization => _currentSpecialization;

  VacancyFeedBloc({
    required this._getVacancyFeedUseCase,
    required this._applyToVacancyUseCase,
    required this._saveVacancyUseCase,
    required this._unsaveVacancyUseCase,
  }) : super(const VacancyFeedInitial()) {
    on<LoadVacancyFeed>(_onLoadVacancyFeed);
    on<UpdateVacancyFeedFilters>(_onUpdateFilters);
    on<UpdateVacancyFeedSearch>(_onUpdateSearch);
    on<ToggleSaveVacancyFeed>(_onToggleSaveVacancyFeed);
    on<ApplyToVacancyFeed>(_onApplyToVacancyFeed);
  }

  Future<void> _fetchData(Emitter<VacancyFeedState> emit) async {
    emit(const VacancyFeedLoading());

    final result = await _getVacancyFeedUseCase(
      GetVacancyFeedParams(
        title: _currentTitle,
        jobType: _currentJobType,
        experienceLevel: _currentExperienceLevel,
        specialization: _currentSpecialization,
      ),
    );

    result.fold(
      (failure) => emit(VacancyFeedError(failure.message)),
      (vacancies) => emit(VacancyFeedLoaded(vacancies)),
    );
  }

  Future<void> _onLoadVacancyFeed(
    LoadVacancyFeed event,
    Emitter<VacancyFeedState> emit,
  ) async {
    if (!event.isRefresh) {
      _currentTitle = event.title;
      _currentJobType = event.jobType;
      _currentExperienceLevel = event.experienceLevel;
      _currentSpecialization = event.specialization;
    }
    await _fetchData(emit);
  }

  Future<void> _onUpdateFilters(
    UpdateVacancyFeedFilters event,
    Emitter<VacancyFeedState> emit,
  ) async {
    _currentJobType = event.jobType;
    _currentExperienceLevel = event.experienceLevel;
    _currentSpecialization = event.specialization;
    await _fetchData(emit);
  }

  Future<void> _onUpdateSearch(
    UpdateVacancyFeedSearch event,
    Emitter<VacancyFeedState> emit,
  ) async {
    _currentTitle = event.title;
    await _fetchData(emit);
  }

  Future<void> _onToggleSaveVacancyFeed(
    ToggleSaveVacancyFeed event,
    Emitter<VacancyFeedState> emit,
  ) async {
    if (state is VacancyFeedLoaded) {
      final currentState = state as VacancyFeedLoaded;
      final originalHasSaved = event.currentlySaved;

      final updatedVacancies = currentState.vacancies.map((v) {
        if (v.id == event.id) {
          return v.copyWith(hasSaved: !event.currentlySaved);
        }
        return v;
      }).toList();

      emit(VacancyFeedLoaded(updatedVacancies));

      final result = event.currentlySaved
          ? await _unsaveVacancyUseCase(VacancyActionParams(event.id))
          : await _saveVacancyUseCase(VacancyActionParams(event.id));

      result.fold(
        (failure) {
          final revertedVacancies = currentState.vacancies.map((v) {
            if (v.id == event.id) {
              return v.copyWith(hasSaved: originalHasSaved);
            }
            return v;
          }).toList();
          emit(VacancyFeedLoaded(revertedVacancies));
        },
        (_) {},
      );
    }
  }

  Future<void> _onApplyToVacancyFeed(
    ApplyToVacancyFeed event,
    Emitter<VacancyFeedState> emit,
  ) async {
    if (state is! VacancyFeedLoaded) return;
    final currentState = state as VacancyFeedLoaded;

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
      (failure) {},
      (_) {
        final updatedVacancies = currentState.vacancies.map((v) {
          if (v.id == event.id) {
            return v.copyWith(hasApplied: true);
          }
          return v;
        }).toList();
        emit(VacancyFeedLoaded(updatedVacancies));
      },
    );
  }
}
