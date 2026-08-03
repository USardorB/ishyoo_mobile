import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../../data/models/notification.dart';
import '../repositories/notification_repository.dart';

class GetNotificationsParams {
  final String role;
  GetNotificationsParams(this.role);
}

@lazySingleton
class GetNotificationsUseCase
    implements UseCase<List<Notification>, GetNotificationsParams> {
  final NotificationRepository repository;

  GetNotificationsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Notification>>> call([
    GetNotificationsParams? params,
  ]) {
    return repository.getNotifications(params!.role);
  }
}
