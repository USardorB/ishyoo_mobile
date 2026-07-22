part of 'saved_vacancies_bloc.dart';

sealed class SavedVacanciesState {
  const SavedVacanciesState();
}

class SavedVacanciesInitial extends SavedVacanciesState {}

class SavedVacanciesLoading extends SavedVacanciesState {}

class SavedVacanciesLoaded extends SavedVacanciesState {
  final List<Vacancy> vacancies;
  const SavedVacanciesLoaded(this.vacancies);
}

class SavedVacanciesError extends SavedVacanciesState {
  final String message;
  const SavedVacanciesError(this.message);
}
