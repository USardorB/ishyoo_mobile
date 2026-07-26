import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/failures.dart';
import '../../data/models/application.dart';

abstract class ApplicationRepository {
  Future<Either<Failure, List<Application>>> getApplications({String? status});
  Future<Either<Failure, Application>> getApplicationDetail(String id);
  Future<Either<Failure, Application>> updateApplicationStatus(
    String id,
    String status,
  );
}
