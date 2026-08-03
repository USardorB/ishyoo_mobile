// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'notification.dart';

class NotificationMapper extends ClassMapperBase<Notification> {
  NotificationMapper._();

  static NotificationMapper? _instance;
  static NotificationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NotificationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Notification';

  static int _$id(Notification v) => v.id;
  static const Field<Notification, int> _f$id = Field('id', _$id);
  static String _$type(Notification v) => v.type;
  static const Field<Notification, String> _f$type = Field('type', _$type);
  static String _$title(Notification v) => v.title;
  static const Field<Notification, String> _f$title = Field('title', _$title);
  static String _$message(Notification v) => v.message;
  static const Field<Notification, String> _f$message = Field(
    'message',
    _$message,
  );
  static bool _$isRead(Notification v) => v.isRead;
  static const Field<Notification, bool> _f$isRead = Field(
    'isRead',
    _$isRead,
    key: r'is_read',
  );
  static DateTime? _$createdAt(Notification v) => v.createdAt;
  static const Field<Notification, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static DateTime? _$updatedAt(Notification v) => v.updatedAt;
  static const Field<Notification, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$userId(Notification v) => v.userId;
  static const Field<Notification, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );

  @override
  final MappableFields<Notification> fields = const {
    #id: _f$id,
    #type: _f$type,
    #title: _f$title,
    #message: _f$message,
    #isRead: _f$isRead,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #userId: _f$userId,
  };

  static Notification _instantiate(DecodingData data) {
    return Notification(
      id: data.dec(_f$id),
      type: data.dec(_f$type),
      title: data.dec(_f$title),
      message: data.dec(_f$message),
      isRead: data.dec(_f$isRead),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      userId: data.dec(_f$userId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Notification fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Notification>(map);
  }

  static Notification fromJson(String json) {
    return ensureInitialized().decodeJson<Notification>(json);
  }
}

mixin NotificationMappable {
  String toJson() {
    return NotificationMapper.ensureInitialized().encodeJson<Notification>(
      this as Notification,
    );
  }

  Map<String, dynamic> toMap() {
    return NotificationMapper.ensureInitialized().encodeMap<Notification>(
      this as Notification,
    );
  }

  NotificationCopyWith<Notification, Notification, Notification> get copyWith =>
      _NotificationCopyWithImpl<Notification, Notification>(
        this as Notification,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return NotificationMapper.ensureInitialized().stringifyValue(
      this as Notification,
    );
  }

  @override
  bool operator ==(Object other) {
    return NotificationMapper.ensureInitialized().equalsValue(
      this as Notification,
      other,
    );
  }

  @override
  int get hashCode {
    return NotificationMapper.ensureInitialized().hashValue(
      this as Notification,
    );
  }
}

extension NotificationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Notification, $Out> {
  NotificationCopyWith<$R, Notification, $Out> get $asNotification =>
      $base.as((v, t, t2) => _NotificationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NotificationCopyWith<$R, $In extends Notification, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    int? id,
    String? type,
    String? title,
    String? message,
    bool? isRead,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
  });
  NotificationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _NotificationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Notification, $Out>
    implements NotificationCopyWith<$R, Notification, $Out> {
  _NotificationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Notification> $mapper =
      NotificationMapper.ensureInitialized();
  @override
  $R call({
    int? id,
    String? type,
    String? title,
    String? message,
    bool? isRead,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? userId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (type != null) #type: type,
      if (title != null) #title: title,
      if (message != null) #message: message,
      if (isRead != null) #isRead: isRead,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (userId != $none) #userId: userId,
    }),
  );
  @override
  Notification $make(CopyWithData data) => Notification(
    id: data.get(#id, or: $value.id),
    type: data.get(#type, or: $value.type),
    title: data.get(#title, or: $value.title),
    message: data.get(#message, or: $value.message),
    isRead: data.get(#isRead, or: $value.isRead),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    userId: data.get(#userId, or: $value.userId),
  );

  @override
  NotificationCopyWith<$R2, Notification, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _NotificationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

