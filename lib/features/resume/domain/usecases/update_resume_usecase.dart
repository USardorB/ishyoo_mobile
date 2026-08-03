import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/resume.dart';
import '../repositories/resume_repository.dart';

class UpdateResumeParams {
  final String id;
  final Map<String, dynamic> body;
  UpdateResumeParams(this.id, this.body);
}

@lazySingleton
class UpdateResumeUseCase implements UseCase<Resume, UpdateResumeParams> {
  final ResumeRepository repository;

  UpdateResumeUseCase(this.repository);

  @override
  Future<Either<Failure, Resume>> call([UpdateResumeParams? params]) {
    return repository.updateResume(params!.id, params.body);
  }
}
