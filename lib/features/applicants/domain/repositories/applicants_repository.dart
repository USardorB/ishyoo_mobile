import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../data/models/applicant.dart';

abstract class ApplicantsRepository {
  Future<Either<Failure, List<Applicant>>> getApplicants();
  Future<Either<Failure, List<Applicant>>> getVacancyApplicants(
    String vacancyId,
  );
  Future<Either<Failure, Applicant>> getVacancyApplicantDetail({
    required String vacancyId,
    required String vacancyApplicantResumeId,
  });

  Future<Either<Failure, void>> scheduleInterview({
    required String vacancyId,
    required String vacancyApplicantResumeId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, void>> updateApplicationStatus({
    required String vacancyId,
    required String vacancyApplicantResumeId,
    required Map<String, dynamic> data,
  });
}
