// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'apply_vacancy_request.dart';

class ApplyVacancyRequestMapper extends ClassMapperBase<ApplyVacancyRequest> {
  ApplyVacancyRequestMapper._();

  static ApplyVacancyRequestMapper? _instance;
  static ApplyVacancyRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ApplyVacancyRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ApplyVacancyRequest';

  static String? _$resumeId(ApplyVacancyRequest v) => v.resumeId;
  static const Field<ApplyVacancyRequest, String> _f$resumeId = Field(
    'resumeId',
    _$resumeId,
    key: r'resume_id',
    opt: true,
  );
  static String? _$coverLetter(ApplyVacancyRequest v) => v.coverLetter;
  static const Field<ApplyVacancyRequest, String> _f$coverLetter = Field(
    'coverLetter',
    _$coverLetter,
    key: r'cover_letter',
    opt: true,
  );

  @override
  final MappableFields<ApplyVacancyRequest> fields = const {
    #resumeId: _f$resumeId,
    #coverLetter: _f$coverLetter,
  };

  static ApplyVacancyRequest _instantiate(DecodingData data) {
    return ApplyVacancyRequest(
      resumeId: data.dec(_f$resumeId),
      coverLetter: data.dec(_f$coverLetter),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ApplyVacancyRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ApplyVacancyRequest>(map);
  }

  static ApplyVacancyRequest fromJson(String json) {
    return ensureInitialized().decodeJson<ApplyVacancyRequest>(json);
  }
}

mixin ApplyVacancyRequestMappable {
  String toJson() {
    return ApplyVacancyRequestMapper.ensureInitialized()
        .encodeJson<ApplyVacancyRequest>(this as ApplyVacancyRequest);
  }

  Map<String, dynamic> toMap() {
    return ApplyVacancyRequestMapper.ensureInitialized()
        .encodeMap<ApplyVacancyRequest>(this as ApplyVacancyRequest);
  }

  ApplyVacancyRequestCopyWith<
    ApplyVacancyRequest,
    ApplyVacancyRequest,
    ApplyVacancyRequest
  >
  get copyWith =>
      _ApplyVacancyRequestCopyWithImpl<
        ApplyVacancyRequest,
        ApplyVacancyRequest
      >(this as ApplyVacancyRequest, $identity, $identity);
  @override
  String toString() {
    return ApplyVacancyRequestMapper.ensureInitialized().stringifyValue(
      this as ApplyVacancyRequest,
    );
  }

  @override
  bool operator ==(Object other) {
    return ApplyVacancyRequestMapper.ensureInitialized().equalsValue(
      this as ApplyVacancyRequest,
      other,
    );
  }

  @override
  int get hashCode {
    return ApplyVacancyRequestMapper.ensureInitialized().hashValue(
      this as ApplyVacancyRequest,
    );
  }
}

extension ApplyVacancyRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ApplyVacancyRequest, $Out> {
  ApplyVacancyRequestCopyWith<$R, ApplyVacancyRequest, $Out>
  get $asApplyVacancyRequest => $base.as(
    (v, t, t2) => _ApplyVacancyRequestCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ApplyVacancyRequestCopyWith<
  $R,
  $In extends ApplyVacancyRequest,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? resumeId, String? coverLetter});
  ApplyVacancyRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ApplyVacancyRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ApplyVacancyRequest, $Out>
    implements ApplyVacancyRequestCopyWith<$R, ApplyVacancyRequest, $Out> {
  _ApplyVacancyRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ApplyVacancyRequest> $mapper =
      ApplyVacancyRequestMapper.ensureInitialized();
  @override
  $R call({Object? resumeId = $none, Object? coverLetter = $none}) => $apply(
    FieldCopyWithData({
      if (resumeId != $none) #resumeId: resumeId,
      if (coverLetter != $none) #coverLetter: coverLetter,
    }),
  );
  @override
  ApplyVacancyRequest $make(CopyWithData data) => ApplyVacancyRequest(
    resumeId: data.get(#resumeId, or: $value.resumeId),
    coverLetter: data.get(#coverLetter, or: $value.coverLetter),
  );

  @override
  ApplyVacancyRequestCopyWith<$R2, ApplyVacancyRequest, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ApplyVacancyRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

