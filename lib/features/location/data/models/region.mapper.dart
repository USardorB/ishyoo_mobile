// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'region.dart';

class RegionMapper extends ClassMapperBase<Region> {
  RegionMapper._();

  static RegionMapper? _instance;
  static RegionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Region';

  static String _$id(Region v) => v.id;
  static const Field<Region, String> _f$id = Field('id', _$id);
  static String? _$name(Region v) => v.name;
  static const Field<Region, String> _f$name = Field('name', _$name, opt: true);
  static String? _$nameUz(Region v) => v.nameUz;
  static const Field<Region, String> _f$nameUz = Field(
    'nameUz',
    _$nameUz,
    key: r'name_uz',
    opt: true,
  );
  static String? _$nameRu(Region v) => v.nameRu;
  static const Field<Region, String> _f$nameRu = Field(
    'nameRu',
    _$nameRu,
    key: r'name_ru',
    opt: true,
  );
  static String? _$nameEn(Region v) => v.nameEn;
  static const Field<Region, String> _f$nameEn = Field(
    'nameEn',
    _$nameEn,
    key: r'name_en',
    opt: true,
  );

  @override
  final MappableFields<Region> fields = const {
    #id: _f$id,
    #name: _f$name,
    #nameUz: _f$nameUz,
    #nameRu: _f$nameRu,
    #nameEn: _f$nameEn,
  };

  static Region _instantiate(DecodingData data) {
    return Region(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      nameUz: data.dec(_f$nameUz),
      nameRu: data.dec(_f$nameRu),
      nameEn: data.dec(_f$nameEn),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Region fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Region>(map);
  }

  static Region fromJson(String json) {
    return ensureInitialized().decodeJson<Region>(json);
  }
}

mixin RegionMappable {
  String toJson() {
    return RegionMapper.ensureInitialized().encodeJson<Region>(this as Region);
  }

  Map<String, dynamic> toMap() {
    return RegionMapper.ensureInitialized().encodeMap<Region>(this as Region);
  }

  RegionCopyWith<Region, Region, Region> get copyWith =>
      _RegionCopyWithImpl<Region, Region>(this as Region, $identity, $identity);
  @override
  String toString() {
    return RegionMapper.ensureInitialized().stringifyValue(this as Region);
  }

  @override
  bool operator ==(Object other) {
    return RegionMapper.ensureInitialized().equalsValue(this as Region, other);
  }

  @override
  int get hashCode {
    return RegionMapper.ensureInitialized().hashValue(this as Region);
  }
}

extension RegionValueCopy<$R, $Out> on ObjectCopyWith<$R, Region, $Out> {
  RegionCopyWith<$R, Region, $Out> get $asRegion =>
      $base.as((v, t, t2) => _RegionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RegionCopyWith<$R, $In extends Region, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? name,
    String? nameUz,
    String? nameRu,
    String? nameEn,
  });
  RegionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RegionCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Region, $Out>
    implements RegionCopyWith<$R, Region, $Out> {
  _RegionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Region> $mapper = RegionMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? name = $none,
    Object? nameUz = $none,
    Object? nameRu = $none,
    Object? nameEn = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != $none) #name: name,
      if (nameUz != $none) #nameUz: nameUz,
      if (nameRu != $none) #nameRu: nameRu,
      if (nameEn != $none) #nameEn: nameEn,
    }),
  );
  @override
  Region $make(CopyWithData data) => Region(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    nameUz: data.get(#nameUz, or: $value.nameUz),
    nameRu: data.get(#nameRu, or: $value.nameRu),
    nameEn: data.get(#nameEn, or: $value.nameEn),
  );

  @override
  RegionCopyWith<$R2, Region, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RegionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

