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
  Future<Either<Failure, List<Applicant>>> getApplicants({String? status}) {
    return remoteDataSource.getApplicants(status: status).asEither();
  }

  @override
  Future<Either<Failure, List<Applicant>>> getVacancyApplicants(
    String vacancyId, {
    String? status,
  }) {
    return remoteDataSource.getVacancyApplicants(vacancyId, status: status).asEither();
  }

  @override
  Future<Either<Failure, Applicant>> getVacancyApplicantDetail({
    required String vacancyId,
    required String vacancyApplicantResumeId,
  }) {
    return remoteDataSource
        .getVacancyApplicantDetail(vacancyId, vacancyApplicantResumeId)
        .asEither();
  }

  @override
  Future<Either<Failure, void>> scheduleInterview({
    required String vacancyId,
    required String vacancyApplicantResumeId,
    required Map<String, dynamic> data,
  }) {
    return remoteDataSource
        .scheduleInterview(vacancyId, vacancyApplicantResumeId, data)
        .asEither();
  }

  @override
  Future<Either<Failure, void>> updateApplicationStatus({
    required String vacancyId,
    required String vacancyApplicantResumeId,
    required Map<String, dynamic> data,
  }) {
    return remoteDataSource
        .updateApplicationStatus(vacancyId, vacancyApplicantResumeId, data)
        .asEither();
  }
}
