import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../data/models/application_response.dart';
import '../../data/models/vacancy.dart';

abstract class VacancyRepository {
  Future<Either<Failure, List<Vacancy>>> getVacancyFeed({
    int? limit,
    String? specialization,
    String? jobType,
    String? experienceLevel,
    String? title,
  });
  Future<Either<Failure, List<Vacancy>>> getNearbyJobs(
    double lat,
    double lng,
    int radius,
    int limit,
  );
  Future<Either<Failure, Vacancy>> getVacancyDetail(String id);
  Future<Either<Failure, ApplicationResponse>> applyToVacancy(String id, Map<String, dynamic> request);
  Future<Either<Failure, Unit>> saveVacancy(String id);
  Future<Either<Failure, Unit>> unsaveVacancy(String id);
}
