import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../domain/repositories/applicants_repository.dart';
import '../datasources/applicants_remote_data_source.dart';
import '../models/applicant.dart';

@LazySingleton(as: ApplicantsRepository)
class ApplicantsRepositoryImpl implements ApplicantsRepository {
  final ApplicantsRemoteDataSource remoteDataSource;

  ApplicantsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Applicant>>> getApplicants() {
    return remoteDataSource.getApplicants().asEither();
  }

  @override
  Future<Either<Failure, List<Applicant>>> getVacancyApplicants(
    String vacancyId,
  ) {
    return remoteDataSource.getVacancyApplicants(vacancyId).asEither();
  }

  @override
  Future<Either<Failure, Applicant>> getVacancyApplicantDetail(
    String vacancyId,
    String applicantId,
  ) {
    return remoteDataSource
        .getVacancyApplicantDetail(vacancyId, applicantId)
        .asEither();
  }

  @override
  Future<Either<Failure, void>> scheduleInterview(
    String vacancyId,
    String applicantId,
    Map<String, dynamic> body,
  ) {
    return remoteDataSource
        .scheduleInterview(vacancyId, applicantId, body)
        .asEither();
  }

  @override
  Future<Either<Failure, void>> updateApplicationStatus(
    String vacancyId,
    String applicantId,
    Map<String, dynamic> body,
  ) {
    return remoteDataSource
        .updateApplicationStatus(vacancyId, applicantId, body)
        .asEither();
  }
}
