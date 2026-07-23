import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/shared/failures.dart';
import 'package:mobile/core/shared/usecase.dart';
import 'package:mobile/features/auth/data/models/auth_request.dart';
import 'package:mobile/features/auth/data/models/auth_response.dart';
import 'package:mobile/features/auth/domain/repositories/auth_repository.dart';

class RequestSmsParams {
  final String role;
  final SmsRequestPayload payload;

  const RequestSmsParams(this.role, this.payload);
}

@injectable
class RequestSmsUseCase implements UseCase<SmsRequestResponse, RequestSmsParams> {
  final AuthRepository _repository;

  RequestSmsUseCase(this._repository);

  @override
  Future<Either<Failure, SmsRequestResponse>> call([RequestSmsParams? params]) {
    assert(params != null);
    return _repository.requestSms(params!.role, params.payload);
  }
}

class RegisterParams {
  final String role;
  final RegisterRequest request;

  const RegisterParams(this.role, this.request);
}

@injectable
class RegisterUseCase implements UseCase<AuthTokensResponse, RegisterParams> {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, AuthTokensResponse>> call([RegisterParams? params]) {
    assert(params != null);
    return _repository.register(params!.role, params.request);
  }
}

class VerifyParams {
  final String role;
  final VerifyRequest request;

  const VerifyParams(this.role, this.request);
}

@injectable
class VerifyUseCase implements UseCase<VerifyMetadataResponse, VerifyParams> {
  final AuthRepository _repository;

  VerifyUseCase(this._repository);

  @override
  Future<Either<Failure, VerifyMetadataResponse>> call([VerifyParams? params]) {
    assert(params != null);
    return _repository.verify(params!.role, params.request);
  }
}

class LoginParams {
  final String role;
  final LoginRequest request;

  const LoginParams(this.role, this.request);
}

@injectable
class LoginUseCase implements UseCase<AuthTokensResponse, LoginParams> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, AuthTokensResponse>> call([LoginParams? params]) {
    assert(params != null);
    return _repository.login(params!.role, params.request);
  }
}

class RoleParam {
  final String role;

  const RoleParam(this.role);
}

@injectable
class GetMeUseCase implements UseCase<UserMeResponse, RoleParam> {
  final AuthRepository _repository;

  GetMeUseCase(this._repository);

  @override
  Future<Either<Failure, UserMeResponse>> call([RoleParam? params]) {
    assert(params != null);
    return _repository.getMe(params!.role);
  }
}

@injectable
class RefreshTokenUseCase implements UseCase<RefreshTokenResponse, RoleParam> {
  final AuthRepository _repository;

  RefreshTokenUseCase(this._repository);

  @override
  Future<Either<Failure, RefreshTokenResponse>> call([RoleParam? params]) {
    assert(params != null);
    return _repository.refreshToken(params!.role);
  }
}

@injectable
class LogoutUseCase implements UseCase<Unit, RoleParam> {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call([RoleParam? params]) {
    assert(params != null);
    return _repository.logout(params!.role);
  }
}

@injectable
class ForgotPasswordSmsUseCase implements UseCase<SmsRequestResponse, RequestSmsParams> {
  final AuthRepository _repository;

  ForgotPasswordSmsUseCase(this._repository);

  @override
  Future<Either<Failure, SmsRequestResponse>> call([RequestSmsParams? params]) {
    assert(params != null);
    return _repository.forgotPasswordSmsRequest(params!.role, params.payload);
  }
}

@injectable
class ForgotPasswordVerifyUseCase implements UseCase<VerifyMetadataResponse, VerifyParams> {
  final AuthRepository _repository;

  ForgotPasswordVerifyUseCase(this._repository);

  @override
  Future<Either<Failure, VerifyMetadataResponse>> call([VerifyParams? params]) {
    assert(params != null);
    return _repository.forgotPasswordVerify(params!.role, params.request);
  }
}

class ResetPasswordParams {
  final String role;
  final ResetPasswordRequest request;

  const ResetPasswordParams(this.role, this.request);
}

@injectable
class ResetPasswordUseCase implements UseCase<Unit, ResetPasswordParams> {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call([ResetPasswordParams? params]) {
    assert(params != null);
    return _repository.resetPassword(params!.role, params.request);
  }
}
