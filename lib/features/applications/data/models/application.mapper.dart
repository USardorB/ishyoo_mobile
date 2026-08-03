// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'application.dart';

class ApplicationMapper extends ClassMapperBase<Application> {
  ApplicationMapper._();

  static ApplicationMapper? _instance;
  static ApplicationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApplicationMapper._());
      VacancyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Application';

  static int _$id(Application v) => v.id;
  static const Field<Application, int> _f$id = Field('id', _$id);
  static String? _$coverLetter(Application v) => v.coverLetter;
  static const Field<Application, String> _f$coverLetter = Field(
    'coverLetter',
    _$coverLetter,
    key: r'cover_letter',
    opt: true,
  );
  static String _$status(Application v) => v.status;
  static const Field<Application, String> _f$status = Field('status', _$status);
  static DateTime? _$createdAt(Application v) => v.createdAt;
  static const Field<Application, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static DateTime? _$updatedAt(Application v) => v.updatedAt;
  static const Field<Application, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$resumeId(Application v) => v.resumeId;
  static const Field<Application, String> _f$resumeId = Field(
    'resumeId',
    _$resumeId,
    key: r'resume_id',
    opt: true,
  );
  static String? _$vacancyId(Application v) => v.vacancyId;
  static const Field<Application, String> _f$vacancyId = Field(
    'vacancyId',
    _$vacancyId,
    key: r'vacancy_id',
    opt: true,
  );
  static Vacancy? _$vacancy(Application v) => v.vacancy;
  static const Field<Application, Vacancy> _f$vacancy = Field(
    'vacancy',
    _$vacancy,
    opt: true,
  );

  @override
  final MappableFields<Application> fields = const {
    #id: _f$id,
    #coverLetter: _f$coverLetter,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #resumeId: _f$resumeId,
    #vacancyId: _f$vacancyId,
    #vacancy: _f$vacancy,
  };

  static Application _instantiate(DecodingData data) {
    return Application(
      id: data.dec(_f$id),
      coverLetter: data.dec(_f$coverLetter),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      resumeId: data.dec(_f$resumeId),
      vacancyId: data.dec(_f$vacancyId),
      vacancy: data.dec(_f$vacancy),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Application fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Application>(map);
  }

  static Application fromJson(String json) {
    return ensureInitialized().decodeJson<Application>(json);
  }
}

mixin ApplicationMappable {
  String toJson() {
    return ApplicationMapper.ensureInitialized().encodeJson<Application>(
      this as Application,
    );
  }

  Map<String, dynamic> toMap() {
    return ApplicationMapper.ensureInitialized().encodeMap<Application>(
      this as Application,
    );
  }

  ApplicationCopyWith<Application, Application, Application> get copyWith =>
      _ApplicationCopyWithImpl<Application, Application>(
        this as Application,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ApplicationMapper.ensureInitialized().stringifyValue(
      this as Application,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApplicationMapper.ensureInitialized().equalsValue(
      this as Application,
      other,
    );
  }

  @override
  int get hashCode {
    return ApplicationMapper.ensureInitialized().hashValue(this as Application);
  }
}

extension ApplicationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Application, $Out> {
  ApplicationCopyWith<$R, Application, $Out> get $asApplication =>
      $base.as((v, t, t2) => _ApplicationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ApplicationCopyWith<$R, $In extends Application, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  VacancyCopyWith<$R, Vacancy, Vacancy>? get vacancy;
  $R call({
    int? id,
    String? coverLetter,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? resumeId,
    String? vacancyId,
    Vacancy? vacancy,
  });
  ApplicationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ApplicationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Application, $Out>
    implements ApplicationCopyWith<$R, Application, $Out> {
  _ApplicationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Application> $mapper =
      ApplicationMapper.ensureInitialized();
  @override
  VacancyCopyWith<$R, Vacancy, Vacancy>? get vacancy =>
      $value.vacancy?.copyWith.$chain((v) => call(vacancy: v));
  @override
  $R call({
    int? id,
    Object? coverLetter = $none,
    String? status,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? resumeId = $none,
    Object? vacancyId = $none,
    Object? vacancy = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (coverLetter != $none) #coverLetter: coverLetter,
      if (status != null) #status: status,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (resumeId != $none) #resumeId: resumeId,
      if (vacancyId != $none) #vacancyId: vacancyId,
      if (vacancy != $none) #vacancy: vacancy,
    }),
  );
  @override
  Application $make(CopyWithData data) => Application(
    id: data.get(#id, or: $value.id),
    coverLetter: data.get(#coverLetter, or: $value.coverLetter),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    resumeId: data.get(#resumeId, or: $value.resumeId),
    vacancyId: data.get(#vacancyId, or: $value.vacancyId),
    vacancy: data.get(#vacancy, or: $value.vacancy),
  );

  @override
  ApplicationCopyWith<$R2, Application, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ApplicationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

