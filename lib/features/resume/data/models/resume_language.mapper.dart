// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'resume_language.dart';

class ResumeLanguageMapper extends ClassMapperBase<ResumeLanguage> {
  ResumeLanguageMapper._();

  static ResumeLanguageMapper? _instance;
  static ResumeLanguageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResumeLanguageMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ResumeLanguage';

  static String _$lang(ResumeLanguage v) => v.lang;
  static const Field<ResumeLanguage, String> _f$lang = Field('lang', _$lang);
  static String _$level(ResumeLanguage v) => v.level;
  static const Field<ResumeLanguage, String> _f$level = Field('level', _$level);

  @override
  final MappableFields<ResumeLanguage> fields = const {
    #lang: _f$lang,
    #level: _f$level,
  };

  static ResumeLanguage _instantiate(DecodingData data) {
    return ResumeLanguage(lang: data.dec(_f$lang), level: data.dec(_f$level));
  }

  @override
  final Function instantiate = _instantiate;

  static ResumeLanguage fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResumeLanguage>(map);
  }

  static ResumeLanguage fromJson(String json) {
    return ensureInitialized().decodeJson<ResumeLanguage>(json);
  }
}

mixin ResumeLanguageMappable {
  String toJson() {
    return ResumeLanguageMapper.ensureInitialized().encodeJson<ResumeLanguage>(
      this as ResumeLanguage,
    );
  }

  Map<String, dynamic> toMap() {
    return ResumeLanguageMapper.ensureInitialized().encodeMap<ResumeLanguage>(
      this as ResumeLanguage,
    );
  }

  ResumeLanguageCopyWith<ResumeLanguage, ResumeLanguage, ResumeLanguage>
  get copyWith => _ResumeLanguageCopyWithImpl<ResumeLanguage, ResumeLanguage>(
    this as ResumeLanguage,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ResumeLanguageMapper.ensureInitialized().stringifyValue(
      this as ResumeLanguage,
    );
  }

  @override
  bool operator ==(Object other) {
    return ResumeLanguageMapper.ensureInitialized().equalsValue(
      this as ResumeLanguage,
      other,
    );
  }

  @override
  int get hashCode {
    return ResumeLanguageMapper.ensureInitialized().hashValue(
      this as ResumeLanguage,
    );
  }
}

extension ResumeLanguageValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResumeLanguage, $Out> {
  ResumeLanguageCopyWith<$R, ResumeLanguage, $Out> get $asResumeLanguage =>
      $base.as((v, t, t2) => _ResumeLanguageCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResumeLanguageCopyWith<$R, $In extends ResumeLanguage, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? lang, String? level});
  ResumeLanguageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ResumeLanguageCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResumeLanguage, $Out>
    implements ResumeLanguageCopyWith<$R, ResumeLanguage, $Out> {
  _ResumeLanguageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResumeLanguage> $mapper =
      ResumeLanguageMapper.ensureInitialized();
  @override
  $R call({String? lang, String? level}) => $apply(
    FieldCopyWithData({
      if (lang != null) #lang: lang,
      if (level != null) #level: level,
    }),
  );
  @override
  ResumeLanguage $make(CopyWithData data) => ResumeLanguage(
    lang: data.get(#lang, or: $value.lang),
    level: data.get(#level, or: $value.level),
  );

  @override
  ResumeLanguageCopyWith<$R2, ResumeLanguage, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ResumeLanguageCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

