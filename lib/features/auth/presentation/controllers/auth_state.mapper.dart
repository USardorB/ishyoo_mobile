// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth_state.dart';

class AuthStateMapper extends ClassMapperBase<AuthState> {
  AuthStateMapper._();

  static AuthStateMapper? _instance;
  static AuthStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuthState';

  static String? _$id(AuthState v) => v.id;
  static const Field<AuthState, String> _f$id = Field('id', _$id, opt: true);
  static UserRole? _$role(AuthState v) => v.role;
  static const Field<AuthState, UserRole> _f$role = Field(
    'role',
    _$role,
    opt: true,
  );
  static bool _$isFromNamangan(AuthState v) => v.isFromNamangan;
  static const Field<AuthState, bool> _f$isFromNamangan = Field(
    'isFromNamangan',
    _$isFromNamangan,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<AuthState> fields = const {
    #id: _f$id,
    #role: _f$role,
    #isFromNamangan: _f$isFromNamangan,
  };

  static AuthState _instantiate(DecodingData data) {
    return AuthState(
      id: data.dec(_f$id),
      role: data.dec(_f$role),
      isFromNamangan: data.dec(_f$isFromNamangan),
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
  $R call({String? id, UserRole? role, bool? isFromNamangan});
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
  $R call({Object? id = $none, Object? role = $none, bool? isFromNamangan}) =>
      $apply(
        FieldCopyWithData({
          if (id != $none) #id: id,
          if (role != $none) #role: role,
          if (isFromNamangan != null) #isFromNamangan: isFromNamangan,
        }),
      );
  @override
  AuthState $make(CopyWithData data) => AuthState(
    id: data.get(#id, or: $value.id),
    role: data.get(#role, or: $value.role),
    isFromNamangan: data.get(#isFromNamangan, or: $value.isFromNamangan),
  );

  @override
  AuthStateCopyWith<$R2, AuthState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

