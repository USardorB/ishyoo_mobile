import 'package:fpdart/fpdart.dart';
import 'package:mobile/core/shared/failures.dart';
import 'package:mobile/features/auth/data/models/auth_request.dart';
import 'package:mobile/features/auth/data/models/auth_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, SmsRequestResponse>> requestSms(
    String role,
    SmsRequestPayload payload,
  );
  Future<Either<Failure, VerifyMetadataResponse>> verify(
    String role,
    VerifyRequest request,
  );
  Future<Either<Failure, AuthTokensResponse>> register(
    String role,
    RegisterRequest request,
  );
  Future<Either<Failure, AuthTokensResponse>> login(
    String role,
    LoginRequest request,
  );
  Future<Either<Failure, UserMeResponse>> getMe(String role);
  Future<Either<Failure, RefreshTokenResponse>> refreshToken(String role);
  Future<Either<Failure, Unit>> logout(String role);
  Future<Either<Failure, SmsRequestResponse>> forgotPasswordSmsRequest(
    String role,
    SmsRequestPayload payload,
  );
  Future<Either<Failure, VerifyMetadataResponse>> forgotPasswordVerify(
    String role,
    VerifyRequest request,
  );
  Future<Either<Failure, Unit>> resetPassword(
    String role,
    ResetPasswordRequest request,
  );
}
