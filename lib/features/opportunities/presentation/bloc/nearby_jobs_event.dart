part of 'nearby_jobs_bloc.dart';

@immutable
sealed class NearbyJobsEvent {
  const NearbyJobsEvent();
}

class LoadNearbyJobs extends NearbyJobsEvent {
  final int radius;
  final int limit;

  const LoadNearbyJobs({
    required this.radius,
    this.limit = 20,
  });
}
