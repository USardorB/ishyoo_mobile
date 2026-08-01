import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../../resume/data/models/resume.dart';
import '../../domain/repositories/talents_repository.dart';
import '../datasources/talents_remote_data_source.dart';

@LazySingleton(as: TalentsRepository)
class TalentsRepositoryImpl implements TalentsRepository {
  final TalentsRemoteDataSource remoteDataSource;

  TalentsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Resume>>> getTalentFeed({
    String? query,
    String? jobType,
    String? experienceLevel,
    String? specialization,
  }) {
    return remoteDataSource
        .getTalentFeed(
          query: query,
          jobType: jobType,
          experienceLevel: experienceLevel,
          specialization: specialization,
        )
        .asEither();
  }

  @override
  Future<Either<Failure, Resume>> getTalentDetail(String id) {
    return remoteDataSource.getTalentDetail(id).asEither();
  }

  @override
  Future<Either<Failure, void>> saveTalent(String id) {
    return remoteDataSource.saveTalent(id).asEither();
  }

  @override
  Future<Either<Failure, void>> unsaveTalent(String id) {
    return remoteDataSource.unsaveTalent(id).asEither();
  }
}
