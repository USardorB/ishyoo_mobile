part of 'vacancy_details_bloc.dart';

@immutable
sealed class VacancyDetailsState {
  const VacancyDetailsState();
}

class VacancyDetailsInitial extends VacancyDetailsState {
  const VacancyDetailsInitial();
}

class VacancyDetailsLoading extends VacancyDetailsState {
  const VacancyDetailsLoading();
}

class VacancyDetailsLoaded extends VacancyDetailsState {
  final Vacancy vacancy;
  final bool isApplying;
  final String? applyError;
  final bool applySuccess;

  const VacancyDetailsLoaded({
    required this.vacancy,
    this.isApplying = false,
    this.applyError,
    this.applySuccess = false,
  });

  VacancyDetailsLoaded copyWith({
    Vacancy? vacancy,
    bool? isApplying,
    String? applyError,
    bool? applySuccess,
  }) {
    return VacancyDetailsLoaded(
      vacancy: vacancy ?? this.vacancy,
      isApplying: isApplying ?? this.isApplying,
      applyError: applyError,
      applySuccess: applySuccess ?? this.applySuccess,
    );
  }
}

class VacancyDetailsError extends VacancyDetailsState {
  final String message;

  const VacancyDetailsError(this.message);
}
