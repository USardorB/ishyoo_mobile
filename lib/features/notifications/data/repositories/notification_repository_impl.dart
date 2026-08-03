import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../data/datasources/notification_remote_data_source.dart';
import '../../data/models/notification.dart';
import '../../domain/repositories/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Notification>>> getNotifications(String role) {
    return remoteDataSource.getNotifications(role).asEither();
  }

  @override
  Future<Either<Failure, Notification>> getNotificationDetail(
    String role,
    String id,
  ) {
    return remoteDataSource.getNotificationDetail(role, id).asEither();
  }

  @override
  Future<Either<Failure, Unit>> markAllAsRead(String role) {
    return remoteDataSource.markAllAsRead(role).asEither();
  }
}
