import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/shared/models/base_result.dart';
import '../models/notification.dart';

part 'notification_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class NotificationRemoteDataSource {
  @factoryMethod
  factory NotificationRemoteDataSource(Dio dio) = _NotificationRemoteDataSource;

  @GET('/mobile/{role}/notifications')
  Future<BaseResult<List<Notification>>> getNotifications(
    @Path('role') String role,
  );

  @GET('/mobile/{role}/notifications/{id}')
  Future<BaseResult<Notification>> getNotificationDetail(
    @Path('role') String role,
    @Path('id') String id,
  );

  @PUT('/mobile/{role}/notifications')
  Future<BaseResult<dynamic>> markAllAsRead(
    @Path('role') String role,
  );
}
