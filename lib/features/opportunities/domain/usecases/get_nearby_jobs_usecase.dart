import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/vacancy.dart';
import '../repositories/vacancy_repository.dart';

class GetNearbyJobsParams {
  final double latitude;
  final double longitude;
  final int radius;
  final int limit;

  const GetNearbyJobsParams({
    required this.latitude,
    required this.longitude,
    required this.radius,
    required this.limit,
  });
}

@lazySingleton
class GetNearbyJobsUseCase
    implements UseCase<List<Vacancy>, GetNearbyJobsParams> {
  final VacancyRepository repository;

  GetNearbyJobsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Vacancy>>> call([GetNearbyJobsParams? params]) {
    assert(params != null);
    return repository.getNearbyJobs(
      params!.latitude,
      params.longitude,
      params.radius,
      params.limit,
    );
  }
}
