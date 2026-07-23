import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/vacancy.dart';
import '../../domain/usecases/get_vacancy_feed_usecase.dart';
import '../../domain/usecases/save_vacancy_usecase.dart';
import '../../domain/usecases/unsave_vacancy_usecase.dart';

part 'vacancy_feed_event.dart';
part 'vacancy_feed_state.dart';

@injectable
class VacancyFeedBloc extends Bloc<VacancyFeedEvent, VacancyFeedState> {
  final GetVacancyFeedUseCase _getVacancyFeedUseCase;
  final SaveVacancyUseCase _saveVacancyUseCase;
  final UnsaveVacancyUseCase _unsaveVacancyUseCase;

  VacancyFeedBloc({
    required GetVacancyFeedUseCase getVacancyFeedUseCase,
    required SaveVacancyUseCase saveVacancyUseCase,
    required UnsaveVacancyUseCase unsaveVacancyUseCase,
  }) : _getVacancyFeedUseCase = getVacancyFeedUseCase,
       _saveVacancyUseCase = saveVacancyUseCase,
       _unsaveVacancyUseCase = unsaveVacancyUseCase,
       super(const VacancyFeedInitial()) {
    on<LoadVacancyFeed>(_onLoadVacancyFeed);
    on<ToggleSaveVacancyFeed>(_onToggleSaveVacancyFeed);
  }

  Future<void> _onLoadVacancyFeed(
    LoadVacancyFeed event,
    Emitter<VacancyFeedState> emit,
  ) async {
    emit(const VacancyFeedLoading());

    final result = await _getVacancyFeedUseCase(
      GetVacancyFeedParams(
        title: event.title,
        jobType: event.jobType,
        experienceLevel: event.experienceLevel,
        specialization: event.specialization,
      ),
    );

    result.fold(
      (failure) => emit(VacancyFeedError(failure.message)),
      (vacancies) => emit(VacancyFeedLoaded(vacancies)),
    );
  }

  Future<void> _onToggleSaveVacancyFeed(
    ToggleSaveVacancyFeed event,
    Emitter<VacancyFeedState> emit,
  ) async {
    if (state is VacancyFeedLoaded) {
      final currentState = state as VacancyFeedLoaded;
      
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
          // In case of failure, we might want to revert the state, 
          // but for now we just leave it or could re-fetch/revert.
          final revertedVacancies = currentState.vacancies.map((v) {
            if (v.id == event.id) {
              return v.copyWith(hasSaved: event.currentlySaved);
            }
            return v;
          }).toList();
          emit(VacancyFeedLoaded(revertedVacancies));
        },
        (_) {},
      );
    }
  }
}
