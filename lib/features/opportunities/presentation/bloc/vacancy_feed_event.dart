part of 'vacancy_feed_bloc.dart';

sealed class VacancyFeedEvent {
  const VacancyFeedEvent();
}

class LoadVacancyFeed extends VacancyFeedEvent {
  final String? title;
  final String? jobType;
  final String? experienceLevel;
  final String? specialization;
  final bool isRefresh;

  const LoadVacancyFeed({
    this.title,
    this.jobType,
    this.experienceLevel,
    this.specialization,
    this.isRefresh = false,
  });
}

class UpdateVacancyFeedFilters extends VacancyFeedEvent {
  final String? jobType;
  final String? experienceLevel;
  final String? specialization;

  const UpdateVacancyFeedFilters({
    this.jobType,
    this.experienceLevel,
    this.specialization,
  });
}

class UpdateVacancyFeedSearch extends VacancyFeedEvent {
  final String? title;

  const UpdateVacancyFeedSearch({this.title});
}

class ToggleSaveVacancyFeed extends VacancyFeedEvent {
  final String id;
  final bool currentlySaved;

  const ToggleSaveVacancyFeed({
    required this.id,
    required this.currentlySaved,
  });
}

class ApplyToVacancyFeed extends VacancyFeedEvent {
  final String id;
  final String resumeId;
  final String? coverLetter;

  const ApplyToVacancyFeed({
    required this.id,
    required this.resumeId,
    this.coverLetter,
  });
}
