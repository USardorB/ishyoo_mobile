part of 'vacancy_feed_bloc.dart';

sealed class VacancyFeedState {
  const VacancyFeedState();
}

class VacancyFeedInitial extends VacancyFeedState {
  const VacancyFeedInitial();
}

class VacancyFeedLoading extends VacancyFeedState {
  const VacancyFeedLoading();
}

class VacancyFeedLoaded extends VacancyFeedState {
  final List<Vacancy> vacancies;

  const VacancyFeedLoaded(this.vacancies);
}

class VacancyFeedError extends VacancyFeedState {
  final String message;

  const VacancyFeedError(this.message);
}
