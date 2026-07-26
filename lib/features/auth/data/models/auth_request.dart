import 'package:dart_mappable/dart_mappable.dart';

part 'auth_request.mapper.dart';

@MappableClass()
class SmsRequestPayload with SmsRequestPayloadMappable {
  @MappableField(key: 'phone_number')
  final String phoneNumber;
  final String method;

  const SmsRequestPayload({
    required this.phoneNumber,
    required this.method,
  });
}

@MappableClass()
class VerifyRequest with VerifyRequestMappable {
  @MappableField(key: 'request_id')
  final String requestId;
  final int code;

  const VerifyRequest({
    required this.requestId,
    required this.code,
  });
}

@MappableClass()
class RegisterRequest with RegisterRequestMappable {
  @MappableField(key: 'request_id')
  final String requestId;
  final String name;
  final String password;
  @MappableField(key: 'device_id')
  final String deviceId;
  @MappableField(key: 'device_name')
  final String deviceName;
  @MappableField(key: 'fcm_token')
  final String? fcmToken;

  // Optional employer fields
  @MappableField(key: 'company_name')
  final String? companyName;
  @MappableField(key: 'phone_number')
  final String? phoneNumber;

  @MappableField(key: 'is_waitlisted_user')
  final bool? isWaitlistedUser;

  const RegisterRequest({
    required this.requestId,
    required this.name,
    required this.password,
    required this.deviceId,
    required this.deviceName,
    this.fcmToken,
    this.companyName,
    this.phoneNumber,
    this.isWaitlistedUser,
  });
}

@MappableClass()
class LoginRequest with LoginRequestMappable {
  @MappableField(key: 'phone_number')
  final String phoneNumber;
  final String password;
  @MappableField(key: 'device_id')
  final String deviceId;
  @MappableField(key: 'device_name')
  final String deviceName;
  @MappableField(key: 'fcm_token')
  final String? fcmToken;

  const LoginRequest({
    required this.phoneNumber,
    required this.password,
    required this.deviceId,
    required this.deviceName,
    this.fcmToken,
  });
}

@MappableClass()
class ResetPasswordRequest with ResetPasswordRequestMappable {
  @MappableField(key: 'request_id')
  final String requestId;
  final String password;

  const ResetPasswordRequest({
    required this.requestId,
    required this.password,
  });
}
