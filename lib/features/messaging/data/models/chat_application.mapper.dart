// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_application.dart';

class ChatApplicationMapper extends ClassMapperBase<ChatApplication> {
  ChatApplicationMapper._();

  static ChatApplicationMapper? _instance;
  static ChatApplicationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatApplicationMapper._());
      ChatVacancyMapper.ensureInitialized();
      ChatResumeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatApplication';

  static ChatVacancy? _$vacancy(ChatApplication v) => v.vacancy;
  static const Field<ChatApplication, ChatVacancy> _f$vacancy = Field(
    'vacancy',
    _$vacancy,
    opt: true,
  );
  static ChatResume? _$resume(ChatApplication v) => v.resume;
  static const Field<ChatApplication, ChatResume> _f$resume = Field(
    'resume',
    _$resume,
    opt: true,
  );

  @override
  final MappableFields<ChatApplication> fields = const {
    #vacancy: _f$vacancy,
    #resume: _f$resume,
  };

  static ChatApplication _instantiate(DecodingData data) {
    return ChatApplication(
      vacancy: data.dec(_f$vacancy),
      resume: data.dec(_f$resume),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatApplication fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatApplication>(map);
  }

  static ChatApplication fromJson(String json) {
    return ensureInitialized().decodeJson<ChatApplication>(json);
  }
}

