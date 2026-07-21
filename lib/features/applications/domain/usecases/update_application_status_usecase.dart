import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/application.dart';
import '../repositories/application_repository.dart';

class UpdateApplicationStatusParams {
  final String id;
  final String status;
  UpdateApplicationStatusParams({required this.id, required this.status});
}

@lazySingleton
class UpdateApplicationStatusUseCase implements UseCase<Application, UpdateApplicationStatusParams> {
  final ApplicationRepository repository;

  UpdateApplicationStatusUseCase(this.repository);

  @override
  Future<Either<Failure, Application>> call([UpdateApplicationStatusParams? params]) {
    return repository.updateApplicationStatus(params!.id, params.status);
  }
}
