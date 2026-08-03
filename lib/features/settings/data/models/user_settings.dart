import 'package:dart_mappable/dart_mappable.dart';

part 'user_settings.mapper.dart';

@MappableClass()
class UserSession with UserSessionMappable {
  final String id;
  @MappableField(key: 'device_id')
  final String? deviceId;
  @MappableField(key: 'device_name')
  final String? deviceName;
  @MappableField(key: 'fcm_token')
  final String? fcmToken;
  @MappableField(key: 'logined_at')
  final String? loginedAt;
  @MappableField(key: 'is_teminated')
  final bool? isTerminated;

  UserSession({
    required this.id,
    this.deviceId,
    this.deviceName,
    this.fcmToken,
    this.loginedAt,
    this.isTerminated,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      UserSessionMapper.fromMap(json);
}

@MappableClass()
class NotificationSettings with NotificationSettingsMappable {
  final String id;
  @MappableField(key: 'sms_enabled')
  final bool? smsEnabled;
  @MappableField(key: 'application_updates')
  final bool? applicationUpdates;
  final bool? messages;
  final bool? interviews;
  final bool? recommendations;
  @MappableField(key: 'created_at')
  final String? createdAt;
  @MappableField(key: 'updated_at')
  final String? updatedAt;

  NotificationSettings({
    required this.id,
    this.smsEnabled,
    this.applicationUpdates,
    this.messages,
    this.interviews,
    this.recommendations,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      NotificationSettingsMapper.fromMap(json);
}

@MappableClass()
class UserSettings with UserSettingsMappable {
  final int id;
  @MappableField(key: 'user_id')
  final String? userId;
  final List<UserSession>? sessions;
  final List<NotificationSettings>? notifications;

  UserSettings({
    required this.id,
    this.userId,
    this.sessions,
    this.notifications,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      UserSettingsMapper.fromMap(json);
}
