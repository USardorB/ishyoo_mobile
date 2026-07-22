import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../data/models/employer_stats.dart';
import '../../../resume/data/models/specialization.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../../opportunities/data/models/vacancy.dart';
import '../../domain/repositories/postings_repository.dart';
import '../datasources/postings_remote_data_source.dart';

@LazySingleton(as: PostingsRepository)
class PostingsRepositoryImpl implements PostingsRepository {
  final PostingsRemoteDataSource remoteDataSource;

  PostingsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Vacancy>>> getVacancies({int page = 1, int limit = 10}) {
    return remoteDataSource.getVacancies(page: page, limit: limit).asEither();
  }

  @override
  Future<Either<Failure, Vacancy>> getVacancyDetail(String id) {
    return remoteDataSource.getVacancyDetail(id).asEither();
  }

  @override
  Future<Either<Failure, Vacancy>> createVacancy(Map<String, dynamic> body) {
    return remoteDataSource.createVacancy(body).asEither();
  }

  @override
  Future<Either<Failure, Vacancy>> updateVacancy(String id, Map<String, dynamic> body) {
    return remoteDataSource.updateVacancy(id, body).asEither();
  }

  @override
  Future<Either<Failure, Vacancy>> archiveVacancy(String id) {
    return remoteDataSource.archiveVacancy(id).asEither();
  }

  @override
  Future<Either<Failure, Vacancy>> publishVacancy(String id) {
    return remoteDataSource.publishVacancy(id).asEither();
  }

  @override
  Future<Either<Failure, List<Specialization>>> getSpecializations() {
    return remoteDataSource.getSpecializations().asEither();
  }

  @override
  Future<Either<Failure, EmployerStats>> getEmployerStats() {
    return remoteDataSource.getEmployerStats().asEither();
  }
}
