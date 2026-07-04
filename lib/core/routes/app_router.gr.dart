// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:mobile/core/enums/user_role.dart' as _i16;
import 'package:mobile/core/shared/pages/home_screen.dart' as _i6;
import 'package:mobile/core/shared/pages/splash_screen.dart' as _i12;
import 'package:mobile/features/auth/presentation/pages/complete_profile_page.dart'
    as _i2;
import 'package:mobile/features/auth/presentation/pages/confirm_password_page.dart'
    as _i3;
import 'package:mobile/features/auth/presentation/pages/login_page.dart' as _i5;
import 'package:mobile/features/auth/presentation/pages/otp_confirmation_page.dart'
    as _i10;
import 'package:mobile/features/auth/presentation/pages/register_page.dart'
    as _i11;
import 'package:mobile/features/notifications/presentation/pages/notification_details_page.dart'
    as _i7;
import 'package:mobile/features/notifications/presentation/pages/notifications_page.dart'
    as _i8;
import 'package:mobile/features/onboarding/presentation/pages/choose_language_page.dart'
    as _i1;
import 'package:mobile/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i9;
import 'package:mobile/features/postings/presentation/pages/hr_dashboard_page.dart'
    as _i4;
import 'package:mobile/features/talents/presentation/pages/talents_search_result_page.dart'
    as _i13;

/// generated route for
/// [_i1.ChooseLanguagePage]
class ChooseLanguageRoute extends _i14.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i14.PageRouteInfo>? children})
    : super(ChooseLanguageRoute.name, initialChildren: children);

  static const String name = 'ChooseLanguageRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChooseLanguagePage();
    },
  );
}

/// generated route for
/// [_i2.CompleteProfilePage]
class CompleteProfileRoute extends _i14.PageRouteInfo<void> {
  const CompleteProfileRoute({List<_i14.PageRouteInfo>? children})
    : super(CompleteProfileRoute.name, initialChildren: children);

  static const String name = 'CompleteProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.CompleteProfilePage();
    },
  );
}

/// generated route for
/// [_i3.ConfirmPasswordPage]
class ConfirmPasswordRoute extends _i14.PageRouteInfo<void> {
  const ConfirmPasswordRoute({List<_i14.PageRouteInfo>? children})
    : super(ConfirmPasswordRoute.name, initialChildren: children);

  static const String name = 'ConfirmPasswordRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.ConfirmPasswordPage();
    },
  );
}

/// generated route for
/// [_i4.HrDashboardPage]
class HrDashboardRoute extends _i14.PageRouteInfo<void> {
  const HrDashboardRoute({List<_i14.PageRouteInfo>? children})
    : super(HrDashboardRoute.name, initialChildren: children);

  static const String name = 'HrDashboardRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.HrDashboardPage();
    },
  );
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i15.Key? key,
    required _i16.UserRole role,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, role: role),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i5.LoginPage(key: args.key, role: args.role);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.role});

  final _i15.Key? key;

  final _i16.UserRole role;

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
/// [_i6.MainLayoutPage]
class MainLayoutRoute extends _i14.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i14.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.MainLayoutPage();
    },
  );
}

/// generated route for
/// [_i7.NotificationDetailsPage]
class NotificationDetailsRoute
    extends _i14.PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    _i15.Key? key,
    required String id,
    required String title,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         NotificationDetailsRoute.name,
         args: NotificationDetailsRouteArgs(key: key, id: id, title: title),
         initialChildren: children,
       );

  static const String name = 'NotificationDetailsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return _i7.NotificationDetailsPage(
        key: args.key,
        id: args.id,
        title: args.title,
      );
    },
  );
}

class NotificationDetailsRouteArgs {
  const NotificationDetailsRouteArgs({
    this.key,
    required this.id,
    required this.title,
  });

  final _i15.Key? key;

  final String id;

  final String title;

  @override
  String toString() {
    return 'NotificationDetailsRouteArgs{key: $key, id: $id, title: $title}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NotificationDetailsRouteArgs) return false;
    return key == other.key && id == other.id && title == other.title;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode ^ title.hashCode;
}

/// generated route for
/// [_i8.NotificationsPage]
class NotificationsRoute extends _i14.PageRouteInfo<void> {
  const NotificationsRoute({List<_i14.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i9.OnboardingPage]
class OnboardingRoute extends _i14.PageRouteInfo<void> {
  const OnboardingRoute({List<_i14.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i10.OtpConfirmationPage]
class OtpConfirmationRoute
    extends _i14.PageRouteInfo<OtpConfirmationRouteArgs> {
  OtpConfirmationRoute({
    _i15.Key? key,
    String? phoneNumber,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         OtpConfirmationRoute.name,
         args: OtpConfirmationRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'OtpConfirmationRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpConfirmationRouteArgs>(
        orElse: () => const OtpConfirmationRouteArgs(),
      );
      return _i10.OtpConfirmationPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class OtpConfirmationRouteArgs {
  const OtpConfirmationRouteArgs({this.key, this.phoneNumber});

  final _i15.Key? key;

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
/// [_i11.RegisterPage]
class RegisterRoute extends _i14.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i15.Key? key,
    required String? phoneNumber,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return _i11.RegisterPage(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.phoneNumber});

  final _i15.Key? key;

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
/// [_i12.SplashScreen]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}

/// generated route for
/// [_i13.TalentsSearchResultPage]
class TalentsSearchResultRoute extends _i14.PageRouteInfo<void> {
  const TalentsSearchResultRoute({List<_i14.PageRouteInfo>? children})
    : super(TalentsSearchResultRoute.name, initialChildren: children);

  static const String name = 'TalentsSearchResultRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.TalentsSearchResultPage();
    },
  );
}
