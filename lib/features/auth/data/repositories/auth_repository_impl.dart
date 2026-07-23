import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/extensions/repository_extension.dart';
import 'package:mobile/core/shared/failures.dart';
import 'package:mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:mobile/features/auth/data/models/auth_request.dart';
import 'package:mobile/features/auth/data/models/auth_response.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, SmsRequestResponse>> requestSms(
    String role,
    SmsRequestPayload payload,
  ) => _remoteDataSource.requestSms(role, payload.toMap()).asEither();

  @override
  Future<Either<Failure, AuthTokensResponse>> register(
    String role,
    RegisterRequest request,
  ) => _remoteDataSource.register(role, request.toMap()).asEither();

  @override
  Future<Either<Failure, VerifyMetadataResponse>> verify(
    String role,
    VerifyRequest request,
  ) => _remoteDataSource.verify(role, request.toMap()).asEither();

  @override
  Future<Either<Failure, AuthTokensResponse>> login(
    String role,
    LoginRequest request,
  ) => _remoteDataSource.login(role, request.toMap()).asEither();

  @override
  Future<Either<Failure, UserMeResponse>> getMe(String role) =>
      _remoteDataSource.getMe(role).asEither();

  @override
  Future<Either<Failure, RefreshTokenResponse>> refreshToken(String role) =>
      _remoteDataSource.refreshToken(role).asEither();

  @override
  Future<Either<Failure, Unit>> logout(String role) =>
      _remoteDataSource.logout(role).asEither();

  @override
  Future<Either<Failure, SmsRequestResponse>> forgotPasswordSmsRequest(
    String role,
    SmsRequestPayload payload,
  ) => _remoteDataSource.forgotPasswordSmsRequest(role, payload.toMap()).asEither();

  @override
  Future<Either<Failure, VerifyMetadataResponse>> forgotPasswordVerify(
    String role,
    VerifyRequest request,
  ) => _remoteDataSource.forgotPasswordVerify(role, request.toMap()).asEither();

  @override
  Future<Either<Failure, Unit>> resetPassword(
    String role,
    ResetPasswordRequest request,
  ) => _remoteDataSource.resetPassword(role, request.toMap()).asEither();
}
