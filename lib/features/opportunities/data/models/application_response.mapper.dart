// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'application_response.dart';

class ApplicationResponseMapper extends ClassMapperBase<ApplicationResponse> {
  ApplicationResponseMapper._();

  static ApplicationResponseMapper? _instance;
  static ApplicationResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApplicationResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApplicationResponse';

  static num _$id(ApplicationResponse v) => v.id;
  static const Field<ApplicationResponse, num> _f$id = Field('id', _$id);
  static String? _$coverLetter(ApplicationResponse v) => v.coverLetter;
  static const Field<ApplicationResponse, String> _f$coverLetter = Field(
    'coverLetter',
    _$coverLetter,
    key: r'cover_letter',
    opt: true,
  );
  static String _$status(ApplicationResponse v) => v.status;
  static const Field<ApplicationResponse, String> _f$status = Field(
    'status',
    _$status,
  );
  static DateTime? _$createdAt(ApplicationResponse v) => v.createdAt;
  static const Field<ApplicationResponse, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static DateTime? _$updatedAt(ApplicationResponse v) => v.updatedAt;
  static const Field<ApplicationResponse, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
    opt: true,
  );
  static String? _$vacancyId(ApplicationResponse v) => v.vacancyId;
  static const Field<ApplicationResponse, String> _f$vacancyId = Field(
    'vacancyId',
    _$vacancyId,
    key: r'vacancy_id',
    opt: true,
  );
  static String? _$resumeId(ApplicationResponse v) => v.resumeId;
  static const Field<ApplicationResponse, String> _f$resumeId = Field(
    'resumeId',
    _$resumeId,
    key: r'resume_id',
    opt: true,
  );

  @override
  final MappableFields<ApplicationResponse> fields = const {
    #id: _f$id,
    #coverLetter: _f$coverLetter,
    #status: _f$status,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #vacancyId: _f$vacancyId,
    #resumeId: _f$resumeId,
  };

  static ApplicationResponse _instantiate(DecodingData data) {
    return ApplicationResponse(
      id: data.dec(_f$id),
      coverLetter: data.dec(_f$coverLetter),
      status: data.dec(_f$status),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      vacancyId: data.dec(_f$vacancyId),
      resumeId: data.dec(_f$resumeId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ApplicationResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApplicationResponse>(map);
  }

  static ApplicationResponse fromJson(String json) {
    return ensureInitialized().decodeJson<ApplicationResponse>(json);
  }
}

mixin ApplicationResponseMappable {
  String toJson() {
    return ApplicationResponseMapper.ensureInitialized()
        .encodeJson<ApplicationResponse>(this as ApplicationResponse);
  }

  Map<String, dynamic> toMap() {
    return ApplicationResponseMapper.ensureInitialized()
        .encodeMap<ApplicationResponse>(this as ApplicationResponse);
  }

  ApplicationResponseCopyWith<
    ApplicationResponse,
    ApplicationResponse,
    ApplicationResponse
  >
  get copyWith =>
      _ApplicationResponseCopyWithImpl<
        ApplicationResponse,
        ApplicationResponse
      >(this as ApplicationResponse, $identity, $identity);
  @override
  String toString() {
    return ApplicationResponseMapper.ensureInitialized().stringifyValue(
      this as ApplicationResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApplicationResponseMapper.ensureInitialized().equalsValue(
      this as ApplicationResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return ApplicationResponseMapper.ensureInitialized().hashValue(
      this as ApplicationResponse,
    );
  }
}

extension ApplicationResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApplicationResponse, $Out> {
  ApplicationResponseCopyWith<$R, ApplicationResponse, $Out>
  get $asApplicationResponse => $base.as(
    (v, t, t2) => _ApplicationResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ApplicationResponseCopyWith<
  $R,
  $In extends ApplicationResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    num? id,
    String? coverLetter,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? vacancyId,
    String? resumeId,
  });
  ApplicationResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ApplicationResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApplicationResponse, $Out>
    implements ApplicationResponseCopyWith<$R, ApplicationResponse, $Out> {
  _ApplicationResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApplicationResponse> $mapper =
      ApplicationResponseMapper.ensureInitialized();
  @override
  $R call({
    num? id,
    Object? coverLetter = $none,
    String? status,
    Object? createdAt = $none,
    Object? updatedAt = $none,
    Object? vacancyId = $none,
    Object? resumeId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (coverLetter != $none) #coverLetter: coverLetter,
      if (status != null) #status: status,
      if (createdAt != $none) #createdAt: createdAt,
      if (updatedAt != $none) #updatedAt: updatedAt,
      if (vacancyId != $none) #vacancyId: vacancyId,
      if (resumeId != $none) #resumeId: resumeId,
    }),
  );
  @override
  ApplicationResponse $make(CopyWithData data) => ApplicationResponse(
    id: data.get(#id, or: $value.id),
    coverLetter: data.get(#coverLetter, or: $value.coverLetter),
    status: data.get(#status, or: $value.status),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    vacancyId: data.get(#vacancyId, or: $value.vacancyId),
    resumeId: data.get(#resumeId, or: $value.resumeId),
  );

  @override
  ApplicationResponseCopyWith<$R2, ApplicationResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ApplicationResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

