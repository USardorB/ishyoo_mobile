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

  @override
  final MappableFields<ApplicantUser> fields = const {
    #id: _f$id,
    #name: _f$name,
    #phoneNumber: _f$phoneNumber,
    #email: _f$email,
    #role: _f$role,
  };

  static ApplicantUser _instantiate(DecodingData data) {
    return ApplicantUser(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      phoneNumber: data.dec(_f$phoneNumber),
      email: data.dec(_f$email),
      role: data.dec(_f$role),
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
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != $none) #name: name,
      if (phoneNumber != $none) #phoneNumber: phoneNumber,
      if (email != $none) #email: email,
      if (role != $none) #role: role,
    }),
  );
  @override
  ApplicantUser $make(CopyWithData data) => ApplicantUser(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    email: data.get(#email, or: $value.email),
    role: data.get(#role, or: $value.role),
  );

  @override
  ApplicantUserCopyWith<$R2, ApplicantUser, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApplicantUserCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ApplicantMapper extends ClassMapperBase<Applicant> {
  ApplicantMapper._();

  static ApplicantMapper? _instance;
  static ApplicantMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApplicantMapper._());
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

  @override
  final MappableFields<Applicant> fields = const {
    #id: _f$id,
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
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #userId: _f$userId,
    #user: _f$user,
    #applicationStatus: _f$applicationStatus,
    #vacancyId: _f$vacancyId,
  };

  static Applicant _instantiate(DecodingData data) {
    return Applicant(
      id: data.dec(_f$id),
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
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      userId: data.dec(_f$userId),
      user: data.dec(_f$user),
      applicationStatus: data.dec(_f$applicationStatus),
      vacancyId: data.dec(_f$vacancyId),
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
  $R call({
    String? id,
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
    DateTime? createdAt,
    DateTime? updatedAt,
    String? userId,
    ApplicantUser? user,
    String? applicationStatus,
    String? vacancyId,
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
  $R call({
    String? id,
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
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? userId = $none,
    Object? user = $none,
    Object? applicationStatus = $none,
    Object? vacancyId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
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
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (userId != $none) #userId: userId,
      if (user != $none) #user: user,
      if (applicationStatus != $none) #applicationStatus: applicationStatus,
      if (vacancyId != $none) #vacancyId: vacancyId,
    }),
  );
  @override
  Applicant $make(CopyWithData data) => Applicant(
    id: data.get(#id, or: $value.id),
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
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    userId: data.get(#userId, or: $value.userId),
    user: data.get(#user, or: $value.user),
    applicationStatus: data.get(
      #applicationStatus,
      or: $value.applicationStatus,
    ),
    vacancyId: data.get(#vacancyId, or: $value.vacancyId),
  );

  @override
  ApplicantCopyWith<$R2, Applicant, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApplicantCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

