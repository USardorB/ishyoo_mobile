import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/resume.dart';
import '../repositories/resume_repository.dart';

class GetResumeDetailParams {
  final String id;
  GetResumeDetailParams(this.id);
}

@lazySingleton
class GetResumeDetailUseCase implements UseCase<Resume, GetResumeDetailParams> {
  final ResumeRepository repository;

  GetResumeDetailUseCase(this.repository);

  @override
  Future<Either<Failure, Resume>> call([GetResumeDetailParams? params]) {
    return repository.getResumeDetail(params!.id);
  }
}
