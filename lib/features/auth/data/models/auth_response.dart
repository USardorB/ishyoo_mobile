import 'package:dart_mappable/dart_mappable.dart';

part 'auth_response.mapper.dart';

@MappableClass()
class SmsRequestResponse with SmsRequestResponseMappable {
  @MappableField(key: 'request_id')
  final String requestId;
  final int? ttl;
  final int? otp;

  const SmsRequestResponse({
    required this.requestId,
    this.ttl,
    this.otp,
  });

  factory SmsRequestResponse.fromJson(Map<String, dynamic> json) =>
      SmsRequestResponseMapper.fromMap(json);
}

@MappableClass()
class VerifyMetadataResponse with VerifyMetadataResponseMappable {
  @MappableField(key: 'request_id')
  final String requestId;
  @MappableField(key: 'next_step')
  final String nextStep;

  const VerifyMetadataResponse({
    required this.requestId,
    required this.nextStep,
  });

  factory VerifyMetadataResponse.fromJson(Map<String, dynamic> json) =>
      VerifyMetadataResponseMapper.fromMap(json);
}

@MappableClass()
class AuthTokensResponse with AuthTokensResponseMappable {
  @MappableField(key: 'access_token')
  final String accessToken;
  final String type;
  final String expires;
  final String? did; // device id returned from server

  const AuthTokensResponse({
    required this.accessToken,
    required this.type,
    required this.expires,
    this.did,
  });

  factory AuthTokensResponse.fromJson(Map<String, dynamic> json) =>
      AuthTokensResponseMapper.fromMap(json);
}

@MappableClass()
class UserOrganization with UserOrganizationMappable {
  final dynamic membership;

  const UserOrganization({
    this.membership,
  });

  factory UserOrganization.fromJson(Map<String, dynamic> json) =>
      UserOrganizationMapper.fromMap(json);
}

@MappableClass()
class UserMeResponse with UserMeResponseMappable {
  final String id;
  final String name;
  @MappableField(key: 'phone_number')
  final String phoneNumber;
  final String? email;
  final String? password;
  final String role;
  @MappableField(key: 'created_at')
  final String createdAt;
  @MappableField(key: 'updated_at')
  final String updatedAt;
  final UserOrganization? organization;

  const UserMeResponse({
    required this.id,
    required this.name,
    required this.phoneNumber,
    this.email,
    this.password,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.organization,
  });

  factory UserMeResponse.fromJson(Map<String, dynamic> json) =>
      UserMeResponseMapper.fromMap(json);
}

@MappableClass()
class RefreshTokenResponse with RefreshTokenResponseMappable {
  @MappableField(key: 'access_token')
  final String accessToken;
  final String type;
  final String expires;

  const RefreshTokenResponse({
    required this.accessToken,
    required this.type,
    required this.expires,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponseMapper.fromMap(json);
}
