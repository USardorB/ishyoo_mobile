// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_file.dart';

class ChatFileMapper extends ClassMapperBase<ChatFile> {
  ChatFileMapper._();

  static ChatFileMapper? _instance;
  static ChatFileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatFileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatFile';

  static String? _$id(ChatFile v) => v.id;
  static const Field<ChatFile, String> _f$id = Field('id', _$id, opt: true);
  static String? _$originalName(ChatFile v) => v.originalName;
  static const Field<ChatFile, String> _f$originalName = Field(
    'originalName',
    _$originalName,
    key: r'original_name',
    opt: true,
  );
  static String? _$filename(ChatFile v) => v.filename;
  static const Field<ChatFile, String> _f$filename = Field(
    'filename',
    _$filename,
    opt: true,
  );
  static String? _$mimeType(ChatFile v) => v.mimeType;
  static const Field<ChatFile, String> _f$mimeType = Field(
    'mimeType',
    _$mimeType,
    key: r'mime_type',
    opt: true,
  );
  static int? _$size(ChatFile v) => v.size;
  static const Field<ChatFile, int> _f$size = Field('size', _$size, opt: true);
  static String? _$type(ChatFile v) => v.type;
  static const Field<ChatFile, String> _f$type = Field(
    'type',
    _$type,
    opt: true,
  );
  static String? _$path(ChatFile v) => v.path;
  static const Field<ChatFile, String> _f$path = Field(
    'path',
    _$path,
    opt: true,
  );
  static DateTime? _$createdAt(ChatFile v) => v.createdAt;
  static const Field<ChatFile, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$messageId(ChatFile v) => v.messageId;
  static const Field<ChatFile, String> _f$messageId = Field(
    'messageId',
    _$messageId,
    key: r'message_id',
    opt: true,
  );
  static String? _$uploadedBy(ChatFile v) => v.uploadedBy;
  static const Field<ChatFile, String> _f$uploadedBy = Field(
    'uploadedBy',
    _$uploadedBy,
    key: r'uploaded_by',
    opt: true,
  );

  @override
  final MappableFields<ChatFile> fields = const {
    #id: _f$id,
    #originalName: _f$originalName,
    #filename: _f$filename,
    #mimeType: _f$mimeType,
    #size: _f$size,
    #type: _f$type,
    #path: _f$path,
    #createdAt: _f$createdAt,
    #messageId: _f$messageId,
    #uploadedBy: _f$uploadedBy,
  };

  static ChatFile _instantiate(DecodingData data) {
    return ChatFile(
      id: data.dec(_f$id),
      originalName: data.dec(_f$originalName),
      filename: data.dec(_f$filename),
      mimeType: data.dec(_f$mimeType),
      size: data.dec(_f$size),
      type: data.dec(_f$type),
      path: data.dec(_f$path),
      createdAt: data.dec(_f$createdAt),
      messageId: data.dec(_f$messageId),
      uploadedBy: data.dec(_f$uploadedBy),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatFile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatFile>(map);
  }

  static ChatFile fromJson(String json) {
    return ensureInitialized().decodeJson<ChatFile>(json);
  }
}

mixin ChatFileMappable {
  String toJson() {
    return ChatFileMapper.ensureInitialized().encodeJson<ChatFile>(
      this as ChatFile,
    );
  }

  Map<String, dynamic> toMap() {
    return ChatFileMapper.ensureInitialized().encodeMap<ChatFile>(
      this as ChatFile,
    );
  }

  ChatFileCopyWith<ChatFile, ChatFile, ChatFile> get copyWith =>
      _ChatFileCopyWithImpl<ChatFile, ChatFile>(
        this as ChatFile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatFileMapper.ensureInitialized().stringifyValue(this as ChatFile);
  }

  @override
  bool operator ==(Object other) {
    return ChatFileMapper.ensureInitialized().equalsValue(
      this as ChatFile,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatFileMapper.ensureInitialized().hashValue(this as ChatFile);
  }
}

extension ChatFileValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatFile, $Out> {
  ChatFileCopyWith<$R, ChatFile, $Out> get $asChatFile =>
      $base.as((v, t, t2) => _ChatFileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatFileCopyWith<$R, $In extends ChatFile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? originalName,
    String? filename,
    String? mimeType,
    int? size,
    String? type,
    String? path,
    DateTime? createdAt,
    String? messageId,
    String? uploadedBy,
  });
  ChatFileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatFileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatFile, $Out>
    implements ChatFileCopyWith<$R, ChatFile, $Out> {
  _ChatFileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatFile> $mapper =
      ChatFileMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    Object? originalName = $none,
    Object? filename = $none,
    Object? mimeType = $none,
    Object? size = $none,
    Object? type = $none,
    Object? path = $none,
    Object? createdAt = $none,
    Object? messageId = $none,
    Object? uploadedBy = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (originalName != $none) #originalName: originalName,
      if (filename != $none) #filename: filename,
      if (mimeType != $none) #mimeType: mimeType,
      if (size != $none) #size: size,
      if (type != $none) #type: type,
      if (path != $none) #path: path,
      if (createdAt != $none) #createdAt: createdAt,
      if (messageId != $none) #messageId: messageId,
      if (uploadedBy != $none) #uploadedBy: uploadedBy,
    }),
  );
  @override
  ChatFile $make(CopyWithData data) => ChatFile(
    id: data.get(#id, or: $value.id),
    originalName: data.get(#originalName, or: $value.originalName),
    filename: data.get(#filename, or: $value.filename),
    mimeType: data.get(#mimeType, or: $value.mimeType),
    size: data.get(#size, or: $value.size),
    type: data.get(#type, or: $value.type),
    path: data.get(#path, or: $value.path),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    messageId: data.get(#messageId, or: $value.messageId),
    uploadedBy: data.get(#uploadedBy, or: $value.uploadedBy),
  );

  @override
  ChatFileCopyWith<$R2, ChatFile, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatFileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

