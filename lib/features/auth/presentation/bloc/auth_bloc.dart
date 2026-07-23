import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/shared/services/token_service.dart';
import 'package:mobile/features/auth/domain/usecases/auth_usecases.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RequestSmsUseCase _requestSmsUseCase;
  final RegisterUseCase _registerUseCase;
  final VerifyUseCase _verifyUseCase;
  final LoginUseCase _loginUseCase;
  final GetMeUseCase _getMeUseCase;
  final LogoutUseCase _logoutUseCase;
  final ForgotPasswordSmsUseCase _forgotPasswordSmsUseCase;
  final ForgotPasswordVerifyUseCase _forgotPasswordVerifyUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final TokenService _tokenService;

  AuthBloc(
    this._requestSmsUseCase,
    this._registerUseCase,
    this._verifyUseCase,
    this._loginUseCase,
    this._getMeUseCase,
    this._logoutUseCase,
    this._forgotPasswordSmsUseCase,
    this._forgotPasswordVerifyUseCase,
    this._resetPasswordUseCase,
    this._tokenService,
  ) : super(const AuthState()) {
    on<AuthSmsRequested>(_onSmsRequested);
    on<AuthRegisterRequested>(_onRegisterRequested);
    on<AuthVerifyRequested>(_onVerifyRequested);
    on<AuthLoginRequested>(_onLoginRequested);
    on<AuthGetMeRequested>(_onGetMeRequested);
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthRoleChanged>(_onRoleChanged);
    on<AuthForgotPasswordSmsRequested>(_onForgotPasswordSmsRequested);
    on<AuthForgotPasswordVerifyRequested>(_onForgotPasswordVerifyRequested);
    on<AuthForgotPasswordResetRequested>(_onForgotPasswordResetRequested);
  }

  void _onRoleChanged(
    AuthRoleChanged event,
    Emitter<AuthState> emit,
  ) {
    emit(state.copyWith(userRole: event.role));
  }

  Future<void> _onSmsRequested(
    AuthSmsRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _requestSmsUseCase(
      RequestSmsParams(event.role, event.payload),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(
          status: AuthStatus.otpSent,
          role: event.role,
          requestId: response.requestId,
          ttl: response.ttl,
          otp: response.otp,
        ),
      ),
    );
  }

  Future<void> _onRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _registerUseCase(
      RegisterParams(event.role, event.request),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) {
        add(AuthGetMeRequested(event.role));
      },
    );
  }

  Future<void> _onVerifyRequested(
    AuthVerifyRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _verifyUseCase(
      VerifyParams(event.role, event.request),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) {
        emit(
          state.copyWith(
            status: AuthStatus.verified,
            requestId: response.requestId,
            nextStep: response.nextStep,
          ),
        );
      },
    );
  }

  Future<void> _onLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _loginUseCase(LoginParams(event.role, event.request));

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) {
        add(AuthGetMeRequested(event.role));
      },
    );
  }

  Future<void> _onGetMeRequested(
    AuthGetMeRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _getMeUseCase(RoleParam(event.role));

    result.fold(
      (failure) => emit(state.copyWith(status: AuthStatus.unauthenticated)),
      (response) => emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          role: event.role,
          user: response,
        ),
      ),
    );
  }

  Future<void> _onLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    
    final result = await _logoutUseCase(RoleParam(event.role));
    
    // Clear tokens regardless of backend success/failure to ensure local state is cleaned up
    await _tokenService.clearTokens();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.unauthenticated,
          errorMessage: failure.message,
        ),
      ),
      (_) => emit(state.copyWith(status: AuthStatus.unauthenticated)),
    );
  }

  Future<void> _onForgotPasswordSmsRequested(
    AuthForgotPasswordSmsRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _forgotPasswordSmsUseCase(
      RequestSmsParams(event.role, event.payload),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) => emit(
        state.copyWith(
          status: AuthStatus.otpSent,
          role: event.role,
          requestId: response.requestId,
          ttl: response.ttl,
          otp: response.otp,
        ),
      ),
    );
  }

  Future<void> _onForgotPasswordVerifyRequested(
    AuthForgotPasswordVerifyRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _forgotPasswordVerifyUseCase(
      VerifyParams(event.role, event.request),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (response) {
        emit(
          state.copyWith(
            status: AuthStatus.verified,
            requestId: response.requestId,
            nextStep: response.nextStep,
          ),
        );
      },
    );
  }

  Future<void> _onForgotPasswordResetRequested(
    AuthForgotPasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _resetPasswordUseCase(
      ResetPasswordParams(event.role, event.request),
    );

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: AuthStatus.failure,
          errorMessage: failure.message,
        ),
      ),
      (_) {
        emit(
          state.copyWith(
            status: AuthStatus.passwordResetSuccess,
          ),
        );
      },
    );
  }
}
