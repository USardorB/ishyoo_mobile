// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'message.dart';

class MessageMapper extends ClassMapperBase<Message> {
  MessageMapper._();

  static MessageMapper? _instance;
  static MessageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MessageMapper._());
      ChatFileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Message';

  static String _$id(Message v) => v.id;
  static const Field<Message, String> _f$id = Field('id', _$id);
  static String? _$type(Message v) => v.type;
  static const Field<Message, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static String? _$content(Message v) => v.content;
  static const Field<Message, String> _f$content = Field(
    'content',
    _$content,
    opt: true,
  );
  static DateTime? _$sendedAt(Message v) => v.sendedAt;
  static const Field<Message, DateTime> _f$sendedAt = Field(
    'sendedAt',
    _$sendedAt,
    key: r'sended_at',
    opt: true,
  );
  static dynamic _$meta(Message v) => v.meta;
  static const Field<Message, dynamic> _f$meta = Field(
    'meta',
    _$meta,
    opt: true,
  );
  static DateTime? _$readAt(Message v) => v.readAt;
  static const Field<Message, DateTime> _f$readAt = Field(
    'readAt',
    _$readAt,
    key: r'read_at',
    opt: true,
  );
  static String? _$senderId(Message v) => v.senderId;
  static const Field<Message, String> _f$senderId = Field(
    'senderId',
    _$senderId,
    key: r'sender_id',
    opt: true,
  );
  static String? _$chatId(Message v) => v.chatId;
  static const Field<Message, String> _f$chatId = Field(
    'chatId',
    _$chatId,
    key: r'chat_id',
    opt: true,
  );
  static List<ChatFile>? _$files(Message v) => v.files;
  static const Field<Message, List<ChatFile>> _f$files = Field(
    'files',
    _$files,
    opt: true,
  );

  @override
  final MappableFields<Message> fields = const {
    #id: _f$id,
    #type: _f$type,
    #content: _f$content,
    #sendedAt: _f$sendedAt,
    #meta: _f$meta,
    #readAt: _f$readAt,
    #senderId: _f$senderId,
    #chatId: _f$chatId,
    #files: _f$files,
  };

  static Message _instantiate(DecodingData data) {
    return Message(
      id: data.dec(_f$id),
      type: data.dec(_f$type),
      content: data.dec(_f$content),
      sendedAt: data.dec(_f$sendedAt),
      meta: data.dec(_f$meta),
      readAt: data.dec(_f$readAt),
      senderId: data.dec(_f$senderId),
      chatId: data.dec(_f$chatId),
      files: data.dec(_f$files),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Message fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Message>(map);
  }

  static Message fromJson(String json) {
    return ensureInitialized().decodeJson<Message>(json);
  }
}

mixin MessageMappable {
  String toJson() {
    return MessageMapper.ensureInitialized().encodeJson<Message>(
      this as Message,
    );
  }

  Map<String, dynamic> toMap() {
    return MessageMapper.ensureInitialized().encodeMap<Message>(
      this as Message,
    );
  }

  MessageCopyWith<Message, Message, Message> get copyWith =>
      _MessageCopyWithImpl<Message, Message>(
        this as Message,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MessageMapper.ensureInitialized().stringifyValue(this as Message);
  }

  @override
  bool operator ==(Object other) {
    return MessageMapper.ensureInitialized().equalsValue(
      this as Message,
      other,
    );
  }

  @override
  int get hashCode {
    return MessageMapper.ensureInitialized().hashValue(this as Message);
  }
}

extension MessageValueCopy<$R, $Out> on ObjectCopyWith<$R, Message, $Out> {
  MessageCopyWith<$R, Message, $Out> get $asMessage =>
      $base.as((v, t, t2) => _MessageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MessageCopyWith<$R, $In extends Message, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, ChatFile, ChatFileCopyWith<$R, ChatFile, ChatFile>>?
  get files;
  $R call({
    String? id,
    String? type,
    String? content,
    DateTime? sendedAt,
    dynamic meta,
    DateTime? readAt,
    String? senderId,
    String? chatId,
    List<ChatFile>? files,
  });
  MessageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MessageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Message, $Out>
    implements MessageCopyWith<$R, Message, $Out> {
  _MessageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Message> $mapper =
      MessageMapper.ensureInitialized();
  @override
  ListCopyWith<$R, ChatFile, ChatFileCopyWith<$R, ChatFile, ChatFile>>?
  get files => $value.files != null
      ? ListCopyWith(
          $value.files!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(files: v),
        )
      : null;
  @override
  $R call({
    String? id,
    Object? type = $none,
    Object? content = $none,
    Object? sendedAt = $none,
    Object? meta = $none,
    Object? readAt = $none,
    Object? senderId = $none,
    Object? chatId = $none,
    Object? files = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (type != $none) #type: type,
      if (content != $none) #content: content,
      if (sendedAt != $none) #sendedAt: sendedAt,
      if (meta != $none) #meta: meta,
      if (readAt != $none) #readAt: readAt,
      if (senderId != $none) #senderId: senderId,
      if (chatId != $none) #chatId: chatId,
      if (files != $none) #files: files,
    }),
  );
  @override
  Message $make(CopyWithData data) => Message(
    id: data.get(#id, or: $value.id),
    type: data.get(#type, or: $value.type),
    content: data.get(#content, or: $value.content),
    sendedAt: data.get(#sendedAt, or: $value.sendedAt),
    meta: data.get(#meta, or: $value.meta),
    readAt: data.get(#readAt, or: $value.readAt),
    senderId: data.get(#senderId, or: $value.senderId),
    chatId: data.get(#chatId, or: $value.chatId),
    files: data.get(#files, or: $value.files),
  );

  @override
  MessageCopyWith<$R2, Message, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MessageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

