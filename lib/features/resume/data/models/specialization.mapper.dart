// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'specialization.dart';

class SpecializationMapper extends ClassMapperBase<Specialization> {
  SpecializationMapper._();

  static SpecializationMapper? _instance;
  static SpecializationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SpecializationMapper._());
      SpecializationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Specialization';

  static int _$id(Specialization v) => v.id;
  static const Field<Specialization, int> _f$id = Field('id', _$id);
  static String _$name(Specialization v) => v.name;
  static const Field<Specialization, String> _f$name = Field('name', _$name);
  static int? _$parentId(Specialization v) => v.parentId;
  static const Field<Specialization, int> _f$parentId = Field(
    'parentId',
    _$parentId,
    key: r'parent_id',
    opt: true,
  );
  static List<Specialization>? _$children(Specialization v) => v.children;
  static const Field<Specialization, List<Specialization>> _f$children = Field(
    'children',
    _$children,
    opt: true,
  );

  @override
  final MappableFields<Specialization> fields = const {
    #id: _f$id,
    #name: _f$name,
    #parentId: _f$parentId,
    #children: _f$children,
  };

  static Specialization _instantiate(DecodingData data) {
    return Specialization(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      parentId: data.dec(_f$parentId),
      children: data.dec(_f$children),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Specialization fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Specialization>(map);
  }

  static Specialization fromJson(String json) {
    return ensureInitialized().decodeJson<Specialization>(json);
  }
}

mixin SpecializationMappable {
  String toJson() {
    return SpecializationMapper.ensureInitialized().encodeJson<Specialization>(
      this as Specialization,
    );
  }

  Map<String, dynamic> toMap() {
    return SpecializationMapper.ensureInitialized().encodeMap<Specialization>(
      this as Specialization,
    );
  }

  SpecializationCopyWith<Specialization, Specialization, Specialization>
  get copyWith => _SpecializationCopyWithImpl<Specialization, Specialization>(
    this as Specialization,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SpecializationMapper.ensureInitialized().stringifyValue(
      this as Specialization,
    );
  }

  @override
  bool operator ==(Object other) {
    return SpecializationMapper.ensureInitialized().equalsValue(
      this as Specialization,
      other,
    );
  }

  @override
  int get hashCode {
    return SpecializationMapper.ensureInitialized().hashValue(
      this as Specialization,
    );
  }
}

extension SpecializationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Specialization, $Out> {
  SpecializationCopyWith<$R, Specialization, $Out> get $asSpecialization =>
      $base.as((v, t, t2) => _SpecializationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SpecializationCopyWith<$R, $In extends Specialization, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    Specialization,
    SpecializationCopyWith<$R, Specialization, Specialization>
  >?
  get children;
  $R call({
    int? id,
    String? name,
    int? parentId,
    List<Specialization>? children,
  });
  SpecializationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SpecializationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Specialization, $Out>
    implements SpecializationCopyWith<$R, Specialization, $Out> {
  _SpecializationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Specialization> $mapper =
      SpecializationMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    Specialization,
    SpecializationCopyWith<$R, Specialization, Specialization>
  >?
  get children => $value.children != null
      ? ListCopyWith(
          $value.children!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(children: v),
        )
      : null;
  @override
  $R call({
    int? id,
    String? name,
    Object? parentId = $none,
    Object? children = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (parentId != $none) #parentId: parentId,
      if (children != $none) #children: children,
    }),
  );
  @override
  Specialization $make(CopyWithData data) => Specialization(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    parentId: data.get(#parentId, or: $value.parentId),
    children: data.get(#children, or: $value.children),
  );

  @override
  SpecializationCopyWith<$R2, Specialization, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SpecializationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

