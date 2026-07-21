// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_request.dart';

class SmsRequestPayloadMapper extends ClassMapperBase<SmsRequestPayload> {
  SmsRequestPayloadMapper._();

  static SmsRequestPayloadMapper? _instance;
  static SmsRequestPayloadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SmsRequestPayloadMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'SmsRequestPayload';

  static String _$phoneNumber(SmsRequestPayload v) => v.phoneNumber;
  static const Field<SmsRequestPayload, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'phone_number',
  );
  static String _$method(SmsRequestPayload v) => v.method;
  static const Field<SmsRequestPayload, String> _f$method = Field(
    'method',
    _$method,
  );

  @override
  final MappableFields<SmsRequestPayload> fields = const {
    #phoneNumber: _f$phoneNumber,
    #method: _f$method,
  };

  static SmsRequestPayload _instantiate(DecodingData data) {
    return SmsRequestPayload(
      phoneNumber: data.dec(_f$phoneNumber),
      method: data.dec(_f$method),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static SmsRequestPayload fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SmsRequestPayload>(map);
  }

  static SmsRequestPayload fromJson(String json) {
    return ensureInitialized().decodeJson<SmsRequestPayload>(json);
  }
}

mixin SmsRequestPayloadMappable {
  String toJson() {
    return SmsRequestPayloadMapper.ensureInitialized()
        .encodeJson<SmsRequestPayload>(this as SmsRequestPayload);
  }

  Map<String, dynamic> toMap() {
    return SmsRequestPayloadMapper.ensureInitialized()
        .encodeMap<SmsRequestPayload>(this as SmsRequestPayload);
  }

  SmsRequestPayloadCopyWith<
    SmsRequestPayload,
    SmsRequestPayload,
    SmsRequestPayload
  >
  get copyWith =>
      _SmsRequestPayloadCopyWithImpl<SmsRequestPayload, SmsRequestPayload>(
        this as SmsRequestPayload,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return SmsRequestPayloadMapper.ensureInitialized().stringifyValue(
      this as SmsRequestPayload,
    );
  }

  @override
  bool operator ==(Object other) {
    return SmsRequestPayloadMapper.ensureInitialized().equalsValue(
      this as SmsRequestPayload,
      other,
    );
  }

  @override
  int get hashCode {
    return SmsRequestPayloadMapper.ensureInitialized().hashValue(
      this as SmsRequestPayload,
    );
  }
}

