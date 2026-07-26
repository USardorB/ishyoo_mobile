import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../repositories/resume_repository.dart';
import '../../data/models/specialization.dart';

@lazySingleton
class GetSpecializationsUseCase
    implements UseCase<List<Specialization>, NoParam> {
  final ResumeRepository repository;

  GetSpecializationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Specialization>>> call([NoParam? params]) {
    return repository.getSpecializations();
  }
}
