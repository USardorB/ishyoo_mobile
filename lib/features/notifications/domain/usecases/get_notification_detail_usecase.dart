import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/notification.dart';
import '../repositories/notification_repository.dart';

class GetNotificationDetailParams {
  final String role;
  final String id;
  GetNotificationDetailParams(this.role, this.id);
}

@lazySingleton
class GetNotificationDetailUseCase implements UseCase<Notification, GetNotificationDetailParams> {
  final NotificationRepository repository;

  GetNotificationDetailUseCase(this.repository);

  @override
  Future<Either<Failure, Notification>> call([GetNotificationDetailParams? params]) {
    return repository.getNotificationDetail(params!.role, params.id);
  }
}
