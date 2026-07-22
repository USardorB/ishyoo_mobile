import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../data/models/applicant.dart';

abstract class ApplicantsRepository {
  Future<Either<Failure, List<Applicant>>> getVacancyApplicants(String vacancyId);
  Future<Either<Failure, Applicant>> getVacancyApplicantDetail(String vacancyId, String applicantId);
  Future<Either<Failure, void>> scheduleInterview(String vacancyId, String applicantId, Map<String, dynamic> body);
  Future<Either<Failure, void>> updateApplicationStatus(String vacancyId, String applicantId, Map<String, dynamic> body);
}
