// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat.dart';

class ChatPartnerMapper extends ClassMapperBase<ChatPartner> {
  ChatPartnerMapper._();

  static ChatPartnerMapper? _instance;
  static ChatPartnerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatPartnerMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatPartner';

  static String? _$name(ChatPartner v) => v.name;
  static const Field<ChatPartner, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$specialization(ChatPartner v) => v.specialization;
  static const Field<ChatPartner, String> _f$specialization = Field(
    'specialization',
    _$specialization,
    opt: true,
  );
  static String? _$avatar(ChatPartner v) => v.avatar;
  static const Field<ChatPartner, String> _f$avatar = Field(
    'avatar',
    _$avatar,
    opt: true,
  );

  @override
  final MappableFields<ChatPartner> fields = const {
    #name: _f$name,
    #specialization: _f$specialization,
    #avatar: _f$avatar,
  };

  static ChatPartner _instantiate(DecodingData data) {
    return ChatPartner(
      name: data.dec(_f$name),
      specialization: data.dec(_f$specialization),
      avatar: data.dec(_f$avatar),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatPartner fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatPartner>(map);
  }

  static ChatPartner fromJson(String json) {
    return ensureInitialized().decodeJson<ChatPartner>(json);
  }
}

mixin ChatPartnerMappable {
  String toJson() {
    return ChatPartnerMapper.ensureInitialized().encodeJson<ChatPartner>(
      this as ChatPartner,
    );
  }

  Map<String, dynamic> toMap() {
    return ChatPartnerMapper.ensureInitialized().encodeMap<ChatPartner>(
      this as ChatPartner,
    );
  }

  ChatPartnerCopyWith<ChatPartner, ChatPartner, ChatPartner> get copyWith =>
      _ChatPartnerCopyWithImpl<ChatPartner, ChatPartner>(
        this as ChatPartner,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatPartnerMapper.ensureInitialized().stringifyValue(
      this as ChatPartner,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatPartnerMapper.ensureInitialized().equalsValue(
      this as ChatPartner,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatPartnerMapper.ensureInitialized().hashValue(this as ChatPartner);
  }
}

extension ChatPartnerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatPartner, $Out> {
  ChatPartnerCopyWith<$R, ChatPartner, $Out> get $asChatPartner =>
      $base.as((v, t, t2) => _ChatPartnerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatPartnerCopyWith<$R, $In extends ChatPartner, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? specialization, String? avatar});
  ChatPartnerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatPartnerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatPartner, $Out>
    implements ChatPartnerCopyWith<$R, ChatPartner, $Out> {
  _ChatPartnerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatPartner> $mapper =
      ChatPartnerMapper.ensureInitialized();
  @override
  $R call({
    Object? name = $none,
    Object? specialization = $none,
    Object? avatar = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (specialization != $none) #specialization: specialization,
      if (avatar != $none) #avatar: avatar,
    }),
  );
  @override
  ChatPartner $make(CopyWithData data) => ChatPartner(
    name: data.get(#name, or: $value.name),
    specialization: data.get(#specialization, or: $value.specialization),
    avatar: data.get(#avatar, or: $value.avatar),
  );

  @override
  ChatPartnerCopyWith<$R2, ChatPartner, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatPartnerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChatCountMapper extends ClassMapperBase<ChatCount> {
  ChatCountMapper._();

  static ChatCountMapper? _instance;
  static ChatCountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatCountMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatCount';

  static int? _$messages(ChatCount v) => v.messages;
  static const Field<ChatCount, int> _f$messages = Field(
    'messages',
    _$messages,
    opt: true,
  );

  @override
  final MappableFields<ChatCount> fields = const {#messages: _f$messages};

  static ChatCount _instantiate(DecodingData data) {
    return ChatCount(messages: data.dec(_f$messages));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatCount fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatCount>(map);
  }

  static ChatCount fromJson(String json) {
    return ensureInitialized().decodeJson<ChatCount>(json);
  }
}

mixin ChatCountMappable {
  String toJson() {
    return ChatCountMapper.ensureInitialized().encodeJson<ChatCount>(
      this as ChatCount,
    );
  }

  Map<String, dynamic> toMap() {
    return ChatCountMapper.ensureInitialized().encodeMap<ChatCount>(
      this as ChatCount,
    );
  }

  ChatCountCopyWith<ChatCount, ChatCount, ChatCount> get copyWith =>
      _ChatCountCopyWithImpl<ChatCount, ChatCount>(
        this as ChatCount,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatCountMapper.ensureInitialized().stringifyValue(
      this as ChatCount,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatCountMapper.ensureInitialized().equalsValue(
      this as ChatCount,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatCountMapper.ensureInitialized().hashValue(this as ChatCount);
  }
}

extension ChatCountValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatCount, $Out> {
  ChatCountCopyWith<$R, ChatCount, $Out> get $asChatCount =>
      $base.as((v, t, t2) => _ChatCountCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatCountCopyWith<$R, $In extends ChatCount, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? messages});
  ChatCountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatCountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatCount, $Out>
    implements ChatCountCopyWith<$R, ChatCount, $Out> {
  _ChatCountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatCount> $mapper =
      ChatCountMapper.ensureInitialized();
  @override
  $R call({Object? messages = $none}) =>
      $apply(FieldCopyWithData({if (messages != $none) #messages: messages}));
  @override
  ChatCount $make(CopyWithData data) =>
      ChatCount(messages: data.get(#messages, or: $value.messages));

  @override
  ChatCountCopyWith<$R2, ChatCount, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatCountCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChatMapper extends ClassMapperBase<Chat> {
  ChatMapper._();

  static ChatMapper? _instance;
  static ChatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatMapper._());
      ChatCountMapper.ensureInitialized();
      MessageMapper.ensureInitialized();
      ChatPartnerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Chat';

  static String _$id(Chat v) => v.id;
  static const Field<Chat, String> _f$id = Field('id', _$id);
  static String? _$status(Chat v) => v.status;
  static const Field<Chat, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static DateTime? _$createdAt(Chat v) => v.createdAt;
  static const Field<Chat, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static int? _$applicationId(Chat v) => v.applicationId;
  static const Field<Chat, int> _f$applicationId = Field(
    'applicationId',
    _$applicationId,
    key: r'application_id',
    opt: true,
  );
  static ChatCount? _$count(Chat v) => v.count;
  static const Field<Chat, ChatCount> _f$count = Field(
    'count',
    _$count,
    key: r'_count',
    opt: true,
  );
  static Map<String, dynamic>? _$application(Chat v) => v.application;
  static const Field<Chat, Map<String, dynamic>> _f$application = Field(
    'application',
    _$application,
    opt: true,
  );
  static List<Message>? _$messages(Chat v) => v.messages;
  static const Field<Chat, List<Message>> _f$messages = Field(
    'messages',
    _$messages,
    opt: true,
  );
  static ChatPartner? _$partner(Chat v) => v.partner;
  static const Field<Chat, ChatPartner> _f$partner = Field(
    'partner',
    _$partner,
    opt: true,
  );

  @override
  final MappableFields<Chat> fields = const {
    #id: _f$id,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #applicationId: _f$applicationId,
    #count: _f$count,
    #application: _f$application,
    #messages: _f$messages,
    #partner: _f$partner,
  };

  static Chat _instantiate(DecodingData data) {
    return Chat(
      id: data.dec(_f$id),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      applicationId: data.dec(_f$applicationId),
      count: data.dec(_f$count),
      application: data.dec(_f$application),
      messages: data.dec(_f$messages),
      partner: data.dec(_f$partner),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Chat fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Chat>(map);
  }

  static Chat fromJson(String json) {
    return ensureInitialized().decodeJson<Chat>(json);
  }
}

mixin ChatMappable {
  String toJson() {
    return ChatMapper.ensureInitialized().encodeJson<Chat>(this as Chat);
  }

  Map<String, dynamic> toMap() {
    return ChatMapper.ensureInitialized().encodeMap<Chat>(this as Chat);
  }

  ChatCopyWith<Chat, Chat, Chat> get copyWith =>
      _ChatCopyWithImpl<Chat, Chat>(this as Chat, $identity, $identity);
  @override
  String toString() {
    return ChatMapper.ensureInitialized().stringifyValue(this as Chat);
  }

  @override
  bool operator ==(Object other) {
    return ChatMapper.ensureInitialized().equalsValue(this as Chat, other);
  }

  @override
  int get hashCode {
    return ChatMapper.ensureInitialized().hashValue(this as Chat);
  }
}

extension ChatValueCopy<$R, $Out> on ObjectCopyWith<$R, Chat, $Out> {
  ChatCopyWith<$R, Chat, $Out> get $asChat =>
      $base.as((v, t, t2) => _ChatCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatCopyWith<$R, $In extends Chat, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ChatCountCopyWith<$R, ChatCount, ChatCount>? get count;
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>?
  get application;
  ListCopyWith<$R, Message, MessageCopyWith<$R, Message, Message>>?
  get messages;
  ChatPartnerCopyWith<$R, ChatPartner, ChatPartner>? get partner;
  $R call({
    String? id,
    String? status,
    DateTime? createdAt,
    int? applicationId,
    ChatCount? count,
    Map<String, dynamic>? application,
    List<Message>? messages,
    ChatPartner? partner,
  });
  ChatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Chat, $Out>
    implements ChatCopyWith<$R, Chat, $Out> {
  _ChatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Chat> $mapper = ChatMapper.ensureInitialized();
  @override
  ChatCountCopyWith<$R, ChatCount, ChatCount>? get count =>
      $value.count?.copyWith.$chain((v) => call(count: v));
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>?>?
  get application => $value.application != null
      ? MapCopyWith(
          $value.application!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(application: v),
        )
      : null;
  @override
  ListCopyWith<$R, Message, MessageCopyWith<$R, Message, Message>>?
  get messages => $value.messages != null
      ? ListCopyWith(
          $value.messages!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(messages: v),
        )
      : null;
  @override
  ChatPartnerCopyWith<$R, ChatPartner, ChatPartner>? get partner =>
      $value.partner?.copyWith.$chain((v) => call(partner: v));
  @override
  $R call({
    String? id,
    Object? status = $none,
    Object? createdAt = $none,
    Object? applicationId = $none,
    Object? count = $none,
    Object? application = $none,
    Object? messages = $none,
    Object? partner = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (status != $none) #status: status,
      if (createdAt != $none) #createdAt: createdAt,
      if (applicationId != $none) #applicationId: applicationId,
      if (count != $none) #count: count,
      if (application != $none) #application: application,
      if (messages != $none) #messages: messages,
      if (partner != $none) #partner: partner,
    }),
  );
  @override
  Chat $make(CopyWithData data) => Chat(
    id: data.get(#id, or: $value.id),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    applicationId: data.get(#applicationId, or: $value.applicationId),
    count: data.get(#count, or: $value.count),
    application: data.get(#application, or: $value.application),
    messages: data.get(#messages, or: $value.messages),
    partner: data.get(#partner, or: $value.partner),
  );

  @override
  ChatCopyWith<$R2, Chat, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChatCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

