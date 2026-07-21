// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'vacancy.dart';

class VacancyMapper extends ClassMapperBase<Vacancy> {
  VacancyMapper._();

  static VacancyMapper? _instance;
  static VacancyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VacancyMapper._());
      VacancyContactMapper.ensureInitialized();
      OrganizationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Vacancy';

  static String _$id(Vacancy v) => v.id;
  static const Field<Vacancy, String> _f$id = Field('id', _$id);
  static String _$jobTitle(Vacancy v) => v.jobTitle;
  static const Field<Vacancy, String> _f$jobTitle = Field(
    'jobTitle',
    _$jobTitle,
    key: r'job_title',
  );
  static String? _$location(Vacancy v) => v.location;
  static const Field<Vacancy, String> _f$location = Field(
    'location',
    _$location,
  );
  static String? _$specialization(Vacancy v) => v.specialization;
  static const Field<Vacancy, String> _f$specialization = Field(
    'specialization',
    _$specialization,
  );
  static String? _$jobType(Vacancy v) => v.jobType;
  static const Field<Vacancy, String> _f$jobType = Field(
    'jobType',
    _$jobType,
    key: r'job_type',
  );
  static String? _$experienceLevel(Vacancy v) => v.experienceLevel;
  static const Field<Vacancy, String> _f$experienceLevel = Field(
    'experienceLevel',
    _$experienceLevel,
    key: r'experience_level',
  );
  static double? _$salaryFrom(Vacancy v) => v.salaryFrom;
  static const Field<Vacancy, double> _f$salaryFrom = Field(
    'salaryFrom',
    _$salaryFrom,
    key: r'salary_from',
    opt: true,
  );
  static double? _$salaryTo(Vacancy v) => v.salaryTo;
  static const Field<Vacancy, double> _f$salaryTo = Field(
    'salaryTo',
    _$salaryTo,
    key: r'salary_to',
    opt: true,
  );
  static String? _$currency(Vacancy v) => v.currency;
  static const Field<Vacancy, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
  );
  static List<String>? _$keySkills(Vacancy v) => v.keySkills;
  static const Field<Vacancy, List<String>> _f$keySkills = Field(
    'keySkills',
    _$keySkills,
    key: r'key_skills',
    opt: true,
  );
  static String? _$description(Vacancy v) => v.description;
  static const Field<Vacancy, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String? _$requirements(Vacancy v) => v.requirements;
  static const Field<Vacancy, String> _f$requirements = Field(
    'requirements',
    _$requirements,
    opt: true,
  );
  static String? _$responsibilities(Vacancy v) => v.responsibilities;
  static const Field<Vacancy, String> _f$responsibilities = Field(
    'responsibilities',
    _$responsibilities,
    opt: true,
  );
  static VacancyContact? _$contact(Vacancy v) => v.contact;
  static const Field<Vacancy, VacancyContact> _f$contact = Field(
    'contact',
    _$contact,
    opt: true,
  );
  static bool? _$isTemporary(Vacancy v) => v.isTemporary;
  static const Field<Vacancy, bool> _f$isTemporary = Field(
    'isTemporary',
    _$isTemporary,
    key: r'is_temporary',
    opt: true,
  );
  static String? _$status(Vacancy v) => v.status;
  static const Field<Vacancy, String> _f$status = Field(
    'status',
    _$status,
    opt: true,
  );
  static DateTime? _$publishedAt(Vacancy v) => v.publishedAt;
  static const Field<Vacancy, DateTime> _f$publishedAt = Field(
    'publishedAt',
    _$publishedAt,
    key: r'published_at',
    opt: true,
  );
  static DateTime? _$updatedAt(Vacancy v) => v.updatedAt;
  static const Field<Vacancy, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static DateTime? _$createdAt(Vacancy v) => v.createdAt;
  static const Field<Vacancy, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static String? _$organizationId(Vacancy v) => v.organizationId;
  static const Field<Vacancy, String> _f$organizationId = Field(
    'organizationId',
    _$organizationId,
    key: r'organization_id',
    opt: true,
  );
  static Organization? _$organization(Vacancy v) => v.organization;
  static const Field<Vacancy, Organization> _f$organization = Field(
    'organization',
    _$organization,
    opt: true,
  );
  static String? _$latitude(Vacancy v) => v.latitude;
  static const Field<Vacancy, String> _f$latitude = Field(
    'latitude',
    _$latitude,
    opt: true,
  );
  static String? _$longitude(Vacancy v) => v.longitude;
  static const Field<Vacancy, String> _f$longitude = Field(
    'longitude',
    _$longitude,
    opt: true,
  );
  static bool? _$hasApplied(Vacancy v) => v.hasApplied;
  static const Field<Vacancy, bool> _f$hasApplied = Field(
    'hasApplied',
    _$hasApplied,
    key: r'has_applied',
    opt: true,
  );
  static bool? _$hasSaved(Vacancy v) => v.hasSaved;
  static const Field<Vacancy, bool> _f$hasSaved = Field(
    'hasSaved',
    _$hasSaved,
    key: r'has_saved',
    opt: true,
  );
  static double? _$distance(Vacancy v) => v.distance;
  static const Field<Vacancy, double> _f$distance = Field(
    'distance',
    _$distance,
    opt: true,
  );

  @override
  final MappableFields<Vacancy> fields = const {
    #id: _f$id,
    #jobTitle: _f$jobTitle,
    #location: _f$location,
    #specialization: _f$specialization,
    #jobType: _f$jobType,
    #experienceLevel: _f$experienceLevel,
    #salaryFrom: _f$salaryFrom,
    #salaryTo: _f$salaryTo,
    #currency: _f$currency,
    #keySkills: _f$keySkills,
    #description: _f$description,
    #requirements: _f$requirements,
    #responsibilities: _f$responsibilities,
    #contact: _f$contact,
    #isTemporary: _f$isTemporary,
    #status: _f$status,
    #publishedAt: _f$publishedAt,
    #updatedAt: _f$updatedAt,
    #createdAt: _f$createdAt,
    #organizationId: _f$organizationId,
    #organization: _f$organization,
    #latitude: _f$latitude,
    #longitude: _f$longitude,
    #hasApplied: _f$hasApplied,
    #hasSaved: _f$hasSaved,
    #distance: _f$distance,
  };

  static Vacancy _instantiate(DecodingData data) {
    return Vacancy(
      id: data.dec(_f$id),
      jobTitle: data.dec(_f$jobTitle),
      location: data.dec(_f$location),
      specialization: data.dec(_f$specialization),
      jobType: data.dec(_f$jobType),
      experienceLevel: data.dec(_f$experienceLevel),
      salaryFrom: data.dec(_f$salaryFrom),
      salaryTo: data.dec(_f$salaryTo),
      currency: data.dec(_f$currency),
      keySkills: data.dec(_f$keySkills),
      description: data.dec(_f$description),
      requirements: data.dec(_f$requirements),
      responsibilities: data.dec(_f$responsibilities),
      contact: data.dec(_f$contact),
      isTemporary: data.dec(_f$isTemporary),
      status: data.dec(_f$status),
      publishedAt: data.dec(_f$publishedAt),
      updatedAt: data.dec(_f$updatedAt),
      createdAt: data.dec(_f$createdAt),
      organizationId: data.dec(_f$organizationId),
      organization: data.dec(_f$organization),
      latitude: data.dec(_f$latitude),
      longitude: data.dec(_f$longitude),
      hasApplied: data.dec(_f$hasApplied),
      hasSaved: data.dec(_f$hasSaved),
      distance: data.dec(_f$distance),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Vacancy fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Vacancy>(map);
  }

  static Vacancy fromJson(String json) {
    return ensureInitialized().decodeJson<Vacancy>(json);
  }
}

