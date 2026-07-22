// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'organization.dart';

class OrganizationMapper extends ClassMapperBase<Organization> {
  OrganizationMapper._();

  static OrganizationMapper? _instance;
  static OrganizationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OrganizationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Organization';

  static String? _$id(Organization v) => v.id;
  static const Field<Organization, String> _f$id = Field('id', _$id, opt: true);
  static String? _$logo(Organization v) => v.logo;
  static const Field<Organization, String> _f$logo = Field(
    'logo',
    _$logo,
    opt: true,
  );
  static String? _$name(Organization v) => v.name;
  static const Field<Organization, String> _f$name = Field(
    'name',
    _$name,
    opt: true,
  );
  static String? _$industry(Organization v) => v.industry;
  static const Field<Organization, String> _f$industry = Field(
    'industry',
    _$industry,
    opt: true,
  );
  static String? _$size(Organization v) => v.size;
  static const Field<Organization, String> _f$size = Field(
    'size',
    _$size,
    opt: true,
  );
  static String? _$website(Organization v) => v.website;
  static const Field<Organization, String> _f$website = Field(
    'website',
    _$website,
    opt: true,
  );
  static String? _$description(Organization v) => v.description;
  static const Field<Organization, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static String? _$location(Organization v) => v.location;
  static const Field<Organization, String> _f$location = Field(
    'location',
    _$location,
    opt: true,
  );
  static DateTime? _$createdAt(Organization v) => v.createdAt;
  static const Field<Organization, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
    opt: true,
  );
  static double? _$balance(Organization v) => v.balance;
  static const Field<Organization, double> _f$balance = Field(
    'balance',
    _$balance,
    opt: true,
  );
  static int? _$clientNumber(Organization v) => v.clientNumber;
  static const Field<Organization, int> _f$clientNumber = Field(
    'clientNumber',
    _$clientNumber,
    key: r'client_number',
    opt: true,
  );
  static List<String>? _$perks(Organization v) => v.perks;
  static const Field<Organization, List<String>> _f$perks = Field(
    'perks',
    _$perks,
    opt: true,
  );
  static bool? _$isSubscripted(Organization v) => v.isSubscripted;
  static const Field<Organization, bool> _f$isSubscripted = Field(
    'isSubscripted',
    _$isSubscripted,
    key: r'is_subscripted',
    opt: true,
  );
  static String? _$userId(Organization v) => v.userId;
  static const Field<Organization, String> _f$userId = Field(
    'userId',
    _$userId,
    key: r'user_id',
    opt: true,
  );

  @override
  final MappableFields<Organization> fields = const {
    #id: _f$id,
    #logo: _f$logo,
    #name: _f$name,
    #industry: _f$industry,
    #size: _f$size,
    #website: _f$website,
    #description: _f$description,
    #location: _f$location,
    #createdAt: _f$createdAt,
    #balance: _f$balance,
    #clientNumber: _f$clientNumber,
    #perks: _f$perks,
    #isSubscripted: _f$isSubscripted,
    #userId: _f$userId,
  };

  static Organization _instantiate(DecodingData data) {
    return Organization(
      id: data.dec(_f$id),
      logo: data.dec(_f$logo),
      name: data.dec(_f$name),
      industry: data.dec(_f$industry),
      size: data.dec(_f$size),
      website: data.dec(_f$website),
      description: data.dec(_f$description),
      location: data.dec(_f$location),
      createdAt: data.dec(_f$createdAt),
      balance: data.dec(_f$balance),
      clientNumber: data.dec(_f$clientNumber),
      perks: data.dec(_f$perks),
      isSubscripted: data.dec(_f$isSubscripted),
      userId: data.dec(_f$userId),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Organization fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Organization>(map);
  }

  static Organization fromJson(String json) {
    return ensureInitialized().decodeJson<Organization>(json);
  }
}

mixin OrganizationMappable {
  String toJson() {
    return OrganizationMapper.ensureInitialized().encodeJson<Organization>(
      this as Organization,
    );
  }

  Map<String, dynamic> toMap() {
    return OrganizationMapper.ensureInitialized().encodeMap<Organization>(
      this as Organization,
    );
  }

  OrganizationCopyWith<Organization, Organization, Organization> get copyWith =>
      _OrganizationCopyWithImpl<Organization, Organization>(
        this as Organization,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return OrganizationMapper.ensureInitialized().stringifyValue(
      this as Organization,
    );
  }

  @override
  bool operator ==(Object other) {
    return OrganizationMapper.ensureInitialized().equalsValue(
      this as Organization,
      other,
    );
  }

  @override
  int get hashCode {
    return OrganizationMapper.ensureInitialized().hashValue(
      this as Organization,
    );
  }
}

extension OrganizationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Organization, $Out> {
  OrganizationCopyWith<$R, Organization, $Out> get $asOrganization =>
      $base.as((v, t, t2) => _OrganizationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OrganizationCopyWith<$R, $In extends Organization, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get perks;
  $R call({
    String? id,
    String? logo,
    String? name,
    String? industry,
    String? size,
    String? website,
    String? description,
    String? location,
    DateTime? createdAt,
    double? balance,
    int? clientNumber,
    List<String>? perks,
    bool? isSubscripted,
    String? userId,
  });
  OrganizationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OrganizationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Organization, $Out>
    implements OrganizationCopyWith<$R, Organization, $Out> {
  _OrganizationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Organization> $mapper =
      OrganizationMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get perks =>
      $value.perks != null
      ? ListCopyWith(
          $value.perks!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perks: v),
        )
      : null;
  @override
  $R call({
    Object? id = $none,
    Object? logo = $none,
    Object? name = $none,
    Object? industry = $none,
    Object? size = $none,
    Object? website = $none,
    Object? description = $none,
    Object? location = $none,
    Object? createdAt = $none,
    Object? balance = $none,
    Object? clientNumber = $none,
    Object? perks = $none,
    Object? isSubscripted = $none,
    Object? userId = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (logo != $none) #logo: logo,
      if (name != $none) #name: name,
      if (industry != $none) #industry: industry,
      if (size != $none) #size: size,
      if (website != $none) #website: website,
      if (description != $none) #description: description,
      if (location != $none) #location: location,
      if (createdAt != $none) #createdAt: createdAt,
      if (balance != $none) #balance: balance,
      if (clientNumber != $none) #clientNumber: clientNumber,
      if (perks != $none) #perks: perks,
      if (isSubscripted != $none) #isSubscripted: isSubscripted,
      if (userId != $none) #userId: userId,
    }),
  );
  @override
  Organization $make(CopyWithData data) => Organization(
    id: data.get(#id, or: $value.id),
    logo: data.get(#logo, or: $value.logo),
    name: data.get(#name, or: $value.name),
    industry: data.get(#industry, or: $value.industry),
    size: data.get(#size, or: $value.size),
    website: data.get(#website, or: $value.website),
    description: data.get(#description, or: $value.description),
    location: data.get(#location, or: $value.location),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    balance: data.get(#balance, or: $value.balance),
    clientNumber: data.get(#clientNumber, or: $value.clientNumber),
    perks: data.get(#perks, or: $value.perks),
    isSubscripted: data.get(#isSubscripted, or: $value.isSubscripted),
    userId: data.get(#userId, or: $value.userId),
  );

  @override
  OrganizationCopyWith<$R2, Organization, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OrganizationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