mixin ChatApplicationMappable {
  String toJson() {
    return ChatApplicationMapper.ensureInitialized()
        .encodeJson<ChatApplication>(this as ChatApplication);
  }

  Map<String, dynamic> toMap() {
    return ChatApplicationMapper.ensureInitialized().encodeMap<ChatApplication>(
      this as ChatApplication,
    );
  }

  ChatApplicationCopyWith<ChatApplication, ChatApplication, ChatApplication>
  get copyWith =>
      _ChatApplicationCopyWithImpl<ChatApplication, ChatApplication>(
        this as ChatApplication,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatApplicationMapper.ensureInitialized().stringifyValue(
      this as ChatApplication,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatApplicationMapper.ensureInitialized().equalsValue(
      this as ChatApplication,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatApplicationMapper.ensureInitialized().hashValue(
      this as ChatApplication,
    );
  }
}

extension ChatApplicationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatApplication, $Out> {
  ChatApplicationCopyWith<$R, ChatApplication, $Out> get $asChatApplication =>
      $base.as((v, t, t2) => _ChatApplicationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatApplicationCopyWith<$R, $In extends ChatApplication, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ChatVacancyCopyWith<$R, ChatVacancy, ChatVacancy>? get vacancy;
  ChatResumeCopyWith<$R, ChatResume, ChatResume>? get resume;
  $R call({ChatVacancy? vacancy, ChatResume? resume});
  ChatApplicationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChatApplicationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatApplication, $Out>
    implements ChatApplicationCopyWith<$R, ChatApplication, $Out> {
  _ChatApplicationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatApplication> $mapper =
      ChatApplicationMapper.ensureInitialized();
  @override
  ChatVacancyCopyWith<$R, ChatVacancy, ChatVacancy>? get vacancy =>
      $value.vacancy?.copyWith.$chain((v) => call(vacancy: v));
  @override
  ChatResumeCopyWith<$R, ChatResume, ChatResume>? get resume =>
      $value.resume?.copyWith.$chain((v) => call(resume: v));
  @override
  $R call({Object? vacancy = $none, Object? resume = $none}) => $apply(
    FieldCopyWithData({
      if (vacancy != $none) #vacancy: vacancy,
      if (resume != $none) #resume: resume,
    }),
  );
  @override
  ChatApplication $make(CopyWithData data) => ChatApplication(
    vacancy: data.get(#vacancy, or: $value.vacancy),
    resume: data.get(#resume, or: $value.resume),
  );

  @override
  ChatApplicationCopyWith<$R2, ChatApplication, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatApplicationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChatVacancyMapper extends ClassMapperBase<ChatVacancy> {
  ChatVacancyMapper._();

  static ChatVacancyMapper? _instance;
  static ChatVacancyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatVacancyMapper._());
      ChatOrganizationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatVacancy';

  static String? _$id(ChatVacancy v) => v.id;
  static const Field<ChatVacancy, String> _f$id = Field('id', _$id, opt: true);
  static ChatOrganization? _$organization(ChatVacancy v) => v.organization;
  static const Field<ChatVacancy, ChatOrganization> _f$organization = Field(
    'organization',
    _$organization,
    opt: true,
  );

  @override
  final MappableFields<ChatVacancy> fields = const {
    #id: _f$id,
    #organization: _f$organization,
  };

  static ChatVacancy _instantiate(DecodingData data) {
    return ChatVacancy(
      id: data.dec(_f$id),
      organization: data.dec(_f$organization),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatVacancy fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatVacancy>(map);
  }

  static ChatVacancy fromJson(String json) {
    return ensureInitialized().decodeJson<ChatVacancy>(json);
  }
}

mixin ChatVacancyMappable {
  String toJson() {
    return ChatVacancyMapper.ensureInitialized().encodeJson<ChatVacancy>(
      this as ChatVacancy,
    );
  }

  Map<String, dynamic> toMap() {
    return ChatVacancyMapper.ensureInitialized().encodeMap<ChatVacancy>(
      this as ChatVacancy,
    );
  }

  ChatVacancyCopyWith<ChatVacancy, ChatVacancy, ChatVacancy> get copyWith =>
      _ChatVacancyCopyWithImpl<ChatVacancy, ChatVacancy>(
        this as ChatVacancy,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatVacancyMapper.ensureInitialized().stringifyValue(
      this as ChatVacancy,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatVacancyMapper.ensureInitialized().equalsValue(
      this as ChatVacancy,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatVacancyMapper.ensureInitialized().hashValue(this as ChatVacancy);
  }
}

extension ChatVacancyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatVacancy, $Out> {
  ChatVacancyCopyWith<$R, ChatVacancy, $Out> get $asChatVacancy =>
      $base.as((v, t, t2) => _ChatVacancyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatVacancyCopyWith<$R, $In extends ChatVacancy, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ChatOrganizationCopyWith<$R, ChatOrganization, ChatOrganization>?
  get organization;
  $R call({String? id, ChatOrganization? organization});
  ChatVacancyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatVacancyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatVacancy, $Out>
    implements ChatVacancyCopyWith<$R, ChatVacancy, $Out> {
  _ChatVacancyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatVacancy> $mapper =
      ChatVacancyMapper.ensureInitialized();
  @override
  ChatOrganizationCopyWith<$R, ChatOrganization, ChatOrganization>?
  get organization =>
      $value.organization?.copyWith.$chain((v) => call(organization: v));
  @override
  $R call({Object? id = $none, Object? organization = $none}) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (organization != $none) #organization: organization,
    }),
  );
  @override
  ChatVacancy $make(CopyWithData data) => ChatVacancy(
    id: data.get(#id, or: $value.id),
    organization: data.get(#organization, or: $value.organization),
  );

  @override
  ChatVacancyCopyWith<$R2, ChatVacancy, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatVacancyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChatOrganizationMapper extends ClassMapperBase<ChatOrganization> {
  ChatOrganizationMapper._();

  static ChatOrganizationMapper? _instance;
  static ChatOrganizationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatOrganizationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatOrganization';

  static String? _$logoUrl(ChatOrganization v) => v.logoUrl;
  static const Field<ChatOrganization, String> _f$logoUrl = Field(
    'logoUrl',
    _$logoUrl,
    key: r'logo_url',
    opt: true,
  );
  static String? _$name(ChatOrganization v) => v.name;
  static const Field<ChatOrganization, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$industry(ChatOrganization v) => v.industry;
  static const Field<ChatOrganization, String> _f$industry = Field(
    'industry',
    _$industry,
    opt: true,
  );

  @override
  final MappableFields<ChatOrganization> fields = const {
    #logoUrl: _f$logoUrl,
    #name: _f$name,
    #industry: _f$industry,
  };

  static ChatOrganization _instantiate(DecodingData data) {
    return ChatOrganization(
      logoUrl: data.dec(_f$logoUrl),
      name: data.dec(_f$name),
      industry: data.dec(_f$industry),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatOrganization fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatOrganization>(map);
  }

  static ChatOrganization fromJson(String json) {
    return ensureInitialized().decodeJson<ChatOrganization>(json);
  }
}

mixin ChatOrganizationMappable {
  String toJson() {
    return ChatOrganizationMapper.ensureInitialized()
        .encodeJson<ChatOrganization>(this as ChatOrganization);
  }

  Map<String, dynamic> toMap() {
    return ChatOrganizationMapper.ensureInitialized()
        .encodeMap<ChatOrganization>(this as ChatOrganization);
  }

  ChatOrganizationCopyWith<ChatOrganization, ChatOrganization, ChatOrganization>
  get copyWith =>
      _ChatOrganizationCopyWithImpl<ChatOrganization, ChatOrganization>(
        this as ChatOrganization,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatOrganizationMapper.ensureInitialized().stringifyValue(
      this as ChatOrganization,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatOrganizationMapper.ensureInitialized().equalsValue(
      this as ChatOrganization,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatOrganizationMapper.ensureInitialized().hashValue(
      this as ChatOrganization,
    );
  }
}

extension ChatOrganizationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatOrganization, $Out> {
  ChatOrganizationCopyWith<$R, ChatOrganization, $Out>
  get $asChatOrganization =>
      $base.as((v, t, t2) => _ChatOrganizationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatOrganizationCopyWith<$R, $In extends ChatOrganization, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? logoUrl, String? name, String? industry});
  ChatOrganizationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ChatOrganizationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatOrganization, $Out>
    implements ChatOrganizationCopyWith<$R, ChatOrganization, $Out> {
  _ChatOrganizationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatOrganization> $mapper =
      ChatOrganizationMapper.ensureInitialized();
  @override
  $R call({
    Object? logoUrl = $none,
    Object? name = $none,
    Object? industry = $none,
  }) => $apply(
    FieldCopyWithData({
      if (logoUrl != $none) #logoUrl: logoUrl,
      if (name != $none) #name: name,
      if (industry != $none) #industry: industry,
    }),
  );
  @override
  ChatOrganization $make(CopyWithData data) => ChatOrganization(
    logoUrl: data.get(#logoUrl, or: $value.logoUrl),
    name: data.get(#name, or: $value.name),
    industry: data.get(#industry, or: $value.industry),
  );

  @override
  ChatOrganizationCopyWith<$R2, ChatOrganization, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatOrganizationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChatResumeMapper extends ClassMapperBase<ChatResume> {
  ChatResumeMapper._();

  static ChatResumeMapper? _instance;
  static ChatResumeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatResumeMapper._());
      ChatProfileMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChatResume';

  static String? _$id(ChatResume v) => v.id;
  static const Field<ChatResume, String> _f$id = Field('id', _$id, opt: true);
  static String? _$specialization(ChatResume v) => v.specialization;
  static const Field<ChatResume, String> _f$specialization = Field(
    'specialization',
    _$specialization,
    opt: true,
  );
  static ChatProfile? _$profile(ChatResume v) => v.profile;
  static const Field<ChatResume, ChatProfile> _f$profile = Field(
    'profile',
    _$profile,
    opt: true,
  );
  static ChatProfile? _$user(ChatResume v) => v.user;
  static const Field<ChatResume, ChatProfile> _f$user = Field(
    'user',
    _$user,
    opt: true,
  );

  @override
  final MappableFields<ChatResume> fields = const {
    #id: _f$id,
    #specialization: _f$specialization,
    #profile: _f$profile,
    #user: _f$user,
  };

  static ChatResume _instantiate(DecodingData data) {
    return ChatResume(
      id: data.dec(_f$id),
      specialization: data.dec(_f$specialization),
      profile: data.dec(_f$profile),
      user: data.dec(_f$user),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatResume fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatResume>(map);
  }

  static ChatResume fromJson(String json) {
    return ensureInitialized().decodeJson<ChatResume>(json);
  }
}

mixin ChatResumeMappable {
  String toJson() {
    return ChatResumeMapper.ensureInitialized().encodeJson<ChatResume>(
      this as ChatResume,
    );
  }

  Map<String, dynamic> toMap() {
    return ChatResumeMapper.ensureInitialized().encodeMap<ChatResume>(
      this as ChatResume,
    );
  }

  ChatResumeCopyWith<ChatResume, ChatResume, ChatResume> get copyWith =>
      _ChatResumeCopyWithImpl<ChatResume, ChatResume>(
        this as ChatResume,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatResumeMapper.ensureInitialized().stringifyValue(
      this as ChatResume,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatResumeMapper.ensureInitialized().equalsValue(
      this as ChatResume,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatResumeMapper.ensureInitialized().hashValue(this as ChatResume);
  }
}

extension ChatResumeValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatResume, $Out> {
  ChatResumeCopyWith<$R, ChatResume, $Out> get $asChatResume =>
      $base.as((v, t, t2) => _ChatResumeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatResumeCopyWith<$R, $In extends ChatResume, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ChatProfileCopyWith<$R, ChatProfile, ChatProfile>? get profile;
  ChatProfileCopyWith<$R, ChatProfile, ChatProfile>? get user;
  $R call({
    String? id,
    String? specialization,
    ChatProfile? profile,
    ChatProfile? user,
  });
  ChatResumeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatResumeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatResume, $Out>
    implements ChatResumeCopyWith<$R, ChatResume, $Out> {
  _ChatResumeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatResume> $mapper =
      ChatResumeMapper.ensureInitialized();
  @override
  ChatProfileCopyWith<$R, ChatProfile, ChatProfile>? get profile =>
      $value.profile?.copyWith.$chain((v) => call(profile: v));
  @override
  ChatProfileCopyWith<$R, ChatProfile, ChatProfile>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  $R call({
    Object? id = $none,
    Object? specialization = $none,
    Object? profile = $none,
    Object? user = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (specialization != $none) #specialization: specialization,
      if (profile != $none) #profile: profile,
      if (user != $none) #user: user,
    }),
  );
  @override
  ChatResume $make(CopyWithData data) => ChatResume(
    id: data.get(#id, or: $value.id),
    specialization: data.get(#specialization, or: $value.specialization),
    profile: data.get(#profile, or: $value.profile),
    user: data.get(#user, or: $value.user),
  );

  @override
  ChatResumeCopyWith<$R2, ChatResume, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatResumeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChatProfileMapper extends ClassMapperBase<ChatProfile> {
  ChatProfileMapper._();

  static ChatProfileMapper? _instance;
  static ChatProfileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatProfileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatProfile';

  static String? _$name(ChatProfile v) => v.name;
  static const Field<ChatProfile, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$avatarUrl(ChatProfile v) => v.avatarUrl;
  static const Field<ChatProfile, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    key: r'avatar_url',
    opt: true,
  );

  @override
  final MappableFields<ChatProfile> fields = const {
    #name: _f$name,
    #avatarUrl: _f$avatarUrl,
  };

  static ChatProfile _instantiate(DecodingData data) {
    return ChatProfile(
      name: data.dec(_f$name),
      avatarUrl: data.dec(_f$avatarUrl),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChatProfile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatProfile>(map);
  }

  static ChatProfile fromJson(String json) {
    return ensureInitialized().decodeJson<ChatProfile>(json);
  }
}

mixin ChatProfileMappable {
  String toJson() {
    return ChatProfileMapper.ensureInitialized().encodeJson<ChatProfile>(
      this as ChatProfile,
    );
  }

  Map<String, dynamic> toMap() {
    return ChatProfileMapper.ensureInitialized().encodeMap<ChatProfile>(
      this as ChatProfile,
    );
  }

  ChatProfileCopyWith<ChatProfile, ChatProfile, ChatProfile> get copyWith =>
      _ChatProfileCopyWithImpl<ChatProfile, ChatProfile>(
        this as ChatProfile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ChatProfileMapper.ensureInitialized().stringifyValue(
      this as ChatProfile,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChatProfileMapper.ensureInitialized().equalsValue(
      this as ChatProfile,
      other,
    );
  }

  @override
  int get hashCode {
    return ChatProfileMapper.ensureInitialized().hashValue(this as ChatProfile);
  }
}

extension ChatProfileValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChatProfile, $Out> {
  ChatProfileCopyWith<$R, ChatProfile, $Out> get $asChatProfile =>
      $base.as((v, t, t2) => _ChatProfileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatProfileCopyWith<$R, $In extends ChatProfile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? avatarUrl});
  ChatProfileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatProfileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatProfile, $Out>
    implements ChatProfileCopyWith<$R, ChatProfile, $Out> {
  _ChatProfileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatProfile> $mapper =
      ChatProfileMapper.ensureInitialized();
  @override
  $R call({Object? name = $none, Object? avatarUrl = $none}) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (avatarUrl != $none) #avatarUrl: avatarUrl,
    }),
  );
  @override
  ChatProfile $make(CopyWithData data) => ChatProfile(
    name: data.get(#name, or: $value.name),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
  );

  @override
  ChatProfileCopyWith<$R2, ChatProfile, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChatProfileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

