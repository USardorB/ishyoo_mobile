// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_response.dart';

class SmsRequestResponseMapper extends ClassMapperBase<SmsRequestResponse> {
  SmsRequestResponseMapper._();

  static SmsRequestResponseMapper? _instance;
  static SmsRequestResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SmsRequestResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SmsRequestResponse';

  static String _$requestId(SmsRequestResponse v) => v.requestId;
  static const Field<SmsRequestResponse, String> _f$requestId = Field(
    'requestId',
    _$requestId,
    key: r'request_id',
  );
  static int? _$ttl(SmsRequestResponse v) => v.ttl;
  static const Field<SmsRequestResponse, int> _f$ttl = Field(
    'ttl',
    _$ttl,
    opt: true,
  );
  static int? _$otp(SmsRequestResponse v) => v.otp;
  static const Field<SmsRequestResponse, int> _f$otp = Field(
    'otp',
    _$otp,
    opt: true,
  );

  @override
  final MappableFields<SmsRequestResponse> fields = const {
    #requestId: _f$requestId,
    #ttl: _f$ttl,
    #otp: _f$otp,
  };

  static SmsRequestResponse _instantiate(DecodingData data) {
    return SmsRequestResponse(
      requestId: data.dec(_f$requestId),
      ttl: data.dec(_f$ttl),
      otp: data.dec(_f$otp),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SmsRequestResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SmsRequestResponse>(map);
  }

  static SmsRequestResponse fromJson(String json) {
    return ensureInitialized().decodeJson<SmsRequestResponse>(json);
  }
}

mixin SmsRequestResponseMappable {
  String toJson() {
    return SmsRequestResponseMapper.ensureInitialized()
        .encodeJson<SmsRequestResponse>(this as SmsRequestResponse);
  }

  Map<String, dynamic> toMap() {
    return SmsRequestResponseMapper.ensureInitialized()
        .encodeMap<SmsRequestResponse>(this as SmsRequestResponse);
  }

  SmsRequestResponseCopyWith<
    SmsRequestResponse,
    SmsRequestResponse,
    SmsRequestResponse
  >
  get copyWith =>
      _SmsRequestResponseCopyWithImpl<SmsRequestResponse, SmsRequestResponse>(
        this as SmsRequestResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SmsRequestResponseMapper.ensureInitialized().stringifyValue(
      this as SmsRequestResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return SmsRequestResponseMapper.ensureInitialized().equalsValue(
      this as SmsRequestResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return SmsRequestResponseMapper.ensureInitialized().hashValue(
      this as SmsRequestResponse,
    );
  }
}

extension SmsRequestResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SmsRequestResponse, $Out> {
  SmsRequestResponseCopyWith<$R, SmsRequestResponse, $Out>
  get $asSmsRequestResponse => $base.as(
    (v, t, t2) => _SmsRequestResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SmsRequestResponseCopyWith<
  $R,
  $In extends SmsRequestResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? requestId, int? ttl, int? otp});
  SmsRequestResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SmsRequestResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SmsRequestResponse, $Out>
    implements SmsRequestResponseCopyWith<$R, SmsRequestResponse, $Out> {
  _SmsRequestResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SmsRequestResponse> $mapper =
      SmsRequestResponseMapper.ensureInitialized();
  @override
  $R call({String? requestId, Object? ttl = $none, Object? otp = $none}) =>
      $apply(
        FieldCopyWithData({
          if (requestId != null) #requestId: requestId,
          if (ttl != $none) #ttl: ttl,
          if (otp != $none) #otp: otp,
        }),
      );
  @override
  SmsRequestResponse $make(CopyWithData data) => SmsRequestResponse(
    requestId: data.get(#requestId, or: $value.requestId),
    ttl: data.get(#ttl, or: $value.ttl),
    otp: data.get(#otp, or: $value.otp),
  );

  @override
  SmsRequestResponseCopyWith<$R2, SmsRequestResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SmsRequestResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class VerifyMetadataResponseMapper
    extends ClassMapperBase<VerifyMetadataResponse> {
  VerifyMetadataResponseMapper._();

  static VerifyMetadataResponseMapper? _instance;
  static VerifyMetadataResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VerifyMetadataResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VerifyMetadataResponse';

  static String _$requestId(VerifyMetadataResponse v) => v.requestId;
  static const Field<VerifyMetadataResponse, String> _f$requestId = Field(
    'requestId',
    _$requestId,
    key: r'request_id',
  );
  static String _$nextStep(VerifyMetadataResponse v) => v.nextStep;
  static const Field<VerifyMetadataResponse, String> _f$nextStep = Field(
    'nextStep',
    _$nextStep,
    key: r'next_step',
  );

  @override
  final MappableFields<VerifyMetadataResponse> fields = const {
    #requestId: _f$requestId,
    #nextStep: _f$nextStep,
  };

  static VerifyMetadataResponse _instantiate(DecodingData data) {
    return VerifyMetadataResponse(
      requestId: data.dec(_f$requestId),
      nextStep: data.dec(_f$nextStep),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static VerifyMetadataResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerifyMetadataResponse>(map);
  }

  static VerifyMetadataResponse fromJson(String json) {
    return ensureInitialized().decodeJson<VerifyMetadataResponse>(json);
  }
}

mixin VerifyMetadataResponseMappable {
  String toJson() {
    return VerifyMetadataResponseMapper.ensureInitialized()
        .encodeJson<VerifyMetadataResponse>(this as VerifyMetadataResponse);
  }

  Map<String, dynamic> toMap() {
    return VerifyMetadataResponseMapper.ensureInitialized()
        .encodeMap<VerifyMetadataResponse>(this as VerifyMetadataResponse);
  }

  VerifyMetadataResponseCopyWith<
    VerifyMetadataResponse,
    VerifyMetadataResponse,
    VerifyMetadataResponse
  >
  get copyWith =>
      _VerifyMetadataResponseCopyWithImpl<
        VerifyMetadataResponse,
        VerifyMetadataResponse
      >(this as VerifyMetadataResponse, $identity, $identity);
  @override
  String toString() {
    return VerifyMetadataResponseMapper.ensureInitialized().stringifyValue(
      this as VerifyMetadataResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return VerifyMetadataResponseMapper.ensureInitialized().equalsValue(
      this as VerifyMetadataResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return VerifyMetadataResponseMapper.ensureInitialized().hashValue(
      this as VerifyMetadataResponse,
    );
  }
}

extension VerifyMetadataResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerifyMetadataResponse, $Out> {
  VerifyMetadataResponseCopyWith<$R, VerifyMetadataResponse, $Out>
  get $asVerifyMetadataResponse => $base.as(
    (v, t, t2) => _VerifyMetadataResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class VerifyMetadataResponseCopyWith<
  $R,
  $In extends VerifyMetadataResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? requestId, String? nextStep});
  VerifyMetadataResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _VerifyMetadataResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerifyMetadataResponse, $Out>
    implements
        VerifyMetadataResponseCopyWith<$R, VerifyMetadataResponse, $Out> {
  _VerifyMetadataResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerifyMetadataResponse> $mapper =
      VerifyMetadataResponseMapper.ensureInitialized();
  @override
  $R call({String? requestId, String? nextStep}) => $apply(
    FieldCopyWithData({
      if (requestId != null) #requestId: requestId,
      if (nextStep != null) #nextStep: nextStep,
    }),
  );
  @override
  VerifyMetadataResponse $make(CopyWithData data) => VerifyMetadataResponse(
    requestId: data.get(#requestId, or: $value.requestId),
    nextStep: data.get(#nextStep, or: $value.nextStep),
  );

  @override
  VerifyMetadataResponseCopyWith<$R2, VerifyMetadataResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _VerifyMetadataResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AuthTokensResponseMapper extends ClassMapperBase<AuthTokensResponse> {
  AuthTokensResponseMapper._();

  static AuthTokensResponseMapper? _instance;
  static AuthTokensResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthTokensResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuthTokensResponse';

  static String _$accessToken(AuthTokensResponse v) => v.accessToken;
  static const Field<AuthTokensResponse, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
  );
  static String _$type(AuthTokensResponse v) => v.type;
  static const Field<AuthTokensResponse, String> _f$type = Field(
    'type',
    _$type,
  );
  static String _$expires(AuthTokensResponse v) => v.expires;
  static const Field<AuthTokensResponse, String> _f$expires = Field(
    'expires',
    _$expires,
  );
  static String? _$did(AuthTokensResponse v) => v.did;
  static const Field<AuthTokensResponse, String> _f$did = Field(
    'did',
    _$did,
    opt: true,
  );

  @override
  final MappableFields<AuthTokensResponse> fields = const {
    #accessToken: _f$accessToken,
    #type: _f$type,
    #expires: _f$expires,
    #did: _f$did,
  };

  static AuthTokensResponse _instantiate(DecodingData data) {
    return AuthTokensResponse(
      accessToken: data.dec(_f$accessToken),
      type: data.dec(_f$type),
      expires: data.dec(_f$expires),
      did: data.dec(_f$did),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthTokensResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthTokensResponse>(map);
  }

  static AuthTokensResponse fromJson(String json) {
    return ensureInitialized().decodeJson<AuthTokensResponse>(json);
  }
}

mixin AuthTokensResponseMappable {
  String toJson() {
    return AuthTokensResponseMapper.ensureInitialized()
        .encodeJson<AuthTokensResponse>(this as AuthTokensResponse);
  }

  Map<String, dynamic> toMap() {
    return AuthTokensResponseMapper.ensureInitialized()
        .encodeMap<AuthTokensResponse>(this as AuthTokensResponse);
  }

  AuthTokensResponseCopyWith<
    AuthTokensResponse,
    AuthTokensResponse,
    AuthTokensResponse
  >
  get copyWith =>
      _AuthTokensResponseCopyWithImpl<AuthTokensResponse, AuthTokensResponse>(
        this as AuthTokensResponse,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthTokensResponseMapper.ensureInitialized().stringifyValue(
      this as AuthTokensResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthTokensResponseMapper.ensureInitialized().equalsValue(
      this as AuthTokensResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthTokensResponseMapper.ensureInitialized().hashValue(
      this as AuthTokensResponse,
    );
  }
}

extension AuthTokensResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, AuthTokensResponse, $Out> {
  AuthTokensResponseCopyWith<$R, AuthTokensResponse, $Out>
  get $asAuthTokensResponse => $base.as(
    (v, t, t2) => _AuthTokensResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class AuthTokensResponseCopyWith<
  $R,
  $In extends AuthTokensResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken, String? type, String? expires, String? did});
  AuthTokensResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _AuthTokensResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthTokensResponse, $Out>
    implements AuthTokensResponseCopyWith<$R, AuthTokensResponse, $Out> {
  _AuthTokensResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthTokensResponse> $mapper =
      AuthTokensResponseMapper.ensureInitialized();
  @override
  $R call({
    String? accessToken,
    String? type,
    String? expires,
    Object? did = $none,
  }) => $apply(
    FieldCopyWithData({
      if (accessToken != null) #accessToken: accessToken,
      if (type != null) #type: type,
      if (expires != null) #expires: expires,
      if (did != $none) #did: did,
    }),
  );
  @override
  AuthTokensResponse $make(CopyWithData data) => AuthTokensResponse(
    accessToken: data.get(#accessToken, or: $value.accessToken),
    type: data.get(#type, or: $value.type),
    expires: data.get(#expires, or: $value.expires),
    did: data.get(#did, or: $value.did),
  );

  @override
  AuthTokensResponseCopyWith<$R2, AuthTokensResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthTokensResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserOrganizationMapper extends ClassMapperBase<UserOrganization> {
  UserOrganizationMapper._();

  static UserOrganizationMapper? _instance;
  static UserOrganizationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserOrganizationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'UserOrganization';

  static dynamic _$membership(UserOrganization v) => v.membership;
  static const Field<UserOrganization, dynamic> _f$membership = Field(
    'membership',
    _$membership,
    opt: true,
  );

  @override
  final MappableFields<UserOrganization> fields = const {
    #membership: _f$membership,
  };

  static UserOrganization _instantiate(DecodingData data) {
    return UserOrganization(membership: data.dec(_f$membership));
  }

  @override
  final Function instantiate = _instantiate;

  static UserOrganization fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserOrganization>(map);
  }

  static UserOrganization fromJson(String json) {
    return ensureInitialized().decodeJson<UserOrganization>(json);
  }
}

mixin UserOrganizationMappable {
  String toJson() {
    return UserOrganizationMapper.ensureInitialized()
        .encodeJson<UserOrganization>(this as UserOrganization);
  }

  Map<String, dynamic> toMap() {
    return UserOrganizationMapper.ensureInitialized()
        .encodeMap<UserOrganization>(this as UserOrganization);
  }

  UserOrganizationCopyWith<UserOrganization, UserOrganization, UserOrganization>
  get copyWith =>
      _UserOrganizationCopyWithImpl<UserOrganization, UserOrganization>(
        this as UserOrganization,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserOrganizationMapper.ensureInitialized().stringifyValue(
      this as UserOrganization,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserOrganizationMapper.ensureInitialized().equalsValue(
      this as UserOrganization,
      other,
    );
  }

  @override
  int get hashCode {
    return UserOrganizationMapper.ensureInitialized().hashValue(
      this as UserOrganization,
    );
  }
}

extension UserOrganizationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserOrganization, $Out> {
  UserOrganizationCopyWith<$R, UserOrganization, $Out>
  get $asUserOrganization =>
      $base.as((v, t, t2) => _UserOrganizationCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserOrganizationCopyWith<$R, $In extends UserOrganization, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({dynamic membership});
  UserOrganizationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserOrganizationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserOrganization, $Out>
    implements UserOrganizationCopyWith<$R, UserOrganization, $Out> {
  _UserOrganizationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserOrganization> $mapper =
      UserOrganizationMapper.ensureInitialized();
  @override
  $R call({Object? membership = $none}) => $apply(
    FieldCopyWithData({if (membership != $none) #membership: membership}),
  );
  @override
  UserOrganization $make(CopyWithData data) => UserOrganization(
    membership: data.get(#membership, or: $value.membership),
  );

  @override
  UserOrganizationCopyWith<$R2, UserOrganization, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserOrganizationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class UserMeResponseMapper extends ClassMapperBase<UserMeResponse> {
  UserMeResponseMapper._();

  static UserMeResponseMapper? _instance;
  static UserMeResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserMeResponseMapper._());
      UserOrganizationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserMeResponse';

  static String _$id(UserMeResponse v) => v.id;
  static const Field<UserMeResponse, String> _f$id = Field('id', _$id);
  static String _$name(UserMeResponse v) => v.name;
  static const Field<UserMeResponse, String> _f$name = Field('name', _$name);
  static String _$phoneNumber(UserMeResponse v) => v.phoneNumber;
  static const Field<UserMeResponse, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'phone_number',
  );
  static String? _$email(UserMeResponse v) => v.email;
  static const Field<UserMeResponse, String> _f$email = Field(
    'email',
    _$email,
    opt: true,
  );
  static String? _$password(UserMeResponse v) => v.password;
  static const Field<UserMeResponse, String> _f$password = Field(
    'password',
    _$password,
    opt: true,
  );
  static String _$role(UserMeResponse v) => v.role;
  static const Field<UserMeResponse, String> _f$role = Field('role', _$role);
  static String _$createdAt(UserMeResponse v) => v.createdAt;
  static const Field<UserMeResponse, String> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
    key: r'created_at',
  );
  static String _$updatedAt(UserMeResponse v) => v.updatedAt;
  static const Field<UserMeResponse, String> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
    key: r'updated_at',
  );
  static UserOrganization? _$organization(UserMeResponse v) => v.organization;
  static const Field<UserMeResponse, UserOrganization> _f$organization = Field(
    'organization',
    _$organization,
    opt: true,
  );

  @override
  final MappableFields<UserMeResponse> fields = const {
    #id: _f$id,
    #name: _f$name,
    #phoneNumber: _f$phoneNumber,
    #email: _f$email,
    #password: _f$password,
    #role: _f$role,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #organization: _f$organization,
  };

  static UserMeResponse _instantiate(DecodingData data) {
    return UserMeResponse(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      phoneNumber: data.dec(_f$phoneNumber),
      email: data.dec(_f$email),
      password: data.dec(_f$password),
      role: data.dec(_f$role),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      organization: data.dec(_f$organization),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserMeResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserMeResponse>(map);
  }

  static UserMeResponse fromJson(String json) {
    return ensureInitialized().decodeJson<UserMeResponse>(json);
  }
}

mixin UserMeResponseMappable {
  String toJson() {
    return UserMeResponseMapper.ensureInitialized().encodeJson<UserMeResponse>(
      this as UserMeResponse,
    );
  }

  Map<String, dynamic> toMap() {
    return UserMeResponseMapper.ensureInitialized().encodeMap<UserMeResponse>(
      this as UserMeResponse,
    );
  }

  UserMeResponseCopyWith<UserMeResponse, UserMeResponse, UserMeResponse>
  get copyWith => _UserMeResponseCopyWithImpl<UserMeResponse, UserMeResponse>(
    this as UserMeResponse,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return UserMeResponseMapper.ensureInitialized().stringifyValue(
      this as UserMeResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserMeResponseMapper.ensureInitialized().equalsValue(
      this as UserMeResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return UserMeResponseMapper.ensureInitialized().hashValue(
      this as UserMeResponse,
    );
  }
}

extension UserMeResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserMeResponse, $Out> {
  UserMeResponseCopyWith<$R, UserMeResponse, $Out> get $asUserMeResponse =>
      $base.as((v, t, t2) => _UserMeResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserMeResponseCopyWith<$R, $In extends UserMeResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserOrganizationCopyWith<$R, UserOrganization, UserOrganization>?
  get organization;
  $R call({
    String? id,
    String? name,
    String? phoneNumber,
    String? email,
    String? password,
    String? role,
    String? createdAt,
    String? updatedAt,
    UserOrganization? organization,
  });
  UserMeResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserMeResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserMeResponse, $Out>
    implements UserMeResponseCopyWith<$R, UserMeResponse, $Out> {
  _UserMeResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserMeResponse> $mapper =
      UserMeResponseMapper.ensureInitialized();
  @override
  UserOrganizationCopyWith<$R, UserOrganization, UserOrganization>?
  get organization =>
      $value.organization?.copyWith.$chain((v) => call(organization: v));
  @override
  $R call({
    String? id,
    String? name,
    String? phoneNumber,
    Object? email = $none,
    Object? password = $none,
    String? role,
    String? createdAt,
    String? updatedAt,
    Object? organization = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (name != null) #name: name,
      if (phoneNumber != null) #phoneNumber: phoneNumber,
      if (email != $none) #email: email,
      if (password != $none) #password: password,
      if (role != null) #role: role,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
      if (organization != $none) #organization: organization,
    }),
  );
  @override
  UserMeResponse $make(CopyWithData data) => UserMeResponse(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    email: data.get(#email, or: $value.email),
    password: data.get(#password, or: $value.password),
    role: data.get(#role, or: $value.role),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    organization: data.get(#organization, or: $value.organization),
  );

  @override
  UserMeResponseCopyWith<$R2, UserMeResponse, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserMeResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RefreshTokenResponseMapper extends ClassMapperBase<RefreshTokenResponse> {
  RefreshTokenResponseMapper._();

  static RefreshTokenResponseMapper? _instance;
  static RefreshTokenResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RefreshTokenResponseMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RefreshTokenResponse';

  static String _$accessToken(RefreshTokenResponse v) => v.accessToken;
  static const Field<RefreshTokenResponse, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
    key: r'access_token',
  );
  static String _$type(RefreshTokenResponse v) => v.type;
  static const Field<RefreshTokenResponse, String> _f$type = Field(
    'type',
    _$type,
  );
  static String _$expires(RefreshTokenResponse v) => v.expires;
  static const Field<RefreshTokenResponse, String> _f$expires = Field(
    'expires',
    _$expires,
  );

  @override
  final MappableFields<RefreshTokenResponse> fields = const {
    #accessToken: _f$accessToken,
    #type: _f$type,
    #expires: _f$expires,
  };

  static RefreshTokenResponse _instantiate(DecodingData data) {
    return RefreshTokenResponse(
      accessToken: data.dec(_f$accessToken),
      type: data.dec(_f$type),
      expires: data.dec(_f$expires),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RefreshTokenResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RefreshTokenResponse>(map);
  }

  static RefreshTokenResponse fromJson(String json) {
    return ensureInitialized().decodeJson<RefreshTokenResponse>(json);
  }
}

mixin RefreshTokenResponseMappable {
  String toJson() {
    return RefreshTokenResponseMapper.ensureInitialized()
        .encodeJson<RefreshTokenResponse>(this as RefreshTokenResponse);
  }

  Map<String, dynamic> toMap() {
    return RefreshTokenResponseMapper.ensureInitialized()
        .encodeMap<RefreshTokenResponse>(this as RefreshTokenResponse);
  }

  RefreshTokenResponseCopyWith<
    RefreshTokenResponse,
    RefreshTokenResponse,
    RefreshTokenResponse
  >
  get copyWith =>
      _RefreshTokenResponseCopyWithImpl<
        RefreshTokenResponse,
        RefreshTokenResponse
      >(this as RefreshTokenResponse, $identity, $identity);
  @override
  String toString() {
    return RefreshTokenResponseMapper.ensureInitialized().stringifyValue(
      this as RefreshTokenResponse,
    );
  }

  @override
  bool operator ==(Object other) {
    return RefreshTokenResponseMapper.ensureInitialized().equalsValue(
      this as RefreshTokenResponse,
      other,
    );
  }

  @override
  int get hashCode {
    return RefreshTokenResponseMapper.ensureInitialized().hashValue(
      this as RefreshTokenResponse,
    );
  }
}

extension RefreshTokenResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RefreshTokenResponse, $Out> {
  RefreshTokenResponseCopyWith<$R, RefreshTokenResponse, $Out>
  get $asRefreshTokenResponse => $base.as(
    (v, t, t2) => _RefreshTokenResponseCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class RefreshTokenResponseCopyWith<
  $R,
  $In extends RefreshTokenResponse,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? accessToken, String? type, String? expires});
  RefreshTokenResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RefreshTokenResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RefreshTokenResponse, $Out>
    implements RefreshTokenResponseCopyWith<$R, RefreshTokenResponse, $Out> {
  _RefreshTokenResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RefreshTokenResponse> $mapper =
      RefreshTokenResponseMapper.ensureInitialized();
  @override
  $R call({String? accessToken, String? type, String? expires}) => $apply(
    FieldCopyWithData({
      if (accessToken != null) #accessToken: accessToken,
      if (type != null) #type: type,
      if (expires != null) #expires: expires,
    }),
  );
  @override
  RefreshTokenResponse $make(CopyWithData data) => RefreshTokenResponse(
    accessToken: data.get(#accessToken, or: $value.accessToken),
    type: data.get(#type, or: $value.type),
    expires: data.get(#expires, or: $value.expires),
  );

  @override
  RefreshTokenResponseCopyWith<$R2, RefreshTokenResponse, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RefreshTokenResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

