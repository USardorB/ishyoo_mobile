// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'profile.dart';

class ProfileMapper extends ClassMapperBase<Profile> {
  ProfileMapper._();

  static ProfileMapper? _instance;
  static ProfileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProfileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Profile';

  static String _$id(Profile v) => v.id;
  static const Field<Profile, String> _f$id = Field('id', _$id);
  static String? _$avatarUrl(Profile v) => v.avatarUrl;
  static const Field<Profile, String> _f$avatarUrl = Field(
    'avatarUrl',
    _$avatarUrl,
    key: r'avatar_url',
    opt: true,
  );
  static String? _$firstName(Profile v) => v.firstName;
  static const Field<Profile, String> _f$firstName = Field(
    'firstName',
    _$firstName,
    key: r'first_name',
    opt: true,
  );
  static String? _$lastName(Profile v) => v.lastName;
  static const Field<Profile, String> _f$lastName = Field(
    'lastName',
    _$lastName,
    key: r'last_name',
    opt: true,
  );
  static String? _$email(Profile v) => v.email;
  static const Field<Profile, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$phoneNumber(Profile v) => v.phoneNumber;
  static const Field<Profile, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'phone_number',
    opt: true,
  );
  static String? _$city(Profile v) => v.city;
  static const Field<Profile, String> _f$city = Field(
    'city',
    _$city,
    opt: true,
  );
  static String? _$birthDate(Profile v) => v.birthDate;
  static const Field<Profile, String> _f$birthDate = Field(
    'birthDate',
    _$birthDate,
    key: r'birth_date',
    opt: true,
  );
  static String? _$bio(Profile v) => v.bio;
  static const Field<Profile, String> _f$bio = Field('bio', _$bio, opt: true);

  @override
  final MappableFields<Profile> fields = const {
    #id: _f$id,
    #avatarUrl: _f$avatarUrl,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #email: _f$email,
    #phoneNumber: _f$phoneNumber,
    #city: _f$city,
    #birthDate: _f$birthDate,
    #bio: _f$bio,
  };

  static Profile _instantiate(DecodingData data) {
    return Profile(
      id: data.dec(_f$id),
      avatarUrl: data.dec(_f$avatarUrl),
      firstName: data.dec(_f$firstName),
      lastName: data.dec(_f$lastName),
      email: data.dec(_f$email),
      phoneNumber: data.dec(_f$phoneNumber),
      city: data.dec(_f$city),
      birthDate: data.dec(_f$birthDate),
      bio: data.dec(_f$bio),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Profile fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Profile>(map);
  }

  static Profile fromJson(String json) {
    return ensureInitialized().decodeJson<Profile>(json);
  }
}

mixin ProfileMappable {
  String toJson() {
    return ProfileMapper.ensureInitialized().encodeJson<Profile>(
      this as Profile,
    );
  }

  Map<String, dynamic> toMap() {
    return ProfileMapper.ensureInitialized().encodeMap<Profile>(
      this as Profile,
    );
  }

  ProfileCopyWith<Profile, Profile, Profile> get copyWith =>
      _ProfileCopyWithImpl<Profile, Profile>(
        this as Profile,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProfileMapper.ensureInitialized().stringifyValue(this as Profile);
  }

  @override
  bool operator ==(Object other) {
    return ProfileMapper.ensureInitialized().equalsValue(
      this as Profile,
      other,
    );
  }

  @override
  int get hashCode {
    return ProfileMapper.ensureInitialized().hashValue(this as Profile);
  }
}

extension ProfileValueCopy<$R, $Out> on ObjectCopyWith<$R, Profile, $Out> {
  ProfileCopyWith<$R, Profile, $Out> get $asProfile =>
      $base.as((v, t, t2) => _ProfileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProfileCopyWith<$R, $In extends Profile, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? avatarUrl,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? city,
    String? birthDate,
    String? bio,
  });
  ProfileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProfileCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Profile, $Out>
    implements ProfileCopyWith<$R, Profile, $Out> {
  _ProfileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Profile> $mapper =
      ProfileMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    Object? avatarUrl = $none,
    Object? firstName = $none,
    Object? lastName = $none,
    Object? email = $none,
    Object? phoneNumber = $none,
    Object? city = $none,
    Object? birthDate = $none,
    Object? bio = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (avatarUrl != $none) #avatarUrl: avatarUrl,
      if (firstName != $none) #firstName: firstName,
      if (lastName != $none) #lastName: lastName,
      if (email != $none) #email: email,
      if (phoneNumber != $none) #phoneNumber: phoneNumber,
      if (city != $none) #city: city,
      if (birthDate != $none) #birthDate: birthDate,
      if (bio != $none) #bio: bio,
    }),
  );
  @override
  Profile $make(CopyWithData data) => Profile(
    id: data.get(#id, or: $value.id),
    avatarUrl: data.get(#avatarUrl, or: $value.avatarUrl),
    firstName: data.get(#firstName, or: $value.firstName),
    lastName: data.get(#lastName, or: $value.lastName),
    email: data.get(#email, or: $value.email),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    city: data.get(#city, or: $value.city),
    birthDate: data.get(#birthDate, or: $value.birthDate),
    bio: data.get(#bio, or: $value.bio),
  );

  @override
  ProfileCopyWith<$R2, Profile, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProfileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

