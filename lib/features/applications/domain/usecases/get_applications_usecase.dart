import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/application.dart';
import '../repositories/application_repository.dart';

class GetApplicationsParams {
  final String? status;
  GetApplicationsParams({this.status});
}

@lazySingleton
class GetApplicationsUseCase
    implements UseCase<List<Application>, GetApplicationsParams> {
  final ApplicationRepository repository;

  GetApplicationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Application>>> call([
    GetApplicationsParams? params,
  ]) {
    return repository.getApplications(status: params?.status);
  }
}
