import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../../resume/data/models/resume.dart';

abstract class TalentsRepository {
  Future<Either<Failure, List<Resume>>> getTalentFeed({
    String? query,
    String? jobType,
    String? experienceLevel,
    String? specialization,
  });
  Future<Either<Failure, Resume>> getTalentDetail(String id);
  Future<Either<Failure, void>> saveTalent(String id);
  Future<Either<Failure, void>> unsaveTalent(String id);
}