mixin VacancyMappable {
  String toJson() {
    return VacancyMapper.ensureInitialized().encodeJson<Vacancy>(
      this as Vacancy,
    );
  }

  Map<String, dynamic> toMap() {
    return VacancyMapper.ensureInitialized().encodeMap<Vacancy>(
      this as Vacancy,
    );
  }

  VacancyCopyWith<Vacancy, Vacancy, Vacancy> get copyWith =>
      _VacancyCopyWithImpl<Vacancy, Vacancy>(
        this as Vacancy,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return VacancyMapper.ensureInitialized().stringifyValue(this as Vacancy);
  }

  @override
  bool operator ==(Object other) {
    return VacancyMapper.ensureInitialized().equalsValue(
      this as Vacancy,
      other,
    );
  }

  @override
  int get hashCode {
    return VacancyMapper.ensureInitialized().hashValue(this as Vacancy);
  }
}

extension VacancyValueCopy<$R, $Out> on ObjectCopyWith<$R, Vacancy, $Out> {
  VacancyCopyWith<$R, Vacancy, $Out> get $asVacancy =>
      $base.as((v, t, t2) => _VacancyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VacancyCopyWith<$R, $In extends Vacancy, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get keySkills;
  VacancyContactCopyWith<$R, VacancyContact, VacancyContact>? get contact;
  OrganizationCopyWith<$R, Organization, Organization>? get organization;
  $R call({
    String? id,
    String? jobTitle,
    String? location,
    String? specialization,
    String? jobType,
    String? experienceLevel,
    double? salaryFrom,
    double? salaryTo,
    String? currency,
    List<String>? keySkills,
    String? description,
    String? requirements,
    String? responsibilities,
    VacancyContact? contact,
    bool? isTemporary,
    String? status,
    DateTime? publishedAt,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? organizationId,
    Organization? organization,
    String? latitude,
    String? longitude,
    bool? hasApplied,
    bool? hasSaved,
    double? distance,
  });
  VacancyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VacancyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Vacancy, $Out>
    implements VacancyCopyWith<$R, Vacancy, $Out> {
  _VacancyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Vacancy> $mapper =
      VacancyMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get keySkills =>
      $value.keySkills != null
      ? ListCopyWith(
          $value.keySkills!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(keySkills: v),
        )
      : null;
  @override
  VacancyContactCopyWith<$R, VacancyContact, VacancyContact>? get contact =>
      $value.contact?.copyWith.$chain((v) => call(contact: v));
  @override
  OrganizationCopyWith<$R, Organization, Organization>? get organization =>
      $value.organization?.copyWith.$chain((v) => call(organization: v));
  @override
  $R call({
    String? id,
    String? jobTitle,
    Object? location = $none,
    Object? specialization = $none,
    Object? jobType = $none,
    Object? experienceLevel = $none,
    Object? salaryFrom = $none,
    Object? salaryTo = $none,
    Object? currency = $none,
    Object? keySkills = $none,
    Object? description = $none,
    Object? requirements = $none,
    Object? responsibilities = $none,
    Object? contact = $none,
    Object? isTemporary = $none,
    Object? status = $none,
    Object? publishedAt = $none,
    Object? updatedAt = $none,
    Object? createdAt = $none,
    Object? organizationId = $none,
    Object? organization = $none,
    Object? latitude = $none,
    Object? longitude = $none,
    Object? hasApplied = $none,
    Object? hasSaved = $none,
    Object? distance = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (jobTitle != null) #jobTitle: jobTitle,
      if (location != $none) #location: location,
      if (specialization != $none) #specialization: specialization,
      if (jobType != $none) #jobType: jobType,
      if (experienceLevel != $none) #experienceLevel: experienceLevel,
      if (salaryFrom != $none) #salaryFrom: salaryFrom,
      if (salaryTo != $none) #salaryTo: salaryTo,
      if (currency != $none) #currency: currency,
      if (keySkills != $none) #keySkills: keySkills,
      if (description != $none) #description: description,
      if (requirements != $none) #requirements: requirements,
      if (responsibilities != $none) #responsibilities: responsibilities,
      if (contact != $none) #contact: contact,
      if (isTemporary != $none) #isTemporary: isTemporary,
      if (status != $none) #status: status,
      if (publishedAt != $none) #publishedAt: publishedAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (createdAt != $none) #createdAt: createdAt,
      if (organizationId != $none) #organizationId: organizationId,
      if (organization != $none) #organization: organization,
      if (latitude != $none) #latitude: latitude,
      if (longitude != $none) #longitude: longitude,
      if (hasApplied != $none) #hasApplied: hasApplied,
      if (hasSaved != $none) #hasSaved: hasSaved,
      if (distance != $none) #distance: distance,
    }),
  );
  @override
  Vacancy $make(CopyWithData data) => Vacancy(
    id: data.get(#id, or: $value.id),
    jobTitle: data.get(#jobTitle, or: $value.jobTitle),
    location: data.get(#location, or: $value.location),
    specialization: data.get(#specialization, or: $value.specialization),
    jobType: data.get(#jobType, or: $value.jobType),
    experienceLevel: data.get(#experienceLevel, or: $value.experienceLevel),
    salaryFrom: data.get(#salaryFrom, or: $value.salaryFrom),
    salaryTo: data.get(#salaryTo, or: $value.salaryTo),
    currency: data.get(#currency, or: $value.currency),
    keySkills: data.get(#keySkills, or: $value.keySkills),
    description: data.get(#description, or: $value.description),
    requirements: data.get(#requirements, or: $value.requirements),
    responsibilities: data.get(#responsibilities, or: $value.responsibilities),
    contact: data.get(#contact, or: $value.contact),
    isTemporary: data.get(#isTemporary, or: $value.isTemporary),
    status: data.get(#status, or: $value.status),
    publishedAt: data.get(#publishedAt, or: $value.publishedAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    organizationId: data.get(#organizationId, or: $value.organizationId),
    organization: data.get(#organization, or: $value.organization),
    latitude: data.get(#latitude, or: $value.latitude),
    longitude: data.get(#longitude, or: $value.longitude),
    hasApplied: data.get(#hasApplied, or: $value.hasApplied),
    hasSaved: data.get(#hasSaved, or: $value.hasSaved),
    distance: data.get(#distance, or: $value.distance),
  );

  @override
  VacancyCopyWith<$R2, Vacancy, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _VacancyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