extension SmsRequestPayloadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SmsRequestPayload, $Out> {
  SmsRequestPayloadCopyWith<$R, SmsRequestPayload, $Out>
  get $asSmsRequestPayload => $base.as(
    (v, t, t2) => _SmsRequestPayloadCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class SmsRequestPayloadCopyWith<
  $R,
  $In extends SmsRequestPayload,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? phoneNumber, String? method});
  SmsRequestPayloadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _SmsRequestPayloadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SmsRequestPayload, $Out>
    implements SmsRequestPayloadCopyWith<$R, SmsRequestPayload, $Out> {
  _SmsRequestPayloadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SmsRequestPayload> $mapper =
      SmsRequestPayloadMapper.ensureInitialized();
  @override
  $R call({String? phoneNumber, String? method}) => $apply(
    FieldCopyWithData({
      if (phoneNumber != null) #phoneNumber: phoneNumber,
      if (method != null) #method: method,
    }),
  );
  @override
  SmsRequestPayload $make(CopyWithData data) => SmsRequestPayload(
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    method: data.get(#method, or: $value.method),
  );

  @override
  SmsRequestPayloadCopyWith<$R2, SmsRequestPayload, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SmsRequestPayloadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class VerifyRequestMapper extends ClassMapperBase<VerifyRequest> {
  VerifyRequestMapper._();

  static VerifyRequestMapper? _instance;
  static VerifyRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VerifyRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VerifyRequest';

  static String _$requestId(VerifyRequest v) => v.requestId;
  static const Field<VerifyRequest, String> _f$requestId = Field(
    'requestId',
    _$requestId,
    key: r'request_id',
  );
  static int _$code(VerifyRequest v) => v.code;
  static const Field<VerifyRequest, int> _f$code = Field('code', _$code);

  @override
  final MappableFields<VerifyRequest> fields = const {
    #requestId: _f$requestId,
    #code: _f$code,
  };

  static VerifyRequest _instantiate(DecodingData data) {
    return VerifyRequest(
      requestId: data.dec(_f$requestId),
      code: data.dec(_f$code),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static VerifyRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VerifyRequest>(map);
  }

  static VerifyRequest fromJson(String json) {
    return ensureInitialized().decodeJson<VerifyRequest>(json);
  }
}

mixin VerifyRequestMappable {
  String toJson() {
    return VerifyRequestMapper.ensureInitialized().encodeJson<VerifyRequest>(
      this as VerifyRequest,
    );
  }

  Map<String, dynamic> toMap() {
    return VerifyRequestMapper.ensureInitialized().encodeMap<VerifyRequest>(
      this as VerifyRequest,
    );
  }

  VerifyRequestCopyWith<VerifyRequest, VerifyRequest, VerifyRequest>
  get copyWith => _VerifyRequestCopyWithImpl<VerifyRequest, VerifyRequest>(
    this as VerifyRequest,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return VerifyRequestMapper.ensureInitialized().stringifyValue(
      this as VerifyRequest,
    );
  }

  @override
  bool operator ==(Object other) {
    return VerifyRequestMapper.ensureInitialized().equalsValue(
      this as VerifyRequest,
      other,
    );
  }

  @override
  int get hashCode {
    return VerifyRequestMapper.ensureInitialized().hashValue(
      this as VerifyRequest,
    );
  }
}

extension VerifyRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VerifyRequest, $Out> {
  VerifyRequestCopyWith<$R, VerifyRequest, $Out> get $asVerifyRequest =>
      $base.as((v, t, t2) => _VerifyRequestCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VerifyRequestCopyWith<$R, $In extends VerifyRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? requestId, int? code});
  VerifyRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VerifyRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VerifyRequest, $Out>
    implements VerifyRequestCopyWith<$R, VerifyRequest, $Out> {
  _VerifyRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VerifyRequest> $mapper =
      VerifyRequestMapper.ensureInitialized();
  @override
  $R call({String? requestId, int? code}) => $apply(
    FieldCopyWithData({
      if (requestId != null) #requestId: requestId,
      if (code != null) #code: code,
    }),
  );
  @override
  VerifyRequest $make(CopyWithData data) => VerifyRequest(
    requestId: data.get(#requestId, or: $value.requestId),
    code: data.get(#code, or: $value.code),
  );

  @override
  VerifyRequestCopyWith<$R2, VerifyRequest, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _VerifyRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RegisterRequestMapper extends ClassMapperBase<RegisterRequest> {
  RegisterRequestMapper._();

  static RegisterRequestMapper? _instance;
  static RegisterRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterRequest';

  static String _$requestId(RegisterRequest v) => v.requestId;
  static const Field<RegisterRequest, String> _f$requestId = Field(
    'requestId',
    _$requestId,
    key: r'request_id',
  );
  static String _$name(RegisterRequest v) => v.name;
  static const Field<RegisterRequest, String> _f$name = Field('name', _$name);
  static String _$password(RegisterRequest v) => v.password;
  static const Field<RegisterRequest, String> _f$password = Field(
    'password',
    _$password,
  );
  static String _$deviceId(RegisterRequest v) => v.deviceId;
  static const Field<RegisterRequest, String> _f$deviceId = Field(
    'deviceId',
    _$deviceId,
    key: r'device_id',
  );
  static String _$deviceName(RegisterRequest v) => v.deviceName;
  static const Field<RegisterRequest, String> _f$deviceName = Field(
    'deviceName',
    _$deviceName,
    key: r'device_name',
  );
  static String? _$fcmToken(RegisterRequest v) => v.fcmToken;
  static const Field<RegisterRequest, String> _f$fcmToken = Field(
    'fcmToken',
    _$fcmToken,
    key: r'fcm_token',
    opt: true,
  );
  static String? _$companyName(RegisterRequest v) => v.companyName;
  static const Field<RegisterRequest, String> _f$companyName = Field(
    'companyName',
    _$companyName,
    key: r'company_name',
    opt: true,
  );
  static String? _$phoneNumber(RegisterRequest v) => v.phoneNumber;
  static const Field<RegisterRequest, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'phone_number',
    opt: true,
  );
  static bool? _$isWaitlistedUser(RegisterRequest v) => v.isWaitlistedUser;
  static const Field<RegisterRequest, bool> _f$isWaitlistedUser = Field(
    'isWaitlistedUser',
    _$isWaitlistedUser,
    key: r'is_waitlisted_user',
    opt: true,
  );

  @override
  final MappableFields<RegisterRequest> fields = const {
    #requestId: _f$requestId,
    #name: _f$name,
    #password: _f$password,
    #deviceId: _f$deviceId,
    #deviceName: _f$deviceName,
    #fcmToken: _f$fcmToken,
    #companyName: _f$companyName,
    #phoneNumber: _f$phoneNumber,
    #isWaitlistedUser: _f$isWaitlistedUser,
  };

  static RegisterRequest _instantiate(DecodingData data) {
    return RegisterRequest(
      requestId: data.dec(_f$requestId),
      name: data.dec(_f$name),
      password: data.dec(_f$password),
      deviceId: data.dec(_f$deviceId),
      deviceName: data.dec(_f$deviceName),
      fcmToken: data.dec(_f$fcmToken),
      companyName: data.dec(_f$companyName),
      phoneNumber: data.dec(_f$phoneNumber),
      isWaitlistedUser: data.dec(_f$isWaitlistedUser),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RegisterRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegisterRequest>(map);
  }

  static RegisterRequest fromJson(String json) {
    return ensureInitialized().decodeJson<RegisterRequest>(json);
  }
}

mixin RegisterRequestMappable {
  String toJson() {
    return RegisterRequestMapper.ensureInitialized()
        .encodeJson<RegisterRequest>(this as RegisterRequest);
  }

  Map<String, dynamic> toMap() {
    return RegisterRequestMapper.ensureInitialized().encodeMap<RegisterRequest>(
      this as RegisterRequest,
    );
  }

  RegisterRequestCopyWith<RegisterRequest, RegisterRequest, RegisterRequest>
  get copyWith =>
      _RegisterRequestCopyWithImpl<RegisterRequest, RegisterRequest>(
        this as RegisterRequest,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RegisterRequestMapper.ensureInitialized().stringifyValue(
      this as RegisterRequest,
    );
  }

  @override
  bool operator ==(Object other) {
    return RegisterRequestMapper.ensureInitialized().equalsValue(
      this as RegisterRequest,
      other,
    );
  }

  @override
  int get hashCode {
    return RegisterRequestMapper.ensureInitialized().hashValue(
      this as RegisterRequest,
    );
  }
}

extension RegisterRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterRequest, $Out> {
  RegisterRequestCopyWith<$R, RegisterRequest, $Out> get $asRegisterRequest =>
      $base.as((v, t, t2) => _RegisterRequestCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RegisterRequestCopyWith<$R, $In extends RegisterRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? requestId,
    String? name,
    String? password,
    String? deviceId,
    String? deviceName,
    String? fcmToken,
    String? companyName,
    String? phoneNumber,
    bool? isWaitlistedUser,
  });
  RegisterRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _RegisterRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterRequest, $Out>
    implements RegisterRequestCopyWith<$R, RegisterRequest, $Out> {
  _RegisterRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterRequest> $mapper =
      RegisterRequestMapper.ensureInitialized();
  @override
  $R call({
    String? requestId,
    String? name,
    String? password,
    String? deviceId,
    String? deviceName,
    Object? fcmToken = $none,
    Object? companyName = $none,
    Object? phoneNumber = $none,
    Object? isWaitlistedUser = $none,
  }) => $apply(
    FieldCopyWithData({
      if (requestId != null) #requestId: requestId,
      if (name != null) #name: name,
      if (password != null) #password: password,
      if (deviceId != null) #deviceId: deviceId,
      if (deviceName != null) #deviceName: deviceName,
      if (fcmToken != $none) #fcmToken: fcmToken,
      if (companyName != $none) #companyName: companyName,
      if (phoneNumber != $none) #phoneNumber: phoneNumber,
      if (isWaitlistedUser != $none) #isWaitlistedUser: isWaitlistedUser,
    }),
  );
  @override
  RegisterRequest $make(CopyWithData data) => RegisterRequest(
    requestId: data.get(#requestId, or: $value.requestId),
    name: data.get(#name, or: $value.name),
    password: data.get(#password, or: $value.password),
    deviceId: data.get(#deviceId, or: $value.deviceId),
    deviceName: data.get(#deviceName, or: $value.deviceName),
    fcmToken: data.get(#fcmToken, or: $value.fcmToken),
    companyName: data.get(#companyName, or: $value.companyName),
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    isWaitlistedUser: data.get(#isWaitlistedUser, or: $value.isWaitlistedUser),
  );

  @override
  RegisterRequestCopyWith<$R2, RegisterRequest, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RegisterRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LoginRequestMapper extends ClassMapperBase<LoginRequest> {
  LoginRequestMapper._();

  static LoginRequestMapper? _instance;
  static LoginRequestMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginRequestMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginRequest';

  static String _$phoneNumber(LoginRequest v) => v.phoneNumber;
  static const Field<LoginRequest, String> _f$phoneNumber = Field(
    'phoneNumber',
    _$phoneNumber,
    key: r'phone_number',
  );
  static String _$password(LoginRequest v) => v.password;
  static const Field<LoginRequest, String> _f$password = Field(
    'password',
    _$password,
  );
  static String _$deviceId(LoginRequest v) => v.deviceId;
  static const Field<LoginRequest, String> _f$deviceId = Field(
    'deviceId',
    _$deviceId,
    key: r'device_id',
  );
  static String _$deviceName(LoginRequest v) => v.deviceName;
  static const Field<LoginRequest, String> _f$deviceName = Field(
    'deviceName',
    _$deviceName,
    key: r'device_name',
  );
  static String? _$fcmToken(LoginRequest v) => v.fcmToken;
  static const Field<LoginRequest, String> _f$fcmToken = Field(
    'fcmToken',
    _$fcmToken,
    key: r'fcm_token',
    opt: true,
  );

  @override
  final MappableFields<LoginRequest> fields = const {
    #phoneNumber: _f$phoneNumber,
    #password: _f$password,
    #deviceId: _f$deviceId,
    #deviceName: _f$deviceName,
    #fcmToken: _f$fcmToken,
  };

  static LoginRequest _instantiate(DecodingData data) {
    return LoginRequest(
      phoneNumber: data.dec(_f$phoneNumber),
      password: data.dec(_f$password),
      deviceId: data.dec(_f$deviceId),
      deviceName: data.dec(_f$deviceName),
      fcmToken: data.dec(_f$fcmToken),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LoginRequest fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginRequest>(map);
  }

  static LoginRequest fromJson(String json) {
    return ensureInitialized().decodeJson<LoginRequest>(json);
  }
}

mixin LoginRequestMappable {
  String toJson() {
    return LoginRequestMapper.ensureInitialized().encodeJson<LoginRequest>(
      this as LoginRequest,
    );
  }

  Map<String, dynamic> toMap() {
    return LoginRequestMapper.ensureInitialized().encodeMap<LoginRequest>(
      this as LoginRequest,
    );
  }

  LoginRequestCopyWith<LoginRequest, LoginRequest, LoginRequest> get copyWith =>
      _LoginRequestCopyWithImpl<LoginRequest, LoginRequest>(
        this as LoginRequest,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LoginRequestMapper.ensureInitialized().stringifyValue(
      this as LoginRequest,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoginRequestMapper.ensureInitialized().equalsValue(
      this as LoginRequest,
      other,
    );
  }

  @override
  int get hashCode {
    return LoginRequestMapper.ensureInitialized().hashValue(
      this as LoginRequest,
    );
  }
}

extension LoginRequestValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginRequest, $Out> {
  LoginRequestCopyWith<$R, LoginRequest, $Out> get $asLoginRequest =>
      $base.as((v, t, t2) => _LoginRequestCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LoginRequestCopyWith<$R, $In extends LoginRequest, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? phoneNumber,
    String? password,
    String? deviceId,
    String? deviceName,
    String? fcmToken,
  });
  LoginRequestCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginRequestCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginRequest, $Out>
    implements LoginRequestCopyWith<$R, LoginRequest, $Out> {
  _LoginRequestCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginRequest> $mapper =
      LoginRequestMapper.ensureInitialized();
  @override
  $R call({
    String? phoneNumber,
    String? password,
    String? deviceId,
    String? deviceName,
    Object? fcmToken = $none,
  }) => $apply(
    FieldCopyWithData({
      if (phoneNumber != null) #phoneNumber: phoneNumber,
      if (password != null) #password: password,
      if (deviceId != null) #deviceId: deviceId,
      if (deviceName != null) #deviceName: deviceName,
      if (fcmToken != $none) #fcmToken: fcmToken,
    }),
  );
  @override
  LoginRequest $make(CopyWithData data) => LoginRequest(
    phoneNumber: data.get(#phoneNumber, or: $value.phoneNumber),
    password: data.get(#password, or: $value.password),
    deviceId: data.get(#deviceId, or: $value.deviceId),
    deviceName: data.get(#deviceName, or: $value.deviceName),
    fcmToken: data.get(#fcmToken, or: $value.fcmToken),
  );

  @override
  LoginRequestCopyWith<$R2, LoginRequest, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LoginRequestCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

