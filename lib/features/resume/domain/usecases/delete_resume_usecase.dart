import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../repositories/resume_repository.dart';

class DeleteResumeParams {
  final String id;
  DeleteResumeParams(this.id);
}

@lazySingleton
class DeleteResumeUseCase implements UseCase<Unit, DeleteResumeParams> {
  final ResumeRepository repository;

  DeleteResumeUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call([DeleteResumeParams? params]) {
    return repository.deleteResume(params!.id);
  }
}
