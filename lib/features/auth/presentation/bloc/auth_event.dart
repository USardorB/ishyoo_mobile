import 'package:flutter/foundation.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/features/auth/data/models/auth_request.dart';

@immutable
sealed class AuthEvent {}

class AuthRoleChanged extends AuthEvent {
  final UserRole role;

  AuthRoleChanged(this.role);
}

class AuthSmsRequested extends AuthEvent {
  final String role;
  final SmsRequestPayload payload;

  AuthSmsRequested(this.role, this.payload);
}

class AuthRegisterRequested extends AuthEvent {
  final String role;
  final RegisterRequest request;

  AuthRegisterRequested(this.role, this.request);
}

class AuthVerifyRequested extends AuthEvent {
  final String role;
  final VerifyRequest request;

  AuthVerifyRequested(this.role, this.request);
}

class AuthLoginRequested extends AuthEvent {
  final String role;
  final LoginRequest request;

  AuthLoginRequested(this.role, this.request);
}

class AuthGetMeRequested extends AuthEvent {
  final String role;

  AuthGetMeRequested(this.role);
}

class AuthLogoutRequested extends AuthEvent {
  final String role;

  AuthLogoutRequested(this.role);
}
