import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/vacancy.dart';
import '../../domain/usecases/get_vacancy_feed_usecase.dart';

part 'vacancy_feed_event.dart';
part 'vacancy_feed_state.dart';

@injectable
class VacancyFeedBloc extends Bloc<VacancyFeedEvent, VacancyFeedState> {
  final GetVacancyFeedUseCase _getVacancyFeedUseCase;

  VacancyFeedBloc({
    required GetVacancyFeedUseCase getVacancyFeedUseCase,
  }) : _getVacancyFeedUseCase = getVacancyFeedUseCase,
       super(const VacancyFeedInitial()) {
    on<LoadVacancyFeed>(_onLoadVacancyFeed);
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
}
