import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/shared/usecase.dart';
import '../repositories/notification_repository.dart';

class MarkAllNotificationsAsReadParams {
  final String role;
  MarkAllNotificationsAsReadParams(this.role);
}

@lazySingleton
class MarkAllNotificationsAsReadUseCase
    implements UseCase<Unit, MarkAllNotificationsAsReadParams> {
  final NotificationRepository repository;

  MarkAllNotificationsAsReadUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call([
    MarkAllNotificationsAsReadParams? params,
  ]) {
    return repository.markAllAsRead(params!.role);
  }
}
