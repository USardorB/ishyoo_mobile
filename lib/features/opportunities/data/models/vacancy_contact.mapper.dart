// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'vacancy_contact.dart';

class VacancyContactMapper extends ClassMapperBase<VacancyContact> {
  VacancyContactMapper._();

  static VacancyContactMapper? _instance;
  static VacancyContactMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VacancyContactMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VacancyContact';

  static String? _$name(VacancyContact v) => v.name;
  static const Field<VacancyContact, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$email(VacancyContact v) => v.email;
  static const Field<VacancyContact, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$phoneNumber(VacancyContact v) => v.phoneNumber;
  static const Field<VacancyContact, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'phone_number',
    opt: true,
  );

  @override
  final MappableFields<VacancyContact> fields = const {
    #name: _f$name,
    #email: _f$email,
    #phoneNumber: _f$phoneNumber,
  };

  static VacancyContact _instantiate(DecodingData data) {
    return VacancyContact(
      name: data.dec(_f$name),
      email: data.dec(_f$email),
      phoneNumber: data.dec(_f$phoneNumber),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static VacancyContact fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VacancyContact>(map);
  }

  static VacancyContact fromJson(String json) {
    return ensureInitialized().decodeJson<VacancyContact>(json);
  }
}

mixin VacancyContactMappable {
  String toJson() {
    return VacancyContactMapper.ensureInitialized().encodeJson<VacancyContact>(
      this as VacancyContact,
    );
  }

  Map<String, dynamic> toMap() {
    return VacancyContactMapper.ensureInitialized().encodeMap<VacancyContact>(
      this as VacancyContact,
    );
  }

  VacancyContactCopyWith<VacancyContact, VacancyContact, VacancyContact>
  get copyWith => _VacancyContactCopyWithImpl<VacancyContact, VacancyContact>(
    this as VacancyContact,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return VacancyContactMapper.ensureInitialized().stringifyValue(
      this as VacancyContact,
    );
  }

  @override
  bool operator ==(Object other) {
    return VacancyContactMapper.ensureInitialized().equalsValue(
      this as VacancyContact,
      other,
    );
  }

  @override
  int get hashCode {
    return VacancyContactMapper.ensureInitialized().hashValue(
      this as VacancyContact,
    );
  }
}

extension VacancyContactValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VacancyContact, $Out> {
  VacancyContactCopyWith<$R, VacancyContact, $Out> get $asVacancyContact =>
      $base.as((v, t, t2) => _VacancyContactCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VacancyContactCopyWith<$R, $In extends VacancyContact, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? email, String? phoneNumber});
  VacancyContactCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _VacancyContactCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VacancyContact, $Out>
    implements VacancyContactCopyWith<$R, VacancyContact, $Out> {
  _VacancyContactCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VacancyContact> $mapper =
      VacancyContactMapper.ensureInitialized();
  @override
  $R call({
    Object? name = $none,
    Object? email = $none,
    Object? phoneNumber = $none,
  }) => $apply(
    FieldCopyWithData({
      if (name != $none) #name: name,
      if (email != $none) #email: email,
      if (phoneNumber != $none) #phoneNumber: phoneNumber,
    }),
  );
  @override
  VacancyContact $make(CopyWithData data) => VacancyContact(
    name: data.get(#name, or: $value.name),
    email: data.get(#email, or: $value.email),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
  );

  @override
  VacancyContactCopyWith<$R2, VacancyContact, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _VacancyContactCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

