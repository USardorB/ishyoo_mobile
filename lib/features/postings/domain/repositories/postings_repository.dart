import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../../opportunities/data/models/vacancy.dart';
import '../../data/models/employer_stats.dart';
import '../../../resume/data/models/specialization.dart';

abstract class PostingsRepository {
  Future<Either<Failure, List<Vacancy>>> getVacancies({int page = 1, int limit = 10});
  Future<Either<Failure, Vacancy>> getVacancyDetail(String id);
  Future<Either<Failure, Vacancy>> createVacancy(Map<String, dynamic> body);
  Future<Either<Failure, Vacancy>> updateVacancy(String id, Map<String, dynamic> body);
  Future<Either<Failure, Vacancy>> archiveVacancy(String id);
  Future<Either<Failure, List<Specialization>>> getSpecializations();
  Future<Either<Failure, EmployerStats>> getEmployerStats();
}
