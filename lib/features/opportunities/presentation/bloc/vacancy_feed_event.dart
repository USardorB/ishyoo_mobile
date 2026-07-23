part of 'vacancy_feed_bloc.dart';

sealed class VacancyFeedEvent {
  const VacancyFeedEvent();
}

class LoadVacancyFeed extends VacancyFeedEvent {
  final String? title;
  final String? jobType;
  final String? experienceLevel;
  final String? specialization;

  const LoadVacancyFeed({
    this.title,
    this.jobType,
    this.experienceLevel,
    this.specialization,
  });
}

class ToggleSaveVacancyFeed extends VacancyFeedEvent {
  final String id;
  final bool currentlySaved;

  const ToggleSaveVacancyFeed({
    required this.id,
    required this.currentlySaved,
  });
}
