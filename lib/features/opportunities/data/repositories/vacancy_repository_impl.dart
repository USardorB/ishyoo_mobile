import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../domain/repositories/vacancy_repository.dart';
import '../datasources/vacancy_remote_data_source.dart';
import '../models/application_response.dart';
import '../models/vacancy.dart';

@LazySingleton(as: VacancyRepository)
class VacancyRepositoryImpl implements VacancyRepository {
  final VacancyRemoteDataSource remoteDataSource;

  VacancyRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Vacancy>>> getVacancyFeed({
    int? limit,
    String? specialization,
    String? jobType,
    String? experienceLevel,
    String? title,
  }) {
    return remoteDataSource
        .getVacancyFeed(
          'candidate',
          limit: limit,
          specialization: specialization,
          jobType: jobType,
          experienceLevel: experienceLevel,
          title: title,
        )
        .asEither();
  }
  @override
  Future<Either<Failure, List<Vacancy>>> getNearbyJobs(
    double lat,
    double lng,
    int radius,
    int limit,
  ) {
    return remoteDataSource
        .getNearbyJobs('candidate', lat, lng, radius, limit)
        .asEither();
  }

  @override
  Future<Either<Failure, Vacancy>> getVacancyDetail(String id) {
    return remoteDataSource.getVacancyDetail('candidate', id).asEither();
  }

  @override
  Future<Either<Failure, ApplicationResponse>> applyToVacancy(
      String id, Map<String, dynamic> request) async {
    try {
      final response = await remoteDataSource.applyToVacancy('candidate', id, request);
      if (response.success && response.data != null) {
        return right(response.data!);
      }
      return left(ServerFailure(message: response.message ?? 'Unknown error'));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveVacancy(String id) async {
    return remoteDataSource.saveVacancy('candidate', id).asEither();
  }

  @override
  Future<Either<Failure, Unit>> unsaveVacancy(String id) async {
    return remoteDataSource.unsaveVacancy('candidate', id).asEither();
  }
}
