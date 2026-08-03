// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'district.dart';

class DistrictMapper extends ClassMapperBase<District> {
  DistrictMapper._();

  static DistrictMapper? _instance;
  static DistrictMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DistrictMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'District';

  static String _$id(District v) => v.id;
  static const Field<District, String> _f$id = Field('id', _$id);
  static String? _$regionId(District v) => v.regionId;
  static const Field<District, String> _f$regionId = Field(
    'regionId',
    _$regionId,
    key: r'region_id',
    opt: true,
  );
  static String? _$name(District v) => v.name;
  static const Field<District, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$nameUz(District v) => v.nameUz;
  static const Field<District, String> _f$nameUz = Field(
    'nameUz',
    _$nameUz,
    key: r'name_uz',
    opt: true,
  );
  static String? _$nameRu(District v) => v.nameRu;
  static const Field<District, String> _f$nameRu = Field(
    'nameRu',
    _$nameRu,
    key: r'name_ru',
    opt: true,
  );
  static String? _$nameEn(District v) => v.nameEn;
  static const Field<District, String> _f$nameEn = Field(
    'nameEn',
    _$nameEn,
    key: r'name_en',
    opt: true,
  );

  @override
  final MappableFields<District> fields = const {
    #id: _f$id,
    #regionId: _f$regionId,
    #name: _f$name,
    #nameUz: _f$nameUz,
    #nameRu: _f$nameRu,
    #nameEn: _f$nameEn,
  };

  static District _instantiate(DecodingData data) {
    return District(
      id: data.dec(_f$id),
      regionId: data.dec(_f$regionId),
      name: data.dec(_f$name),
      nameUz: data.dec(_f$nameUz),
      nameRu: data.dec(_f$nameRu),
      nameEn: data.dec(_f$nameEn),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static District fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<District>(map);
  }

  static District fromJson(String json) {
    return ensureInitialized().decodeJson<District>(json);
  }
}

mixin DistrictMappable {
  String toJson() {
    return DistrictMapper.ensureInitialized().encodeJson<District>(
      this as District,
    );
  }

  Map<String, dynamic> toMap() {
    return DistrictMapper.ensureInitialized().encodeMap<District>(
      this as District,
    );
  }

  DistrictCopyWith<District, District, District> get copyWith =>
      _DistrictCopyWithImpl<District, District>(
        this as District,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return DistrictMapper.ensureInitialized().stringifyValue(this as District);
  }

  @override
  bool operator ==(Object other) {
    return DistrictMapper.ensureInitialized().equalsValue(
      this as District,
      other,
    );
  }

  @override
  int get hashCode {
    return DistrictMapper.ensureInitialized().hashValue(this as District);
  }
}

extension DistrictValueCopy<$R, $Out> on ObjectCopyWith<$R, District, $Out> {
  DistrictCopyWith<$R, District, $Out> get $asDistrict =>
      $base.as((v, t, t2) => _DistrictCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DistrictCopyWith<$R, $In extends District, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? regionId,
    String? name,
    String? nameUz,
    String? nameRu,
    String? nameEn,
  });
  DistrictCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DistrictCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, District, $Out>
    implements DistrictCopyWith<$R, District, $Out> {
  _DistrictCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<District> $mapper =
      DistrictMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? regionId = $none,
    Object? name = $none,
    Object? nameUz = $none,
    Object? nameRu = $none,
    Object? nameEn = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (regionId != $none) #regionId: regionId,
      if (name != $none) #name: name,
      if (nameUz != $none) #nameUz: nameUz,
      if (nameRu != $none) #nameRu: nameRu,
      if (nameEn != $none) #nameEn: nameEn,
    }),
  );
  @override
  District $make(CopyWithData data) => District(
    id: data.get(#id, or: $value.id),
    regionId: data.get(#regionId, or: $value.regionId),
    name: data.get(#name, or: $value.name),
    nameUz: data.get(#nameUz, or: $value.nameUz),
    nameRu: data.get(#nameRu, or: $value.nameRu),
    nameEn: data.get(#nameEn, or: $value.nameEn),
  );

  @override
  DistrictCopyWith<$R2, District, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _DistrictCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

