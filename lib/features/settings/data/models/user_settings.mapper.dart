// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_settings.dart';

class UserSessionMapper extends ClassMapperBase<UserSession> {
  UserSessionMapper._();

  static UserSessionMapper? _instance;
  static UserSessionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSessionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserSession';

  static String _$id(UserSession v) => v.id;
  static const Field<UserSession, String> _f$id = Field('id', _$id);
  static String? _$deviceId(UserSession v) => v.deviceId;
  static const Field<UserSession, String> _f$deviceId = Field(
    'deviceId',
    _$deviceId,
    key: r'device_id',
    opt: true,
  );
  static String? _$deviceName(UserSession v) => v.deviceName;
  static const Field<UserSession, String> _f$deviceName = Field(
    'deviceName',
    _$deviceName,
    key: r'device_name',
    opt: true,
  );
  static String? _$fcmToken(UserSession v) => v.fcmToken;
  static const Field<UserSession, String> _f$fcmToken = Field(
    'fcmToken',
    _$fcmToken,
    key: r'fcm_token',
    opt: true,
  );
  static String? _$loginedAt(UserSession v) => v.loginedAt;
  static const Field<UserSession, String> _f$loginedAt = Field(
    'loginedAt',
    _$loginedAt,
    key: r'logined_at',
    opt: true,
  );
  static bool? _$isTerminated(UserSession v) => v.isTerminated;
  static const Field<UserSession, bool> _f$isTerminated = Field(
    'isTerminated',
    _$isTerminated,
    key: r'is_teminated',
    opt: true,
  );

  @override
  final MappableFields<UserSession> fields = const {
    #id: _f$id,
    #deviceId: _f$deviceId,
    #deviceName: _f$deviceName,
    #fcmToken: _f$fcmToken,
    #loginedAt: _f$loginedAt,
    #isTerminated: _f$isTerminated,
  };

