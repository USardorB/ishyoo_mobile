// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'resume.dart';

class ResumeEducationMapper extends ClassMapperBase<ResumeEducation> {
  ResumeEducationMapper._();

  static ResumeEducationMapper? _instance;
  static ResumeEducationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResumeEducationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ResumeEducation';

  static String _$degree(ResumeEducation v) => v.degree;
  static const Field<ResumeEducation, String> _f$degree = Field(
    'degree',
    _$degree,
  );
  static String _$school(ResumeEducation v) => v.school;
  static const Field<ResumeEducation, String> _f$school = Field(
    'school',
    _$school,
  );
  static DateTime? _$startDate(ResumeEducation v) => v.startDate;
  static const Field<ResumeEducation, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
    key: r'start_date',
    opt: true,
  );
  static DateTime? _$endDate(ResumeEducation v) => v.endDate;
  static const Field<ResumeEducation, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    key: r'end_date',
    opt: true,
  );

  @override
  final MappableFields<ResumeEducation> fields = const {
    #degree: _f$degree,
    #school: _f$school,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
  };

  static ResumeEducation _instantiate(DecodingData data) {
    return ResumeEducation(
      degree: data.dec(_f$degree),
      school: data.dec(_f$school),
      startDate: data.dec(_f$startDate),
      endDate: data.dec(_f$endDate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ResumeEducation fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResumeEducation>(map);
  }

  static ResumeEducation fromJson(String json) {
    return ensureInitialized().decodeJson<ResumeEducation>(json);
  }
}

mixin ResumeEducationMappable {
  String toJson() {
    return ResumeEducationMapper.ensureInitialized()
        .encodeJson<ResumeEducation>(this as ResumeEducation);
  }

  Map<String, dynamic> toMap() {
    return ResumeEducationMapper.ensureInitialized().encodeMap<ResumeEducation>(
      this as ResumeEducation,
    );
  }

  ResumeEducationCopyWith<ResumeEducation, ResumeEducation, ResumeEducation>
  get copyWith =>
      _ResumeEducationCopyWithImpl<ResumeEducation, ResumeEducation>(
        this as ResumeEducation,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ResumeEducationMapper.ensureInitialized().stringifyValue(
      this as ResumeEducation,
    );
  }

  @override
  bool operator ==(Object other) {
    return ResumeEducationMapper.ensureInitialized().equalsValue(
      this as ResumeEducation,
      other,
    );
  }

  @override
  int get hashCode {
    return ResumeEducationMapper.ensureInitialized().hashValue(
      this as ResumeEducation,
    );
  }
}

extension ResumeEducationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResumeEducation, $Out> {
  ResumeEducationCopyWith<$R, ResumeEducation, $Out> get $asResumeEducation =>
      $base.as((v, t, t2) => _ResumeEducationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResumeEducationCopyWith<$R, $In extends ResumeEducation, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? degree,
    String? school,
    DateTime? startDate,
    DateTime? endDate,
  });
  ResumeEducationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ResumeEducationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResumeEducation, $Out>
    implements ResumeEducationCopyWith<$R, ResumeEducation, $Out> {
  _ResumeEducationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResumeEducation> $mapper =
      ResumeEducationMapper.ensureInitialized();
  @override
  $R call({
    String? degree,
    String? school,
    Object? startDate = $none,
    Object? endDate = $none,
  }) => $apply(
    FieldCopyWithData({
      if (degree != null) #degree: degree,
      if (school != null) #school: school,
      if (startDate != $none) #startDate: startDate,
      if (endDate != $none) #endDate: endDate,
    }),
  );
  @override
  ResumeEducation $make(CopyWithData data) => ResumeEducation(
    degree: data.get(#degree, or: $value.degree),
    school: data.get(#school, or: $value.school),
    startDate: data.get(#startDate, or: $value.startDate),
    endDate: data.get(#endDate, or: $value.endDate),
  );

  @override
  ResumeEducationCopyWith<$R2, ResumeEducation, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ResumeEducationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ResumeExperienceMapper extends ClassMapperBase<ResumeExperience> {
  ResumeExperienceMapper._();

  static ResumeExperienceMapper? _instance;
  static ResumeExperienceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResumeExperienceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ResumeExperience';

  static String _$companyName(ResumeExperience v) => v.companyName;
  static const Field<ResumeExperience, String> _f$companyName = Field(
    'companyName',
    _$companyName,
    key: r'company_name',
  );
  static String _$position(ResumeExperience v) => v.position;
  static const Field<ResumeExperience, String> _f$position = Field(
    'position',
    _$position,
  );
  static String? _$description(ResumeExperience v) => v.description;
  static const Field<ResumeExperience, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static DateTime? _$startDate(ResumeExperience v) => v.startDate;
  static const Field<ResumeExperience, DateTime> _f$startDate = Field(
    'startDate',
    _$startDate,
    key: r'start_date',
    opt: true,
  );
  static DateTime? _$endDate(ResumeExperience v) => v.endDate;
  static const Field<ResumeExperience, DateTime> _f$endDate = Field(
    'endDate',
    _$endDate,
    key: r'end_date',
    opt: true,
  );

  @override
  final MappableFields<ResumeExperience> fields = const {
    #companyName: _f$companyName,
    #position: _f$position,
    #description: _f$description,
    #startDate: _f$startDate,
    #endDate: _f$endDate,
  };

  static ResumeExperience _instantiate(DecodingData data) {
    return ResumeExperience(
      companyName: data.dec(_f$companyName),
      position: data.dec(_f$position),
      description: data.dec(_f$description),
      startDate: data.dec(_f$startDate),
      endDate: data.dec(_f$endDate),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ResumeExperience fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResumeExperience>(map);
  }

  static ResumeExperience fromJson(String json) {
    return ensureInitialized().decodeJson<ResumeExperience>(json);
  }
}

mixin ResumeExperienceMappable {
  String toJson() {
    return ResumeExperienceMapper.ensureInitialized()
        .encodeJson<ResumeExperience>(this as ResumeExperience);
  }

  Map<String, dynamic> toMap() {
    return ResumeExperienceMapper.ensureInitialized()
        .encodeMap<ResumeExperience>(this as ResumeExperience);
  }

  ResumeExperienceCopyWith<ResumeExperience, ResumeExperience, ResumeExperience>
  get copyWith =>
      _ResumeExperienceCopyWithImpl<ResumeExperience, ResumeExperience>(
        this as ResumeExperience,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ResumeExperienceMapper.ensureInitialized().stringifyValue(
      this as ResumeExperience,
    );
  }

  @override
  bool operator ==(Object other) {
    return ResumeExperienceMapper.ensureInitialized().equalsValue(
      this as ResumeExperience,
      other,
    );
  }

  @override
  int get hashCode {
    return ResumeExperienceMapper.ensureInitialized().hashValue(
      this as ResumeExperience,
    );
  }
}

extension ResumeExperienceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResumeExperience, $Out> {
  ResumeExperienceCopyWith<$R, ResumeExperience, $Out>
  get $asResumeExperience =>
      $base.as((v, t, t2) => _ResumeExperienceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResumeExperienceCopyWith<$R, $In extends ResumeExperience, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? companyName,
    String? position,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
  });
  ResumeExperienceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ResumeExperienceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResumeExperience, $Out>
    implements ResumeExperienceCopyWith<$R, ResumeExperience, $Out> {
  _ResumeExperienceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResumeExperience> $mapper =
      ResumeExperienceMapper.ensureInitialized();
  @override
  $R call({
    String? companyName,
    String? position,
    Object? description = $none,
    Object? startDate = $none,
    Object? endDate = $none,
  }) => $apply(
    FieldCopyWithData({
      if (companyName != null) #companyName: companyName,
      if (position != null) #position: position,
      if (description != $none) #description: description,
      if (startDate != $none) #startDate: startDate,
      if (endDate != $none) #endDate: endDate,
    }),
  );
  @override
  ResumeExperience $make(CopyWithData data) => ResumeExperience(
    companyName: data.get(#companyName, or: $value.companyName),
    position: data.get(#position, or: $value.position),
    description: data.get(#description, or: $value.description),
    startDate: data.get(#startDate, or: $value.startDate),
    endDate: data.get(#endDate, or: $value.endDate),
  );

  @override
  ResumeExperienceCopyWith<$R2, ResumeExperience, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ResumeExperienceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ResumeMapper extends ClassMapperBase<Resume> {
  ResumeMapper._();

  static ResumeMapper? _instance;
  static ResumeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResumeMapper._());
      ResumeEducationMapper.ensureInitialized();
      ResumeExperienceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Resume';

  static String _$id(Resume v) => v.id;
  static const Field<Resume, String> _f$id = Field('id', _$id);
  static String? _$userId(Resume v) => v.userId;
  static const Field<Resume, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );
  static String? _$specialization(Resume v) => v.specialization;
  static const Field<Resume, String> _f$specialization = Field(
    'specialization',
    _$specialization,
    opt: true,
  );
  static int? _$expectedSalary(Resume v) => v.expectedSalary;
  static const Field<Resume, int> _f$expectedSalary = Field(
    'expectedSalary',
    _$expectedSalary,
    key: r'expected_salary',
    opt: true,
  );
  static String? _$currency(Resume v) => v.currency;
  static const Field<Resume, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static List<String>? _$employmentType(Resume v) => v.employmentType;
  static const Field<Resume, List<String>> _f$employmentType = Field(
    'employmentType',
    _$employmentType,
    key: r'employment_type',
    opt: true,
  );
  static List<String>? _$workFormat(Resume v) => v.workFormat;
  static const Field<Resume, List<String>> _f$workFormat = Field(
    'workFormat',
    _$workFormat,
    key: r'work_format',
    opt: true,
  );
  static List<String>? _$skills(Resume v) => v.skills;
  static const Field<Resume, List<String>> _f$skills = Field(
    'skills',
    _$skills,
    opt: true,
  );
  static List<ResumeEducation>? _$educations(Resume v) => v.educations;
  static const Field<Resume, List<ResumeEducation>> _f$educations = Field(
    'educations',
    _$educations,
    opt: true,
  );
  static List<ResumeExperience>? _$experiences(Resume v) => v.experiences;
  static const Field<Resume, List<ResumeExperience>> _f$experiences = Field(
    'experiences',
    _$experiences,
    opt: true,
  );
  static String? _$visibility(Resume v) => v.visibility;
  static const Field<Resume, String> _f$visibility = Field(
    'visibility',
    _$visibility,
    opt: true,
  );
  static String? _$status(Resume v) => v.status;
  static const Field<Resume, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static bool? _$isPrimary(Resume v) => v.isPrimary;
  static const Field<Resume, bool> _f$isPrimary = Field(
    'isPrimary',
    _$isPrimary,
    key: r'is_primary',
    opt: true,
  );
  static int? _$boostScore(Resume v) => v.boostScore;
  static const Field<Resume, int> _f$boostScore = Field(
    'boostScore',
    _$boostScore,
    key: r'boost_score',
    opt: true,
  );
  static DateTime? _$boostedAt(Resume v) => v.boostedAt;
  static const Field<Resume, DateTime> _f$boostedAt = Field(
    'boostedAt',
    _$boostedAt,
    key: r'boosted_at',
    opt: true,
  );
  static DateTime? _$boostUntil(Resume v) => v.boostUntil;
  static const Field<Resume, DateTime> _f$boostUntil = Field(
    'boostUntil',
    _$boostUntil,
    key: r'boost_until',
    opt: true,
  );
  static DateTime? _$nextFreeBoostAt(Resume v) => v.nextFreeBoostAt;
  static const Field<Resume, DateTime> _f$nextFreeBoostAt = Field(
    'nextFreeBoostAt',
    _$nextFreeBoostAt,
    key: r'next_free_boost_at',
    opt: true,
  );
  static DateTime? _$createdAt(Resume v) => v.createdAt;
  static const Field<Resume, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static DateTime? _$updatedAt(Resume v) => v.updatedAt;
  static const Field<Resume, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static bool? _$availableForBoost(Resume v) => v.availableForBoost;
  static const Field<Resume, bool> _f$availableForBoost = Field(
    'availableForBoost',
    _$availableForBoost,
    key: r'available_for_boost',
    opt: true,
  );

  @override
  final MappableFields<Resume> fields = const {
    #id: _f$id,
    #userId: _f$userId,
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
    #isPrimary: _f$isPrimary,
    #boostScore: _f$boostScore,
    #boostedAt: _f$boostedAt,
    #boostUntil: _f$boostUntil,
    #nextFreeBoostAt: _f$nextFreeBoostAt,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #availableForBoost: _f$availableForBoost,
  };

  static Resume _instantiate(DecodingData data) {
    return Resume(
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
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
      isPrimary: data.dec(_f$isPrimary),
      boostScore: data.dec(_f$boostScore),
      boostedAt: data.dec(_f$boostedAt),
      boostUntil: data.dec(_f$boostUntil),
      nextFreeBoostAt: data.dec(_f$nextFreeBoostAt),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      availableForBoost: data.dec(_f$availableForBoost),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Resume fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Resume>(map);
  }

  static Resume fromJson(String json) {
    return ensureInitialized().decodeJson<Resume>(json);
  }
}

mixin ResumeMappable {
  String toJson() {
    return ResumeMapper.ensureInitialized().encodeJson<Resume>(this as Resume);
  }

  Map<String, dynamic> toMap() {
    return ResumeMapper.ensureInitialized().encodeMap<Resume>(this as Resume);
  }

  ResumeCopyWith<Resume, Resume, Resume> get copyWith =>
      _ResumeCopyWithImpl<Resume, Resume>(this as Resume, $identity, $identity);
  @override
  String toString() {
    return ResumeMapper.ensureInitialized().stringifyValue(this as Resume);
  }

  @override
  bool operator ==(Object other) {
    return ResumeMapper.ensureInitialized().equalsValue(this as Resume, other);
  }

  @override
  int get hashCode {
    return ResumeMapper.ensureInitialized().hashValue(this as Resume);
  }
}

extension ResumeValueCopy<$R, $Out> on ObjectCopyWith<$R, Resume, $Out> {
  ResumeCopyWith<$R, Resume, $Out> get $asResume =>
      $base.as((v, t, t2) => _ResumeCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResumeCopyWith<$R, $In extends Resume, $Out>
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
  $R call({
    String? id,
    String? userId,
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
    bool? isPrimary,
    int? boostScore,
    DateTime? boostedAt,
    DateTime? boostUntil,
    DateTime? nextFreeBoostAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? availableForBoost,
  });
  ResumeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ResumeCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Resume, $Out>
    implements ResumeCopyWith<$R, Resume, $Out> {
  _ResumeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Resume> $mapper = ResumeMapper.ensureInitialized();
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
  $R call({
    String? id,
    Object? userId = $none,
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
    Object? isPrimary = $none,
    Object? boostScore = $none,
    Object? boostedAt = $none,
    Object? boostUntil = $none,
    Object? nextFreeBoostAt = $none,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? availableForBoost = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (userId != $none) #userId: userId,
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
      if (isPrimary != $none) #isPrimary: isPrimary,
      if (boostScore != $none) #boostScore: boostScore,
      if (boostedAt != $none) #boostedAt: boostedAt,
      if (boostUntil != $none) #boostUntil: boostUntil,
      if (nextFreeBoostAt != $none) #nextFreeBoostAt: nextFreeBoostAt,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (availableForBoost != $none) #availableForBoost: availableForBoost,
    }),
  );
  @override
  Resume $make(CopyWithData data) => Resume(
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
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
    isPrimary: data.get(#isPrimary, or: $value.isPrimary),
    boostScore: data.get(#boostScore, or: $value.boostScore),
    boostedAt: data.get(#boostedAt, or: $value.boostedAt),
    boostUntil: data.get(#boostUntil, or: $value.boostUntil),
    nextFreeBoostAt: data.get(#nextFreeBoostAt, or: $value.nextFreeBoostAt),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    availableForBoost: data.get(
      #availableForBoost,
      or: $value.availableForBoost,
    ),
  );

  @override
  ResumeCopyWith<$R2, Resume, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ResumeCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

