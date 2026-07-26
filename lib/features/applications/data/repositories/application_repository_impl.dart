import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../domain/repositories/application_repository.dart';
import '../datasources/application_remote_data_source.dart';
import '../models/application.dart';

@LazySingleton(as: ApplicationRepository)
class ApplicationRepositoryImpl implements ApplicationRepository {
  final ApplicationRemoteDataSource remoteDataSource;

  ApplicationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Application>>> getApplications({String? status}) {
    return remoteDataSource.getApplications(status: status).asEither();
  }

  @override
  Future<Either<Failure, Application>> getApplicationDetail(String id) {
    return remoteDataSource.getApplicationDetail(id).asEither();
  }

  @override
  Future<Either<Failure, Application>> updateApplicationStatus(
    String id,
    String status,
  ) {
    return remoteDataSource.updateApplicationStatus(id, {
      'status': status,
    }).asEither();
  }
}
