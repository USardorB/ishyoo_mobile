// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_state.dart';

class AuthStatusMapper extends EnumMapper<AuthStatus> {
  AuthStatusMapper._();

  static AuthStatusMapper? _instance;
  static AuthStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStatusMapper._());
    }
    return _instance!;
  }

  static AuthStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  AuthStatus decode(dynamic value) {
    switch (value) {
      case r'initial':
        return AuthStatus.initial;
      case r'loading':
        return AuthStatus.loading;
      case r'otpSent':
        return AuthStatus.otpSent;
      case r'verified':
        return AuthStatus.verified;
      case r'authenticated':
        return AuthStatus.authenticated;
      case r'waitlisted':
        return AuthStatus.waitlisted;
      case r'unauthenticated':
        return AuthStatus.unauthenticated;
      case r'failure':
        return AuthStatus.failure;
      case r'passwordResetSuccess':
        return AuthStatus.passwordResetSuccess;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(AuthStatus self) {
    switch (self) {
      case AuthStatus.initial:
        return r'initial';
      case AuthStatus.loading:
        return r'loading';
      case AuthStatus.otpSent:
        return r'otpSent';
      case AuthStatus.verified:
        return r'verified';
      case AuthStatus.authenticated:
        return r'authenticated';
      case AuthStatus.waitlisted:
        return r'waitlisted';
      case AuthStatus.unauthenticated:
        return r'unauthenticated';
      case AuthStatus.failure:
        return r'failure';
      case AuthStatus.passwordResetSuccess:
        return r'passwordResetSuccess';
    }
  }
}

extension AuthStatusMapperExtension on AuthStatus {
  String toValue() {
    AuthStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<AuthStatus>(this) as String;
  }
}

class AuthStateMapper extends ClassMapperBase<AuthState> {
  AuthStateMapper._();

  static AuthStateMapper? _instance;
  static AuthStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateMapper._());
      AuthStatusMapper.ensureInitialized();
      UserMeResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'AuthState';

  static AuthStatus _$status(AuthState v) => v.status;
  static const Field<AuthState, AuthStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: AuthStatus.initial,
  );
  static String? _$role(AuthState v) => v.role;
  static const Field<AuthState, String> _f$role = Field(
    'role',
    _$role,
    opt: true,
  );
  static UserRole? _$userRole(AuthState v) => v.userRole;
  static const Field<AuthState, UserRole> _f$userRole = Field(
    'userRole',
    _$userRole,
    opt: true,
  );
  static String? _$requestId(AuthState v) => v.requestId;
  static const Field<AuthState, String> _f$requestId = Field(
    'requestId',
    _$requestId,
    opt: true,
  );
  static int? _$ttl(AuthState v) => v.ttl;
  static const Field<AuthState, int> _f$ttl = Field('ttl', _$ttl, opt: true);
  static int? _$otp(AuthState v) => v.otp;
  static const Field<AuthState, int> _f$otp = Field('otp', _$otp, opt: true);
  static String? _$nextStep(AuthState v) => v.nextStep;
  static const Field<AuthState, String> _f$nextStep = Field(
    'nextStep',
    _$nextStep,
    opt: true,
  );
  static UserMeResponse? _$user(AuthState v) => v.user;
  static const Field<AuthState, UserMeResponse> _f$user = Field(
    'user',
    _$user,
    opt: true,
  );
  static String? _$errorMessage(AuthState v) => v.errorMessage;
  static const Field<AuthState, String> _f$errorMessage = Field(
    'errorMessage',
    _$errorMessage,
    opt: true,
  );

  @override
  final MappableFields<AuthState> fields = const {
    #status: _f$status,
    #role: _f$role,
    #userRole: _f$userRole,
    #requestId: _f$requestId,
    #ttl: _f$ttl,
    #otp: _f$otp,
    #nextStep: _f$nextStep,
    #user: _f$user,
    #errorMessage: _f$errorMessage,
  };

  static AuthState _instantiate(DecodingData data) {
    return AuthState(
      status: data.dec(_f$status),
      role: data.dec(_f$role),
      userRole: data.dec(_f$userRole),
      requestId: data.dec(_f$requestId),
      ttl: data.dec(_f$ttl),
      otp: data.dec(_f$otp),
      nextStep: data.dec(_f$nextStep),
      user: data.dec(_f$user),
      errorMessage: data.dec(_f$errorMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static AuthState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthState>(map);
  }

  static AuthState fromJson(String json) {
    return ensureInitialized().decodeJson<AuthState>(json);
  }
}

mixin AuthStateMappable {
  String toJson() {
    return AuthStateMapper.ensureInitialized().encodeJson<AuthState>(
      this as AuthState,
    );
  }

  Map<String, dynamic> toMap() {
    return AuthStateMapper.ensureInitialized().encodeMap<AuthState>(
      this as AuthState,
    );
  }

  AuthStateCopyWith<AuthState, AuthState, AuthState> get copyWith =>
      _AuthStateCopyWithImpl<AuthState, AuthState>(
        this as AuthState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthStateMapper.ensureInitialized().stringifyValue(
      this as AuthState,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthStateMapper.ensureInitialized().equalsValue(
      this as AuthState,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthStateMapper.ensureInitialized().hashValue(this as AuthState);
  }
}

extension AuthStateValueCopy<$R, $Out> on ObjectCopyWith<$R, AuthState, $Out> {
  AuthStateCopyWith<$R, AuthState, $Out> get $asAuthState =>
      $base.as((v, t, t2) => _AuthStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthStateCopyWith<$R, $In extends AuthState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  UserMeResponseCopyWith<$R, UserMeResponse, UserMeResponse>? get user;
  $R call({
    AuthStatus? status,
    String? role,
    UserRole? userRole,
    String? requestId,
    int? ttl,
    int? otp,
    String? nextStep,
    UserMeResponse? user,
    String? errorMessage,
  });
  AuthStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthState, $Out>
    implements AuthStateCopyWith<$R, AuthState, $Out> {
  _AuthStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthState> $mapper =
      AuthStateMapper.ensureInitialized();
  @override
  UserMeResponseCopyWith<$R, UserMeResponse, UserMeResponse>? get user =>
      $value.user?.copyWith.$chain((v) => call(user: v));
  @override
  $R call({
    AuthStatus? status,
    Object? role = $none,
    Object? userRole = $none,
    Object? requestId = $none,
    Object? ttl = $none,
    Object? otp = $none,
    Object? nextStep = $none,
    Object? user = $none,
    Object? errorMessage = $none,
  }) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (role != $none) #role: role,
      if (userRole != $none) #userRole: userRole,
      if (requestId != $none) #requestId: requestId,
      if (ttl != $none) #ttl: ttl,
      if (otp != $none) #otp: otp,
      if (nextStep != $none) #nextStep: nextStep,
      if (user != $none) #user: user,
      if (errorMessage != $none) #errorMessage: errorMessage,
    }),
  );
  @override
  AuthState $make(CopyWithData data) => AuthState(
    status: data.get(#status, or: $value.status),
    role: data.get(#role, or: $value.role),
    userRole: data.get(#userRole, or: $value.userRole),
    requestId: data.get(#requestId, or: $value.requestId),
    ttl: data.get(#ttl, or: $value.ttl),
    otp: data.get(#otp, or: $value.otp),
    nextStep: data.get(#nextStep, or: $value.nextStep),
    user: data.get(#user, or: $value.user),
    errorMessage: data.get(#errorMessage, or: $value.errorMessage),
  );

  @override
  AuthStateCopyWith<$R2, AuthState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

