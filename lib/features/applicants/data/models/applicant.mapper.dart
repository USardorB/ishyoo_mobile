// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'applicant.dart';

class ApplicantUserMapper extends ClassMapperBase<ApplicantUser> {
  ApplicantUserMapper._();

  static ApplicantUserMapper? _instance;
  static ApplicantUserMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApplicantUserMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApplicantUser';

  static String _$id(ApplicantUser v) => v.id;
  static const Field<ApplicantUser, String> _f$id = Field('id', _$id);
  static String? _$name(ApplicantUser v) => v.name;
  static const Field<ApplicantUser, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$phoneNumber(ApplicantUser v) => v.phoneNumber;
  static const Field<ApplicantUser, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'phone_number',
    opt: true,
  );
  static String? _$email(ApplicantUser v) => v.email;
  static const Field<ApplicantUser, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$role(ApplicantUser v) => v.role;
  static const Field<ApplicantUser, String> _f$role = Field(
    'role',
    _$role,
    opt: true,
  );
  static String? _$avatarUrl(ApplicantUser v) => v.avatarUrl;
  static const Field<ApplicantUser, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    key: r'avatar_url',
    opt: true,
  );
  static bool? _$isWaitlistedUser(ApplicantUser v) => v.isWaitlistedUser;
  static const Field<ApplicantUser, bool> _f$isWaitlistedUser = Field(
    'isWaitlistedUser',
    _$isWaitlistedUser,
    key: r'is_waitlisted_user',
    opt: true,
  );
  static String? _$status(ApplicantUser v) => v.status;
  static const Field<ApplicantUser, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static String? _$password(ApplicantUser v) => v.password;
  static const Field<ApplicantUser, String> _f$password = Field(
    'password',
    _$password,
    opt: true,
  );
  static String? _$city(ApplicantUser v) => v.city;
  static const Field<ApplicantUser, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$bio(ApplicantUser v) => v.bio;
  static const Field<ApplicantUser, String> _f$bio = Field(
    'bio',
    _$bio,
    opt: true,
  );
  static String? _$birthDate(ApplicantUser v) => v.birthDate;
  static const Field<ApplicantUser, String> _f$birthDate = Field(
    'birthDate',
    _$birthDate,
    key: r'birth_date',
    opt: true,
  );
  static String? _$networkStatus(ApplicantUser v) => v.networkStatus;
  static const Field<ApplicantUser, String> _f$networkStatus = Field(
    'networkStatus',
    _$networkStatus,
    key: r'network_status',
    opt: true,
  );
  static DateTime? _$lastSeen(ApplicantUser v) => v.lastSeen;
  static const Field<ApplicantUser, DateTime> _f$lastSeen = Field(
    'lastSeen',
    _$lastSeen,
    key: r'last_seen',
    opt: true,
  );
  static DateTime? _$createdAt(ApplicantUser v) => v.createdAt;
  static const Field<ApplicantUser, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static DateTime? _$updatedAt(ApplicantUser v) => v.updatedAt;
  static const Field<ApplicantUser, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$userId(ApplicantUser v) => v.userId;
  static const Field<ApplicantUser, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );

  @override
  final MappableFields<ApplicantUser> fields = const {
    #id: _f$id,
    #name: _f$name,
    #phoneNumber: _f$phoneNumber,
    #email: _f$email,
    #role: _f$role,
    #avatarUrl: _f$avatarUrl,
    #isWaitlistedUser: _f$isWaitlistedUser,
    #status: _f$status,
    #password: _f$password,
    #city: _f$city,
    #bio: _f$bio,
    #birthDate: _f$birthDate,
    #networkStatus: _f$networkStatus,
    #lastSeen: _f$lastSeen,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #userId: _f$userId,
  };

  static ApplicantUser _instantiate(DecodingData data) {
    return ApplicantUser(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      phoneNumber: data.dec(_f$phoneNumber),
      email: data.dec(_f$email),
      role: data.dec(_f$role),
      avatarUrl: data.dec(_f$avatarUrl),
      isWaitlistedUser: data.dec(_f$isWaitlistedUser),
      status: data.dec(_f$status),
      password: data.dec(_f$password),
      city: data.dec(_f$city),
      bio: data.dec(_f$bio),
      birthDate: data.dec(_f$birthDate),
      networkStatus: data.dec(_f$networkStatus),
      lastSeen: data.dec(_f$lastSeen),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      userId: data.dec(_f$userId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ApplicantUser fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApplicantUser>(map);
  }

  static ApplicantUser fromJson(String json) {
    return ensureInitialized().decodeJson<ApplicantUser>(json);
  }
}

mixin ApplicantUserMappable {
  String toJson() {
    return ApplicantUserMapper.ensureInitialized().encodeJson<ApplicantUser>(
      this as ApplicantUser,
    );
  }

  Map<String, dynamic> toMap() {
    return ApplicantUserMapper.ensureInitialized().encodeMap<ApplicantUser>(
      this as ApplicantUser,
    );
  }

  ApplicantUserCopyWith<ApplicantUser, ApplicantUser, ApplicantUser>
  get copyWith => _ApplicantUserCopyWithImpl<ApplicantUser, ApplicantUser>(
    this as ApplicantUser,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ApplicantUserMapper.ensureInitialized().stringifyValue(
      this as ApplicantUser,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApplicantUserMapper.ensureInitialized().equalsValue(
      this as ApplicantUser,
      other,
    );
  }

  @override
  int get hashCode {
    return ApplicantUserMapper.ensureInitialized().hashValue(
      this as ApplicantUser,
    );
  }
}

extension ApplicantUserValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApplicantUser, $Out> {
  ApplicantUserCopyWith<$R, ApplicantUser, $Out> get $asApplicantUser =>
      $base.as((v, t, t2) => _ApplicantUserCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApplicantUserCopyWith<$R, $In extends ApplicantUser, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? name,
    String? phoneNumber,
    String? email,
    String? role,
    String? avatarUrl,
    bool? isWaitlistedUser,
    String? status,
    String? password,
    String? city,
    String? bio,
    String? birthDate,
    String? networkStatus,
    DateTime? lastSeen,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
  });
  ApplicantUserCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApplicantUserCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApplicantUser, $Out>
    implements ApplicantUserCopyWith<$R, ApplicantUser, $Out> {
  _ApplicantUserCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApplicantUser> $mapper =
      ApplicantUserMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? name = $none,
    Object? phoneNumber = $none,
    Object? email = $none,
    Object? role = $none,
    Object? avatarUrl = $none,
    Object? isWaitlistedUser = $none,
    Object? status = $none,
    Object? password = $none,
    Object? city = $none,
    Object? bio = $none,
    Object? birthDate = $none,
    Object? networkStatus = $none,
    Object? lastSeen = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? userId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != $none) #name: name,
      if (phoneNumber != $none) #phoneNumber: phoneNumber,
      if (email != $none) #email: email,
      if (role != $none) #role: role,
      if (avatarUrl != $none) #avatarUrl: avatarUrl,
      if (isWaitlistedUser != $none) #isWaitlistedUser: isWaitlistedUser,
      if (status != $none) #status: status,
      if (password != $none) #password: password,
      if (city != $none) #city: city,
      if (bio != $none) #bio: bio,
      if (birthDate != $none) #birthDate: birthDate,
      if (networkStatus != $none) #networkStatus: networkStatus,
      if (lastSeen != $none) #lastSeen: lastSeen,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (userId != $none) #userId: userId,
    }),
  );
  @override
  ApplicantUser $make(CopyWithData data) => ApplicantUser(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    email: data.get(#email, or: $value.email),
    role: data.get(#role, or: $value.role),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
    isWaitlistedUser: data.get(#isWaitlistedUser, or: $value.isWaitlistedUser),
    status: data.get(#status, or: $value.status),
    password: data.get(#password, or: $value.password),
    city: data.get(#city, or: $value.city),
    bio: data.get(#bio, or: $value.bio),
    birthDate: data.get(#birthDate, or: $value.birthDate),
    networkStatus: data.get(#networkStatus, or: $value.networkStatus),
    lastSeen: data.get(#lastSeen, or: $value.lastSeen),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    userId: data.get(#userId, or: $value.userId),
  );

  @override
  ApplicantUserCopyWith<$R2, ApplicantUser, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApplicantUserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ApplicantChatMapper extends ClassMapperBase<ApplicantChat> {
  ApplicantChatMapper._();

  static ApplicantChatMapper? _instance;
  static ApplicantChatMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApplicantChatMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApplicantChat';

  static String _$id(ApplicantChat v) => v.id;
  static const Field<ApplicantChat, String> _f$id = Field('id', _$id);
  static String? _$status(ApplicantChat v) => v.status;
  static const Field<ApplicantChat, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static DateTime? _$createdAt(ApplicantChat v) => v.createdAt;
  static const Field<ApplicantChat, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static int? _$applicationId(ApplicantChat v) => v.applicationId;
  static const Field<ApplicantChat, int> _f$applicationId = Field(
    'applicationId',
    _$applicationId,
    key: r'application_id',
    opt: true,
  );

  @override
  final MappableFields<ApplicantChat> fields = const {
    #id: _f$id,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #applicationId: _f$applicationId,
  };

  static ApplicantChat _instantiate(DecodingData data) {
    return ApplicantChat(
      id: data.dec(_f$id),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      applicationId: data.dec(_f$applicationId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ApplicantChat fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApplicantChat>(map);
  }

  static ApplicantChat fromJson(String json) {
    return ensureInitialized().decodeJson<ApplicantChat>(json);
  }
}

mixin ApplicantChatMappable {
  String toJson() {
    return ApplicantChatMapper.ensureInitialized().encodeJson<ApplicantChat>(
      this as ApplicantChat,
    );
  }

  Map<String, dynamic> toMap() {
    return ApplicantChatMapper.ensureInitialized().encodeMap<ApplicantChat>(
      this as ApplicantChat,
    );
  }

  ApplicantChatCopyWith<ApplicantChat, ApplicantChat, ApplicantChat>
  get copyWith => _ApplicantChatCopyWithImpl<ApplicantChat, ApplicantChat>(
    this as ApplicantChat,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ApplicantChatMapper.ensureInitialized().stringifyValue(
      this as ApplicantChat,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApplicantChatMapper.ensureInitialized().equalsValue(
      this as ApplicantChat,
      other,
    );
  }

  @override
  int get hashCode {
    return ApplicantChatMapper.ensureInitialized().hashValue(
      this as ApplicantChat,
    );
  }
}

extension ApplicantChatValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApplicantChat, $Out> {
  ApplicantChatCopyWith<$R, ApplicantChat, $Out> get $asApplicantChat =>
      $base.as((v, t, t2) => _ApplicantChatCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApplicantChatCopyWith<$R, $In extends ApplicantChat, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? status,
    DateTime? createdAt,
    int? applicationId,
  });
  ApplicantChatCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApplicantChatCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApplicantChat, $Out>
    implements ApplicantChatCopyWith<$R, ApplicantChat, $Out> {
  _ApplicantChatCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApplicantChat> $mapper =
      ApplicantChatMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? status = $none,
    Object? createdAt = $none,
    Object? applicationId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (status != $none) #status: status,
      if (createdAt != $none) #createdAt: createdAt,
      if (applicationId != $none) #applicationId: applicationId,
    }),
  );
  @override
  ApplicantChat $make(CopyWithData data) => ApplicantChat(
    id: data.get(#id, or: $value.id),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    applicationId: data.get(#applicationId, or: $value.applicationId),
  );

  @override
  ApplicantChatCopyWith<$R2, ApplicantChat, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApplicantChatCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ApplicantMetadataMapper extends ClassMapperBase<ApplicantMetadata> {
  ApplicantMetadataMapper._();

  static ApplicantMetadataMapper? _instance;
  static ApplicantMetadataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApplicantMetadataMapper._());
      ApplicantChatMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ApplicantMetadata';

  static ApplicantChat? _$chat(ApplicantMetadata v) => v.chat;
  static const Field<ApplicantMetadata, ApplicantChat> _f$chat = Field(
    'chat',
    _$chat,
    opt: true,
  );

  @override
  final MappableFields<ApplicantMetadata> fields = const {#chat: _f$chat};

  static ApplicantMetadata _instantiate(DecodingData data) {
    return ApplicantMetadata(chat: data.dec(_f$chat));
  }

  @override
  final Function instantiate = _instantiate;

  static ApplicantMetadata fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApplicantMetadata>(map);
  }

  static ApplicantMetadata fromJson(String json) {
    return ensureInitialized().decodeJson<ApplicantMetadata>(json);
  }
}

mixin ApplicantMetadataMappable {
  String toJson() {
    return ApplicantMetadataMapper.ensureInitialized()
        .encodeJson<ApplicantMetadata>(this as ApplicantMetadata);
  }

  Map<String, dynamic> toMap() {
    return ApplicantMetadataMapper.ensureInitialized()
        .encodeMap<ApplicantMetadata>(this as ApplicantMetadata);
  }

  ApplicantMetadataCopyWith<
    ApplicantMetadata,
    ApplicantMetadata,
    ApplicantMetadata
  >
  get copyWith =>
      _ApplicantMetadataCopyWithImpl<ApplicantMetadata, ApplicantMetadata>(
        this as ApplicantMetadata,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ApplicantMetadataMapper.ensureInitialized().stringifyValue(
      this as ApplicantMetadata,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApplicantMetadataMapper.ensureInitialized().equalsValue(
      this as ApplicantMetadata,
      other,
    );
  }

  @override
  int get hashCode {
    return ApplicantMetadataMapper.ensureInitialized().hashValue(
      this as ApplicantMetadata,
    );
  }
}

extension ApplicantMetadataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApplicantMetadata, $Out> {
  ApplicantMetadataCopyWith<$R, ApplicantMetadata, $Out>
  get $asApplicantMetadata => $base.as(
    (v, t, t2) => _ApplicantMetadataCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ApplicantMetadataCopyWith<
  $R,
  $In extends ApplicantMetadata,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ApplicantChatCopyWith<$R, ApplicantChat, ApplicantChat>? get chat;
  $R call({ApplicantChat? chat});
  ApplicantMetadataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ApplicantMetadataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApplicantMetadata, $Out>
    implements ApplicantMetadataCopyWith<$R, ApplicantMetadata, $Out> {
  _ApplicantMetadataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApplicantMetadata> $mapper =
      ApplicantMetadataMapper.ensureInitialized();
  @override
  ApplicantChatCopyWith<$R, ApplicantChat, ApplicantChat>? get chat =>
      $value.chat?.copyWith.$chain((v) => call(chat: v));
  @override
  $R call({Object? chat = $none}) =>
      $apply(FieldCopyWithData({if (chat != $none) #chat: chat}));
  @override
  ApplicantMetadata $make(CopyWithData data) =>
      ApplicantMetadata(chat: data.get(#chat, or: $value.chat));

  @override
  ApplicantMetadataCopyWith<$R2, ApplicantMetadata, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApplicantMetadataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ApplicantMapper extends ClassMapperBase<Applicant> {
  ApplicantMapper._();

  static ApplicantMapper? _instance;
  static ApplicantMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApplicantMapper._());
      ApplicantMetadataMapper.ensureInitialized();
      ResumeEducationMapper.ensureInitialized();
      ResumeExperienceMapper.ensureInitialized();
      ApplicantUserMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Applicant';

  static String _$id(Applicant v) => v.id;
  static const Field<Applicant, String> _f$id = Field('id', _$id);
  static String? _$resumeId(Applicant v) => v.resumeId;
  static const Field<Applicant, String> _f$resumeId = Field(
    'resumeId',
    _$resumeId,
    key: r'resume_id',
    opt: true,
  );
  static ApplicantMetadata? _$metadata(Applicant v) => v.metadata;
  static const Field<Applicant, ApplicantMetadata> _f$metadata = Field(
    'metadata',
    _$metadata,
    opt: true,
  );
  static String? _$specialization(Applicant v) => v.specialization;
  static const Field<Applicant, String> _f$specialization = Field(
    'specialization',
    _$specialization,
    opt: true,
  );
  static int? _$expectedSalary(Applicant v) => v.expectedSalary;
  static const Field<Applicant, int> _f$expectedSalary = Field(
    'expectedSalary',
    _$expectedSalary,
    key: r'expected_salary',
    opt: true,
  );
  static String? _$currency(Applicant v) => v.currency;
  static const Field<Applicant, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static List<String>? _$employmentType(Applicant v) => v.employmentType;
  static const Field<Applicant, List<String>> _f$employmentType = Field(
    'employmentType',
    _$employmentType,
    key: r'employment_type',
    opt: true,
  );
  static List<String>? _$workFormat(Applicant v) => v.workFormat;
  static const Field<Applicant, List<String>> _f$workFormat = Field(
    'workFormat',
    _$workFormat,
    key: r'work_format',
    opt: true,
  );
  static List<String>? _$skills(Applicant v) => v.skills;
  static const Field<Applicant, List<String>> _f$skills = Field(
    'skills',
    _$skills,
    opt: true,
  );
  static List<ResumeEducation>? _$educations(Applicant v) => v.educations;
  static const Field<Applicant, List<ResumeEducation>> _f$educations = Field(
    'educations',
    _$educations,
    opt: true,
  );
  static List<ResumeExperience>? _$experiences(Applicant v) => v.experiences;
  static const Field<Applicant, List<ResumeExperience>> _f$experiences = Field(
    'experiences',
    _$experiences,
    opt: true,
  );
  static String? _$visibility(Applicant v) => v.visibility;
  static const Field<Applicant, String> _f$visibility = Field(
    'visibility',
    _$visibility,
    opt: true,
  );
  static String? _$status(Applicant v) => v.status;
  static const Field<Applicant, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static bool? _$isSpecial(Applicant v) => v.isSpecial;
  static const Field<Applicant, bool> _f$isSpecial = Field(
    'isSpecial',
    _$isSpecial,
    key: r'is_special',
    opt: true,
  );
  static bool? _$isPrimary(Applicant v) => v.isPrimary;
  static const Field<Applicant, bool> _f$isPrimary = Field(
    'isPrimary',
    _$isPrimary,
    key: r'is_primary',
    opt: true,
  );
  static int? _$boostScore(Applicant v) => v.boostScore;
  static const Field<Applicant, int> _f$boostScore = Field(
    'boostScore',
    _$boostScore,
    key: r'boost_score',
    opt: true,
  );
  static DateTime? _$boostedAt(Applicant v) => v.boostedAt;
  static const Field<Applicant, DateTime> _f$boostedAt = Field(
    'boostedAt',
    _$boostedAt,
    key: r'boosted_at',
    opt: true,
  );
  static DateTime? _$boostUntil(Applicant v) => v.boostUntil;
  static const Field<Applicant, DateTime> _f$boostUntil = Field(
    'boostUntil',
    _$boostUntil,
    key: r'boost_until',
    opt: true,
  );
  static DateTime? _$nextFreeBoostAt(Applicant v) => v.nextFreeBoostAt;
  static const Field<Applicant, DateTime> _f$nextFreeBoostAt = Field(
    'nextFreeBoostAt',
    _$nextFreeBoostAt,
    key: r'next_free_boost_at',
    opt: true,
  );
  static DateTime? _$createdAt(Applicant v) => v.createdAt;
  static const Field<Applicant, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static DateTime? _$updatedAt(Applicant v) => v.updatedAt;
  static const Field<Applicant, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$userId(Applicant v) => v.userId;
  static const Field<Applicant, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );
  static ApplicantUser? _$user(Applicant v) => v.user;
  static const Field<Applicant, ApplicantUser> _f$user = Field(
    'user',
    _$user,
    opt: true,
  );
  static String? _$profileId(Applicant v) => v.profileId;
  static const Field<Applicant, String> _f$profileId = Field(
    'profileId',
    _$profileId,
    key: r'profile_id',
    opt: true,
  );
  static ApplicantUser? _$profile(Applicant v) => v.profile;
  static const Field<Applicant, ApplicantUser> _f$profile = Field(
    'profile',
    _$profile,
    opt: true,
  );
  static String? _$applicationStatus(Applicant v) => v.applicationStatus;
  static const Field<Applicant, String> _f$applicationStatus = Field(
    'applicationStatus',
    _$applicationStatus,
    key: r'application_status',
    opt: true,
  );
  static String? _$vacancyId(Applicant v) => v.vacancyId;
  static const Field<Applicant, String> _f$vacancyId = Field(
    'vacancyId',
    _$vacancyId,
    key: r'vacancy_id',
    opt: true,
  );
  static String? _$chatId(Applicant v) => v.chatId;
  static const Field<Applicant, String> _f$chatId = Field(
    'chatId',
    _$chatId,
    key: r'chat_id',
    opt: true,
  );

  @override
  final MappableFields<Applicant> fields = const {
    #id: _f$id,
    #resumeId: _f$resumeId,
    #metadata: _f$metadata,
    #specialization: _f$specialization,
    #expectedSalary: _f$expectedSalary,
    #currency: _f$currency,
    #employmentType: _f$employmentType,
    #workFormat: _f$workFormat,
    #skills: _f$skills,
    #educations: _f$educations,
    #experiences: _f$experiences,
    #visibility: _f$visibility,
    #status: _f$status,
    #isSpecial: _f$isSpecial,
    #isPrimary: _f$isPrimary,
    #boostScore: _f$boostScore,
    #boostedAt: _f$boostedAt,
    #boostUntil: _f$boostUntil,
    #nextFreeBoostAt: _f$nextFreeBoostAt,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #userId: _f$userId,
    #user: _f$user,
    #profileId: _f$profileId,
    #profile: _f$profile,
    #applicationStatus: _f$applicationStatus,
    #vacancyId: _f$vacancyId,
    #chatId: _f$chatId,
  };

  static Applicant _instantiate(DecodingData data) {
    return Applicant(
      id: data.dec(_f$id),
      resumeId: data.dec(_f$resumeId),
      metadata: data.dec(_f$metadata),
      specialization: data.dec(_f$specialization),
      expectedSalary: data.dec(_f$expectedSalary),
      currency: data.dec(_f$currency),
      employmentType: data.dec(_f$employmentType),
      workFormat: data.dec(_f$workFormat),
      skills: data.dec(_f$skills),
      educations: data.dec(_f$educations),
      experiences: data.dec(_f$experiences),
      visibility: data.dec(_f$visibility),
      status: data.dec(_f$status),
      isSpecial: data.dec(_f$isSpecial),
      isPrimary: data.dec(_f$isPrimary),
      boostScore: data.dec(_f$boostScore),
      boostedAt: data.dec(_f$boostedAt),
      boostUntil: data.dec(_f$boostUntil),
      nextFreeBoostAt: data.dec(_f$nextFreeBoostAt),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      userId: data.dec(_f$userId),
      user: data.dec(_f$user),
      profileId: data.dec(_f$profileId),
      profile: data.dec(_f$profile),
      applicationStatus: data.dec(_f$applicationStatus),
      vacancyId: data.dec(_f$vacancyId),
      chatId: data.dec(_f$chatId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Applicant fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Applicant>(map);
  }

  static Applicant fromJson(String json) {
    return ensureInitialized().decodeJson<Applicant>(json);
  }
}

mixin ApplicantMappable {
  String toJson() {
    return ApplicantMapper.ensureInitialized().encodeJson<Applicant>(
      this as Applicant,
    );
  }

  Map<String, dynamic> toMap() {
    return ApplicantMapper.ensureInitialized().encodeMap<Applicant>(
      this as Applicant,
    );
  }

  ApplicantCopyWith<Applicant, Applicant, Applicant> get copyWith =>
      _ApplicantCopyWithImpl<Applicant, Applicant>(
        this as Applicant,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ApplicantMapper.ensureInitialized().stringifyValue(
      this as Applicant,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApplicantMapper.ensureInitialized().equalsValue(
      this as Applicant,
      other,
    );
  }

  @override
  int get hashCode {
    return ApplicantMapper.ensureInitialized().hashValue(this as Applicant);
  }
}

extension ApplicantValueCopy<$R, $Out> on ObjectCopyWith<$R, Applicant, $Out> {
  ApplicantCopyWith<$R, Applicant, $Out> get $asApplicant =>
      $base.as((v, t, t2) => _ApplicantCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApplicantCopyWith<$R, $In extends Applicant, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ApplicantMetadataCopyWith<$R, ApplicantMetadata, ApplicantMetadata>?
  get metadata;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get employmentType;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get workFormat;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get skills;
  ListCopyWith<
    $R,
    ResumeEducation,
    ResumeEducationCopyWith<$R, ResumeEducation, ResumeEducation>
  >?
  get educations;
  ListCopyWith<
    $R,
    ResumeExperience,
    ResumeExperienceCopyWith<$R, ResumeExperience, ResumeExperience>
  >?
  get experiences;
  ApplicantUserCopyWith<$R, ApplicantUser, ApplicantUser>? get user;
  ApplicantUserCopyWith<$R, ApplicantUser, ApplicantUser>? get profile;
  $R call({
    String? id,
    String? resumeId,
    ApplicantMetadata? metadata,
    String? specialization,
    int? expectedSalary,
    String? currency,
    List<String>? employmentType,
    List<String>? workFormat,
    List<String>? skills,
    List<ResumeEducation>? educations,
    List<ResumeExperience>? experiences,
    String? visibility,
    String? status,
    bool? isSpecial,
    bool? isPrimary,
    int? boostScore,
    DateTime? boostedAt,
    DateTime? boostUntil,
    DateTime? nextFreeBoostAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    ApplicantUser? user,
    String? profileId,
    ApplicantUser? profile,
    String? applicationStatus,
    String? vacancyId,
    String? chatId,
  });
  ApplicantCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApplicantCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Applicant, $Out>
    implements ApplicantCopyWith<$R, Applicant, $Out> {
  _ApplicantCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Applicant> $mapper =
      ApplicantMapper.ensureInitialized();
  @override
  ApplicantMetadataCopyWith<$R, ApplicantMetadata, ApplicantMetadata>?
  get metadata => $value.metadata?.copyWith.$chain((v) => call(metadata: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get employmentType => $value.employmentType != null
      ? ListCopyWith(
          $value.employmentType!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(employmentType: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
  get workFormat => $value.workFormat != null
      ? ListCopyWith(
          $value.workFormat!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(workFormat: v),
        )
      : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get skills =>
      $value.skills != null
      ? ListCopyWith(
          $value.skills!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(skills: v),
        )
      : null;
  @override
  ListCopyWith<
    $R,
    ResumeEducation,
    ResumeEducationCopyWith<$R, ResumeEducation, ResumeEducation>
  >?
  get educations => $value.educations != null
      ? ListCopyWith(
          $value.educations!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(educations: v),
        )
      : null;
  @override
  ListCopyWith<
    $R,
    ResumeExperience,
    ResumeExperienceCopyWith<$R, ResumeExperience, ResumeExperience>
  >?
  get experiences => $value.experiences != null
      ? ListCopyWith(
          $value.experiences!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(experiences: v),
        )
      : null;
  @override
  ApplicantUserCopyWith<$R, ApplicantUser, ApplicantUser>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  ApplicantUserCopyWith<$R, ApplicantUser, ApplicantUser>? get profile =>
      $value.profile?.copyWith.$chain((v) => call(profile: v));
  @override
  $R call({
    String? id,
    Object? resumeId = $none,
    Object? metadata = $none,
    Object? specialization = $none,
    Object? expectedSalary = $none,
    Object? currency = $none,
    Object? employmentType = $none,
    Object? workFormat = $none,
    Object? skills = $none,
    Object? educations = $none,
    Object? experiences = $none,
    Object? visibility = $none,
    Object? status = $none,
    Object? isSpecial = $none,
    Object? isPrimary = $none,
    Object? boostScore = $none,
    Object? boostedAt = $none,
    Object? boostUntil = $none,
    Object? nextFreeBoostAt = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? userId = $none,
    Object? user = $none,
    Object? profileId = $none,
    Object? profile = $none,
    Object? applicationStatus = $none,
    Object? vacancyId = $none,
    Object? chatId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (resumeId != $none) #resumeId: resumeId,
      if (metadata != $none) #metadata: metadata,
      if (specialization != $none) #specialization: specialization,
      if (expectedSalary != $none) #expectedSalary: expectedSalary,
      if (currency != $none) #currency: currency,
      if (employmentType != $none) #employmentType: employmentType,
      if (workFormat != $none) #workFormat: workFormat,
      if (skills != $none) #skills: skills,
      if (educations != $none) #educations: educations,
      if (experiences != $none) #experiences: experiences,
      if (visibility != $none) #visibility: visibility,
      if (status != $none) #status: status,
      if (isSpecial != $none) #isSpecial: isSpecial,
      if (isPrimary != $none) #isPrimary: isPrimary,
      if (boostScore != $none) #boostScore: boostScore,
      if (boostedAt != $none) #boostedAt: boostedAt,
      if (boostUntil != $none) #boostUntil: boostUntil,
      if (nextFreeBoostAt != $none) #nextFreeBoostAt: nextFreeBoostAt,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (userId != $none) #userId: userId,
      if (user != $none) #user: user,
      if (profileId != $none) #profileId: profileId,
      if (profile != $none) #profile: profile,
      if (applicationStatus != $none) #applicationStatus: applicationStatus,
      if (vacancyId != $none) #vacancyId: vacancyId,
      if (chatId != $none) #chatId: chatId,
    }),
  );
  @override
  Applicant $make(CopyWithData data) => Applicant(
    id: data.get(#id, or: $value.id),
    resumeId: data.get(#resumeId, or: $value.resumeId),
    metadata: data.get(#metadata, or: $value.metadata),
    specialization: data.get(#specialization, or: $value.specialization),
    expectedSalary: data.get(#expectedSalary, or: $value.expectedSalary),
    currency: data.get(#currency, or: $value.currency),
    employmentType: data.get(#employmentType, or: $value.employmentType),
    workFormat: data.get(#workFormat, or: $value.workFormat),
    skills: data.get(#skills, or: $value.skills),
    educations: data.get(#educations, or: $value.educations),
    experiences: data.get(#experiences, or: $value.experiences),
    visibility: data.get(#visibility, or: $value.visibility),
    status: data.get(#status, or: $value.status),
    isSpecial: data.get(#isSpecial, or: $value.isSpecial),
    isPrimary: data.get(#isPrimary, or: $value.isPrimary),
    boostScore: data.get(#boostScore, or: $value.boostScore),
    boostedAt: data.get(#boostedAt, or: $value.boostedAt),
    boostUntil: data.get(#boostUntil, or: $value.boostUntil),
    nextFreeBoostAt: data.get(#nextFreeBoostAt, or: $value.nextFreeBoostAt),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    userId: data.get(#userId, or: $value.userId),
    user: data.get(#user, or: $value.user),
    profileId: data.get(#profileId, or: $value.profileId),
    profile: data.get(#profile, or: $value.profile),
    applicationStatus: data.get(
      #applicationStatus,
      or: $value.applicationStatus,
    ),
    vacancyId: data.get(#vacancyId, or: $value.vacancyId),
    chatId: data.get(#chatId, or: $value.chatId),
  );

  @override
  ApplicantCopyWith<$R2, Applicant, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApplicantCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

