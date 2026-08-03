part of 'saved_vacancies_bloc.dart';

sealed class SavedVacanciesEvent {
  const SavedVacanciesEvent();
}

class LoadSavedVacancies extends SavedVacanciesEvent {}
