import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/resume.dart';
import '../repositories/resume_repository.dart';

@lazySingleton
class GetCandidateResumesUseCase implements UseCase<List<Resume>, NoParam> {
  final ResumeRepository repository;

  GetCandidateResumesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Resume>>> call([NoParam? params]) {
    return repository.getCandidateResumes();
  }
}
