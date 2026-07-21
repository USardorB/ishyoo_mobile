import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../repositories/resume_repository.dart';

class BoostResumeParams {
  final String id;
  BoostResumeParams(this.id);
}

@lazySingleton
class BoostResumeUseCase implements UseCase<Unit, BoostResumeParams> {
  final ResumeRepository repository;

  BoostResumeUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call([BoostResumeParams? params]) {
    return repository.boostResume(params!.id);
  }
}
