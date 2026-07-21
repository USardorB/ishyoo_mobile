import 'package:dart_mappable/dart_mappable.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/features/auth/data/models/auth_response.dart';

part 'auth_state.mapper.dart';

@MappableEnum()
enum AuthStatus {
  initial,
  loading,
  otpSent,
  verified,
  authenticated,
  unauthenticated,
  failure,
}

@MappableClass()
class AuthState with AuthStateMappable {
  final AuthStatus status;
  final String? role;
  final UserRole? userRole;
  final String? requestId;
  final int? ttl;
  final int? otp;
  final String? nextStep;
  final UserMeResponse? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.role,
    this.userRole,
    this.requestId,
    this.ttl,
    this.otp,
    this.nextStep,
    this.user,
    this.errorMessage,
  });
}
