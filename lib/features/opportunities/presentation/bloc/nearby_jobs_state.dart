part of 'nearby_jobs_bloc.dart';

@immutable
sealed class NearbyJobsState {
  const NearbyJobsState();
}

class NearbyJobsInitial extends NearbyJobsState {
  const NearbyJobsInitial();
}

class NearbyJobsLoading extends NearbyJobsState {
  const NearbyJobsLoading();
}

class NearbyJobsLoaded extends NearbyJobsState {
  final List<Vacancy> vacancies;
  final int radius;

  const NearbyJobsLoaded(this.vacancies, this.radius);
}

class NearbyJobsLocationError extends NearbyJobsState {
  final String message;

  const NearbyJobsLocationError(this.message);
}

class NearbyJobsError extends NearbyJobsState {
  final String message;

  const NearbyJobsError(this.message);
}
