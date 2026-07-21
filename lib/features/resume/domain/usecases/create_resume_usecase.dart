import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/resume.dart';
import '../repositories/resume_repository.dart';

class CreateResumeParams {
  final Map<String, dynamic> body;
  CreateResumeParams(this.body);
}

@lazySingleton
class CreateResumeUseCase implements UseCase<Resume, CreateResumeParams> {
  final ResumeRepository repository;

  CreateResumeUseCase(this.repository);

  @override
  Future<Either<Failure, Resume>> call([CreateResumeParams? params]) {
    return repository.createResume(params!.body);
  }
}
