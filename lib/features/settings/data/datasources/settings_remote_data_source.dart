import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/shared/models/base_result.dart';
import '../models/user_settings.dart';

part 'settings_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class SettingsRemoteDataSource {
  @factoryMethod
  factory SettingsRemoteDataSource(Dio dio) = _SettingsRemoteDataSource;

  @GET('/mobile/candidate/settings')
  Future<BaseResult<UserSettings>> getCandidateSettings();

  @PUT('/mobile/candidate/settings')
  Future<BaseResult<NotificationSettings>> updateCandidateSettings(
    @Body() Map<String, dynamic> body,
  );
}
