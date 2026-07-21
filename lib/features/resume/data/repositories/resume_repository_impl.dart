import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../domain/repositories/resume_repository.dart';
import '../datasources/resume_remote_data_source.dart';
import '../models/resume.dart';

@LazySingleton(as: ResumeRepository)
class ResumeRepositoryImpl implements ResumeRepository {
  final ResumeRemoteDataSource remoteDataSource;

  ResumeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Resume>>> getCandidateResumes() {
    return remoteDataSource.getCandidateResumes().asEither();
  }

  @override
  Future<Either<Failure, Resume>> getResumeDetail(String id) {
    return remoteDataSource.getResumeDetail(id).asEither();
  }

  @override
  Future<Either<Failure, Resume>> createResume(Map<String, dynamic> body) {
    return remoteDataSource.createResume(body).asEither();
  }

  @override
  Future<Either<Failure, Resume>> updateResume(String id, Map<String, dynamic> body) {
    return remoteDataSource.updateResume(id, body).asEither();
  }

  @override
  Future<Either<Failure, Unit>> deleteResume(String id) {
    return remoteDataSource.deleteResume(id).asEither();
  }

  @override
  Future<Either<Failure, Unit>> boostResume(String id) {
    return remoteDataSource.boostResume(id).asEither();
  }

  @override
  Future<Either<Failure, List<String>>> getSpecializations() {
    return remoteDataSource.getSpecializations().asEither();
  }
}
