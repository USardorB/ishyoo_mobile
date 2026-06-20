// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:mobile/core/enums/user_role.dart' as _i11;
import 'package:mobile/core/shared/pages/splash_screen.dart' as _i8;
import 'package:mobile/features/auth/presentation/pages/complete_profile_page.dart'
    as _i2;
import 'package:mobile/features/auth/presentation/pages/confirm_password_page.dart'
    as _i3;
import 'package:mobile/features/auth/presentation/pages/login_page.dart' as _i4;
import 'package:mobile/features/auth/presentation/pages/otp_confirmation_page.dart'
    as _i6;
import 'package:mobile/features/auth/presentation/pages/register_page.dart'
    as _i7;
import 'package:mobile/features/onboarding/presentation/pages/choose_language_page.dart'
    as _i1;
import 'package:mobile/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i5;

/// generated route for
/// [_i1.ChooseLanguagePage]
class ChooseLanguageRoute extends _i9.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i9.PageRouteInfo>? children})
    : super(ChooseLanguageRoute.name, initialChildren: children);

  static const String name = 'ChooseLanguageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChooseLanguagePage();
    },
  );
}

/// generated route for
/// [_i2.CompleteProfilePage]
class CompleteProfileRoute extends _i9.PageRouteInfo<void> {
  const CompleteProfileRoute({List<_i9.PageRouteInfo>? children})
    : super(CompleteProfileRoute.name, initialChildren: children);

  static const String name = 'CompleteProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.CompleteProfilePage();
    },
  );
}

/// generated route for
/// [_i3.ConfirmPasswordPage]
class ConfirmPasswordRoute extends _i9.PageRouteInfo<void> {
  const ConfirmPasswordRoute({List<_i9.PageRouteInfo>? children})
    : super(ConfirmPasswordRoute.name, initialChildren: children);

  static const String name = 'ConfirmPasswordRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.ConfirmPasswordPage();
    },
  );
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i10.Key? key,
    required _i11.UserRole role,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, role: role),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i4.LoginPage(key: args.key, role: args.role);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.role});

  final _i10.Key? key;

  final _i11.UserRole role;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, role: $role}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LoginRouteArgs) return false;
    return key == other.key && role == other.role;
  }

  @override
  int get hashCode => key.hashCode ^ role.hashCode;
}

/// generated route for
/// [_i5.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i6.OtpConfirmationPage]
class OtpConfirmationRoute extends _i9.PageRouteInfo<OtpConfirmationRouteArgs> {
  OtpConfirmationRoute({
    _i10.Key? key,
    String? phoneNumber,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         OtpConfirmationRoute.name,
         args: OtpConfirmationRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'OtpConfirmationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpConfirmationRouteArgs>(
        orElse: () => const OtpConfirmationRouteArgs(),
      );
      return _i6.OtpConfirmationPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class OtpConfirmationRouteArgs {
  const OtpConfirmationRouteArgs({this.key, this.phoneNumber});

  final _i10.Key? key;

  final String? phoneNumber;

  @override
  String toString() {
    return 'OtpConfirmationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtpConfirmationRouteArgs) return false;
    return key == other.key && phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => key.hashCode ^ phoneNumber.hashCode;
}

/// generated route for
/// [_i7.RegisterPage]
class RegisterRoute extends _i9.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i10.Key? key,
    required String? phoneNumber,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return _i7.RegisterPage(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.phoneNumber});

  final _i10.Key? key;

  final String? phoneNumber;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegisterRouteArgs) return false;
    return key == other.key && phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => key.hashCode ^ phoneNumber.hashCode;
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}
