import 'package:fpdart/fpdart.dart';

import '../../../../core/shared/failures.dart';
import '../../data/models/notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications(String role);
  Future<Either<Failure, Notification>> getNotificationDetail(
    String role,
    String id,
  );
  Future<Either<Failure, Unit>> markAllAsRead(String role);
}
