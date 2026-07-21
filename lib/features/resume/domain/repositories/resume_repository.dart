import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../data/models/resume.dart';

abstract class ResumeRepository {
  Future<Either<Failure, List<Resume>>> getCandidateResumes();
  Future<Either<Failure, Resume>> getResumeDetail(String id);
  Future<Either<Failure, Resume>> createResume(Map<String, dynamic> body);
  Future<Either<Failure, Resume>> updateResume(String id, Map<String, dynamic> body);
  Future<Either<Failure, Unit>> deleteResume(String id);
  Future<Either<Failure, Unit>> boostResume(String id);
  Future<Either<Failure, List<String>>> getSpecializations();
}