  static UserSession _instantiate(DecodingData data) {
    return UserSession(
      id: data.dec(_f$id),
      deviceId: data.dec(_f$deviceId),
      deviceName: data.dec(_f$deviceName),
      fcmToken: data.dec(_f$fcmToken),
      loginedAt: data.dec(_f$loginedAt),
      isTerminated: data.dec(_f$isTerminated),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserSession fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSession>(map);
  }

  static UserSession fromJson(String json) {
    return ensureInitialized().decodeJson<UserSession>(json);
  }
}

mixin UserSessionMappable {
  String toJson() {
    return UserSessionMapper.ensureInitialized().encodeJson<UserSession>(
      this as UserSession,
    );
  }

  Map<String, dynamic> toMap() {
    return UserSessionMapper.ensureInitialized().encodeMap<UserSession>(
      this as UserSession,
    );
  }

  UserSessionCopyWith<UserSession, UserSession, UserSession> get copyWith =>
      _UserSessionCopyWithImpl<UserSession, UserSession>(
        this as UserSession,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserSessionMapper.ensureInitialized().stringifyValue(
      this as UserSession,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserSessionMapper.ensureInitialized().equalsValue(
      this as UserSession,
      other,
    );
  }

  @override
  int get hashCode {
    return UserSessionMapper.ensureInitialized().hashValue(this as UserSession);
  }
}

extension UserSessionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSession, $Out> {
  UserSessionCopyWith<$R, UserSession, $Out> get $asUserSession =>
      $base.as((v, t, t2) => _UserSessionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserSessionCopyWith<$R, $In extends UserSession, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? deviceId,
    String? deviceName,
    String? fcmToken,
    String? loginedAt,
    bool? isTerminated,
  });
  UserSessionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserSessionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSession, $Out>
    implements UserSessionCopyWith<$R, UserSession, $Out> {
  _UserSessionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSession> $mapper =
      UserSessionMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? deviceId = $none,
    Object? deviceName = $none,
    Object? fcmToken = $none,
    Object? loginedAt = $none,
    Object? isTerminated = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (deviceId != $none) #deviceId: deviceId,
      if (deviceName != $none) #deviceName: deviceName,
      if (fcmToken != $none) #fcmToken: fcmToken,
      if (loginedAt != $none) #loginedAt: loginedAt,
      if (isTerminated != $none) #isTerminated: isTerminated,
    }),
  );
  @override
  UserSession $make(CopyWithData data) => UserSession(
    id: data.get(#id, or: $value.id),
    deviceId: data.get(#deviceId, or: $value.deviceId),
    deviceName: data.get(#deviceName, or: $value.deviceName),
    fcmToken: data.get(#fcmToken, or: $value.fcmToken),
    loginedAt: data.get(#loginedAt, or: $value.loginedAt),
    isTerminated: data.get(#isTerminated, or: $value.isTerminated),
  );

  @override
  UserSessionCopyWith<$R2, UserSession, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserSessionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class NotificationSettingsMapper extends ClassMapperBase<NotificationSettings> {
  NotificationSettingsMapper._();

  static NotificationSettingsMapper? _instance;
  static NotificationSettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationSettingsMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'NotificationSettings';

  static String _$id(NotificationSettings v) => v.id;
  static const Field<NotificationSettings, String> _f$id = Field('id', _$id);
  static bool? _$smsEnabled(NotificationSettings v) => v.smsEnabled;
  static const Field<NotificationSettings, bool> _f$smsEnabled = Field(
    'smsEnabled',
    _$smsEnabled,
    key: r'sms_enabled',
    opt: true,
  );
  static bool? _$applicationUpdates(NotificationSettings v) =>
      v.applicationUpdates;
  static const Field<NotificationSettings, bool> _f$applicationUpdates = Field(
    'applicationUpdates',
    _$applicationUpdates,
    key: r'application_updates',
    opt: true,
  );
  static bool? _$messages(NotificationSettings v) => v.messages;
  static const Field<NotificationSettings, bool> _f$messages = Field(
    'messages',
    _$messages,
    opt: true,
  );
  static bool? _$interviews(NotificationSettings v) => v.interviews;
  static const Field<NotificationSettings, bool> _f$interviews = Field(
    'interviews',
    _$interviews,
    opt: true,
  );
  static bool? _$recommendations(NotificationSettings v) => v.recommendations;
  static const Field<NotificationSettings, bool> _f$recommendations = Field(
    'recommendations',
    _$recommendations,
    opt: true,
  );
  static String? _$createdAt(NotificationSettings v) => v.createdAt;
  static const Field<NotificationSettings, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$updatedAt(NotificationSettings v) => v.updatedAt;
  static const Field<NotificationSettings, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );

  @override
  final MappableFields<NotificationSettings> fields = const {
    #id: _f$id,
    #smsEnabled: _f$smsEnabled,
    #applicationUpdates: _f$applicationUpdates,
    #messages: _f$messages,
    #interviews: _f$interviews,
    #recommendations: _f$recommendations,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
  };

  static NotificationSettings _instantiate(DecodingData data) {
    return NotificationSettings(
      id: data.dec(_f$id),
      smsEnabled: data.dec(_f$smsEnabled),
      applicationUpdates: data.dec(_f$applicationUpdates),
      messages: data.dec(_f$messages),
      interviews: data.dec(_f$interviews),
      recommendations: data.dec(_f$recommendations),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static NotificationSettings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NotificationSettings>(map);
  }

  static NotificationSettings fromJson(String json) {
    return ensureInitialized().decodeJson<NotificationSettings>(json);
  }
}

mixin NotificationSettingsMappable {
  String toJson() {
    return NotificationSettingsMapper.ensureInitialized()
        .encodeJson<NotificationSettings>(this as NotificationSettings);
  }

  Map<String, dynamic> toMap() {
    return NotificationSettingsMapper.ensureInitialized()
        .encodeMap<NotificationSettings>(this as NotificationSettings);
  }

  NotificationSettingsCopyWith<
    NotificationSettings,
    NotificationSettings,
    NotificationSettings
  >
  get copyWith =>
      _NotificationSettingsCopyWithImpl<
        NotificationSettings,
        NotificationSettings
      >(this as NotificationSettings, $identity, $identity);
  @override
  String toString() {
    return NotificationSettingsMapper.ensureInitialized().stringifyValue(
      this as NotificationSettings,
    );
  }

  @override
  bool operator ==(Object other) {
    return NotificationSettingsMapper.ensureInitialized().equalsValue(
      this as NotificationSettings,
      other,
    );
  }

  @override
  int get hashCode {
    return NotificationSettingsMapper.ensureInitialized().hashValue(
      this as NotificationSettings,
    );
  }
}

extension NotificationSettingsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NotificationSettings, $Out> {
  NotificationSettingsCopyWith<$R, NotificationSettings, $Out>
  get $asNotificationSettings => $base.as(
    (v, t, t2) => _NotificationSettingsCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class NotificationSettingsCopyWith<
  $R,
  $In extends NotificationSettings,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    bool? smsEnabled,
    bool? applicationUpdates,
    bool? messages,
    bool? interviews,
    bool? recommendations,
    String? createdAt,
    String? updatedAt,
  });
  NotificationSettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _NotificationSettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NotificationSettings, $Out>
    implements NotificationSettingsCopyWith<$R, NotificationSettings, $Out> {
  _NotificationSettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NotificationSettings> $mapper =
      NotificationSettingsMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? smsEnabled = $none,
    Object? applicationUpdates = $none,
    Object? messages = $none,
    Object? interviews = $none,
    Object? recommendations = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (smsEnabled != $none) #smsEnabled: smsEnabled,
      if (applicationUpdates != $none) #applicationUpdates: applicationUpdates,
      if (messages != $none) #messages: messages,
      if (interviews != $none) #interviews: interviews,
      if (recommendations != $none) #recommendations: recommendations,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
    }),
  );
  @override
  NotificationSettings $make(CopyWithData data) => NotificationSettings(
    id: data.get(#id, or: $value.id),
    smsEnabled: data.get(#smsEnabled, or: $value.smsEnabled),
    applicationUpdates: data.get(
      #applicationUpdates,
      or: $value.applicationUpdates,
    ),
    messages: data.get(#messages, or: $value.messages),
    interviews: data.get(#interviews, or: $value.interviews),
    recommendations: data.get(#recommendations, or: $value.recommendations),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
  );

  @override
  NotificationSettingsCopyWith<$R2, NotificationSettings, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _NotificationSettingsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserSettingsMapper extends ClassMapperBase<UserSettings> {
  UserSettingsMapper._();

  static UserSettingsMapper? _instance;
  static UserSettingsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserSettingsMapper._());
      UserSessionMapper.ensureInitialized();
      NotificationSettingsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserSettings';

  static int _$id(UserSettings v) => v.id;
  static const Field<UserSettings, int> _f$id = Field('id', _$id);
  static String? _$userId(UserSettings v) => v.userId;
  static const Field<UserSettings, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );
  static List<UserSession>? _$sessions(UserSettings v) => v.sessions;
  static const Field<UserSettings, List<UserSession>> _f$sessions = Field(
    'sessions',
    _$sessions,
    opt: true,
  );
  static List<NotificationSettings>? _$notifications(UserSettings v) =>
      v.notifications;
  static const Field<UserSettings, List<NotificationSettings>>
  _f$notifications = Field('notifications', _$notifications, opt: true);

  @override
  final MappableFields<UserSettings> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #sessions: _f$sessions,
    #notifications: _f$notifications,
  };

  static UserSettings _instantiate(DecodingData data) {
    return UserSettings(
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
      sessions: data.dec(_f$sessions),
      notifications: data.dec(_f$notifications),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserSettings fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserSettings>(map);
  }

  static UserSettings fromJson(String json) {
    return ensureInitialized().decodeJson<UserSettings>(json);
  }
}

mixin UserSettingsMappable {
  String toJson() {
    return UserSettingsMapper.ensureInitialized().encodeJson<UserSettings>(
      this as UserSettings,
    );
  }

  Map<String, dynamic> toMap() {
    return UserSettingsMapper.ensureInitialized().encodeMap<UserSettings>(
      this as UserSettings,
    );
  }

  UserSettingsCopyWith<UserSettings, UserSettings, UserSettings> get copyWith =>
      _UserSettingsCopyWithImpl<UserSettings, UserSettings>(
        this as UserSettings,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserSettingsMapper.ensureInitialized().stringifyValue(
      this as UserSettings,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserSettingsMapper.ensureInitialized().equalsValue(
      this as UserSettings,
      other,
    );
  }

  @override
  int get hashCode {
    return UserSettingsMapper.ensureInitialized().hashValue(
      this as UserSettings,
    );
  }
}

extension UserSettingsValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserSettings, $Out> {
  UserSettingsCopyWith<$R, UserSettings, $Out> get $asUserSettings =>
      $base.as((v, t, t2) => _UserSettingsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserSettingsCopyWith<$R, $In extends UserSettings, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    UserSession,
    UserSessionCopyWith<$R, UserSession, UserSession>
  >?
  get sessions;
  ListCopyWith<
    $R,
    NotificationSettings,
    NotificationSettingsCopyWith<$R, NotificationSettings, NotificationSettings>
  >?
  get notifications;
  $R call({
    int? id,
    String? userId,
    List<UserSession>? sessions,
    List<NotificationSettings>? notifications,
  });
  UserSettingsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _UserSettingsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserSettings, $Out>
    implements UserSettingsCopyWith<$R, UserSettings, $Out> {
  _UserSettingsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserSettings> $mapper =
      UserSettingsMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    UserSession,
    UserSessionCopyWith<$R, UserSession, UserSession>
  >?
  get sessions => $value.sessions != null
      ? ListCopyWith(
          $value.sessions!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(sessions: v),
        )
      : null;
  @override
  ListCopyWith<
    $R,
    NotificationSettings,
    NotificationSettingsCopyWith<$R, NotificationSettings, NotificationSettings>
  >?
  get notifications => $value.notifications != null
      ? ListCopyWith(
          $value.notifications!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(notifications: v),
        )
      : null;
  @override
  $R call({
    int? id,
    Object? userId = $none,
    Object? sessions = $none,
    Object? notifications = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (userId != $none) #userId: userId,
      if (sessions != $none) #sessions: sessions,
      if (notifications != $none) #notifications: notifications,
    }),
  );
  @override
  UserSettings $make(CopyWithData data) => UserSettings(
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
    sessions: data.get(#sessions, or: $value.sessions),
    notifications: data.get(#notifications, or: $value.notifications),
  );

  @override
  UserSettingsCopyWith<$R2, UserSettings, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserSettingsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

