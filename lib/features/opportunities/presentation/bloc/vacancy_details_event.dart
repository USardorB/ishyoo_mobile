part of 'vacancy_details_bloc.dart';

@immutable
sealed class VacancyDetailsEvent {
  const VacancyDetailsEvent();
}

class LoadVacancyDetails extends VacancyDetailsEvent {
  final String id;

  const LoadVacancyDetails(this.id);
}

class ApplyToVacancy extends VacancyDetailsEvent {
  final String id;
  final String resumeId;
  final String? coverLetter;

  const ApplyToVacancy(this.id, this.resumeId, [this.coverLetter]);
}

class ToggleSaveVacancy extends VacancyDetailsEvent {
  final String id;
  final bool currentlySaved;

  const ToggleSaveVacancy({required this.id, required this.currentlySaved});
}
