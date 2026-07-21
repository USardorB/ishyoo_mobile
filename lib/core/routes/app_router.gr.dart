// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i35;
import 'package:flutter/material.dart' as _i36;
import 'package:mobile/core/enums/user_role.dart' as _i38;
import 'package:mobile/core/shared/pages/home_screen.dart' as _i22;
import 'package:mobile/core/shared/pages/splash_screen.dart' as _i32;
import 'package:mobile/features/applicants/presentation/pages/applicant_details_page.dart'
    as _i1;
import 'package:mobile/features/applicants/presentation/pages/applicants_page.dart'
    as _i2;
import 'package:mobile/features/applications/presentation/pages/applications_page.dart'
    as _i3;
import 'package:mobile/features/auth/presentation/pages/complete_profile_page.dart'
    as _i9;
import 'package:mobile/features/auth/presentation/pages/confirm_password_page.dart'
    as _i10;
import 'package:mobile/features/auth/presentation/pages/login_page.dart'
    as _i21;
import 'package:mobile/features/auth/presentation/pages/otp_confirmation_page.dart'
    as _i27;
import 'package:mobile/features/auth/presentation/pages/register_page.dart'
    as _i28;
import 'package:mobile/features/messaging/presentation/pages/chat_details_page.dart'
    as _i6;
import 'package:mobile/features/messaging/presentation/pages/chats_page.dart'
    as _i7;
import 'package:mobile/features/notifications/presentation/pages/notification_details_page.dart'
    as _i24;
import 'package:mobile/features/notifications/presentation/pages/notifications_page.dart'
    as _i25;
import 'package:mobile/features/onboarding/presentation/pages/choose_language_page.dart'
    as _i8;
import 'package:mobile/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i26;
import 'package:mobile/features/opportunities/presentation/pages/candidate_home_page.dart'
    as _i4;
import 'package:mobile/features/opportunities/presentation/pages/nearby_jobs_page.dart'
    as _i23;
import 'package:mobile/features/opportunities/presentation/pages/vacancy_details_page.dart'
    as _i34;
import 'package:mobile/features/postings/presentation/pages/create_vacancy_page.dart'
    as _i12;
import 'package:mobile/features/postings/presentation/pages/hr_dashboard_page.dart'
    as _i20;
import 'package:mobile/features/profile/presentation/pages/candidate_profile_page.dart'
    as _i5;
import 'package:mobile/features/profile/presentation/pages/edit_candidate_profile_page.dart'
    as _i13;
import 'package:mobile/features/profile/presentation/pages/edit_company_info_page.dart'
    as _i14;
import 'package:mobile/features/profile/presentation/pages/hr_profile_page.dart'
    as _i19;
import 'package:mobile/features/resume/data/models/resume.dart' as _i37;
import 'package:mobile/features/resume/presentation/pages/create_resume_flow_page.dart'
    as _i11;
import 'package:mobile/features/resume/presentation/pages/edit_resume_contacts_page.dart'
    as _i15;
import 'package:mobile/features/resume/presentation/pages/edit_resume_education_page.dart'
    as _i16;
import 'package:mobile/features/resume/presentation/pages/edit_resume_experience_page.dart'
    as _i17;
import 'package:mobile/features/resume/presentation/pages/edit_resume_skills_page.dart'
    as _i18;
import 'package:mobile/features/resume/presentation/pages/resume_details_page.dart'
    as _i29;
import 'package:mobile/features/resume/presentation/pages/resume_success_page.dart'
    as _i30;
import 'package:mobile/features/settings/pages/presentation/settings_page.dart'
    as _i31;
import 'package:mobile/features/talents/presentation/pages/talents_search_result_page.dart'
    as _i33;

/// generated route for
/// [_i1.ApplicantDetailsPage]
class ApplicantDetailsRoute extends _i35.PageRouteInfo<void> {
  const ApplicantDetailsRoute({List<_i35.PageRouteInfo>? children})
    : super(ApplicantDetailsRoute.name, initialChildren: children);

  static const String name = 'ApplicantDetailsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i1.ApplicantDetailsPage();
    },
  );
}

/// generated route for
/// [_i2.ApplicantsPage]
class ApplicantsRoute extends _i35.PageRouteInfo<void> {
  const ApplicantsRoute({List<_i35.PageRouteInfo>? children})
    : super(ApplicantsRoute.name, initialChildren: children);

  static const String name = 'ApplicantsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i2.ApplicantsPage();
    },
  );
}

/// generated route for
/// [_i3.ApplicationsPage]
class ApplicationsRoute extends _i35.PageRouteInfo<void> {
  const ApplicationsRoute({List<_i35.PageRouteInfo>? children})
    : super(ApplicationsRoute.name, initialChildren: children);

  static const String name = 'ApplicationsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i3.ApplicationsPage();
    },
  );
}

/// generated route for
/// [_i4.CandidateHomePage]
class CandidateHomeRoute extends _i35.PageRouteInfo<void> {
  const CandidateHomeRoute({List<_i35.PageRouteInfo>? children})
    : super(CandidateHomeRoute.name, initialChildren: children);

  static const String name = 'CandidateHomeRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return _i35.WrappedRoute(child: const _i4.CandidateHomePage());
    },
  );
}

/// generated route for
/// [_i5.CandidateProfilePage]
class CandidateProfileRoute extends _i35.PageRouteInfo<void> {
  const CandidateProfileRoute({List<_i35.PageRouteInfo>? children})
    : super(CandidateProfileRoute.name, initialChildren: children);

  static const String name = 'CandidateProfileRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i5.CandidateProfilePage();
    },
  );
}

/// generated route for
/// [_i6.ChatDetailsPage]
class ChatDetailsRoute extends _i35.PageRouteInfo<void> {
  const ChatDetailsRoute({List<_i35.PageRouteInfo>? children})
    : super(ChatDetailsRoute.name, initialChildren: children);

  static const String name = 'ChatDetailsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i6.ChatDetailsPage();
    },
  );
}

/// generated route for
/// [_i7.ChatsPage]
class ChatsRoute extends _i35.PageRouteInfo<void> {
  const ChatsRoute({List<_i35.PageRouteInfo>? children})
    : super(ChatsRoute.name, initialChildren: children);

  static const String name = 'ChatsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i7.ChatsPage();
    },
  );
}

/// generated route for
/// [_i8.ChooseLanguagePage]
class ChooseLanguageRoute extends _i35.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i35.PageRouteInfo>? children})
    : super(ChooseLanguageRoute.name, initialChildren: children);

  static const String name = 'ChooseLanguageRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i8.ChooseLanguagePage();
    },
  );
}

/// generated route for
/// [_i9.CompleteProfilePage]
class CompleteProfileRoute
    extends _i35.PageRouteInfo<CompleteProfileRouteArgs> {
  CompleteProfileRoute({
    _i36.Key? key,
    String? phoneNumber,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         CompleteProfileRoute.name,
         args: CompleteProfileRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'CompleteProfileRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompleteProfileRouteArgs>(
        orElse: () => const CompleteProfileRouteArgs(),
      );
      return _i9.CompleteProfilePage(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class CompleteProfileRouteArgs {
  const CompleteProfileRouteArgs({this.key, this.phoneNumber});

  final _i36.Key? key;

  final String? phoneNumber;

  @override
  String toString() {
    return 'CompleteProfileRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CompleteProfileRouteArgs) return false;
    return key == other.key && phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => key.hashCode ^ phoneNumber.hashCode;
}

/// generated route for
/// [_i10.ConfirmPasswordPage]
class ConfirmPasswordRoute extends _i35.PageRouteInfo<void> {
  const ConfirmPasswordRoute({List<_i35.PageRouteInfo>? children})
    : super(ConfirmPasswordRoute.name, initialChildren: children);

  static const String name = 'ConfirmPasswordRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i10.ConfirmPasswordPage();
    },
  );
}

/// generated route for
/// [_i11.CreateResumeFlowPage]
class CreateResumeFlowRoute
    extends _i35.PageRouteInfo<CreateResumeFlowRouteArgs> {
  CreateResumeFlowRoute({
    _i36.Key? key,
    _i37.Resume? resume,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         CreateResumeFlowRoute.name,
         args: CreateResumeFlowRouteArgs(key: key, resume: resume),
         initialChildren: children,
       );

  static const String name = 'CreateResumeFlowRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateResumeFlowRouteArgs>(
        orElse: () => const CreateResumeFlowRouteArgs(),
      );
      return _i11.CreateResumeFlowPage(key: args.key, resume: args.resume);
    },
  );
}

class CreateResumeFlowRouteArgs {
  const CreateResumeFlowRouteArgs({this.key, this.resume});

  final _i36.Key? key;

  final _i37.Resume? resume;

  @override
  String toString() {
    return 'CreateResumeFlowRouteArgs{key: $key, resume: $resume}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateResumeFlowRouteArgs) return false;
    return key == other.key && resume == other.resume;
  }

  @override
  int get hashCode => key.hashCode ^ resume.hashCode;
}

/// generated route for
/// [_i12.CreateVacancyPage]
class CreateVacancyRoute extends _i35.PageRouteInfo<void> {
  const CreateVacancyRoute({List<_i35.PageRouteInfo>? children})
    : super(CreateVacancyRoute.name, initialChildren: children);

  static const String name = 'CreateVacancyRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i12.CreateVacancyPage();
    },
  );
}

/// generated route for
/// [_i13.EditCandidateProfilePage]
class EditCandidateProfileRoute extends _i35.PageRouteInfo<void> {
  const EditCandidateProfileRoute({List<_i35.PageRouteInfo>? children})
    : super(EditCandidateProfileRoute.name, initialChildren: children);

  static const String name = 'EditCandidateProfileRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i13.EditCandidateProfilePage();
    },
  );
}

/// generated route for
/// [_i14.EditCompanyInfoPage]
class EditCompanyInfoRoute extends _i35.PageRouteInfo<void> {
  const EditCompanyInfoRoute({List<_i35.PageRouteInfo>? children})
    : super(EditCompanyInfoRoute.name, initialChildren: children);

  static const String name = 'EditCompanyInfoRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i14.EditCompanyInfoPage();
    },
  );
}

/// generated route for
/// [_i15.EditResumeContactsPage]
class EditResumeContactsRoute extends _i35.PageRouteInfo<void> {
  const EditResumeContactsRoute({List<_i35.PageRouteInfo>? children})
    : super(EditResumeContactsRoute.name, initialChildren: children);

  static const String name = 'EditResumeContactsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i15.EditResumeContactsPage();
    },
  );
}

/// generated route for
/// [_i16.EditResumeEducationPage]
class EditResumeEducationRoute
    extends _i35.PageRouteInfo<EditResumeEducationRouteArgs> {
  EditResumeEducationRoute({
    _i36.Key? key,
    _i37.ResumeEducation? education,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         EditResumeEducationRoute.name,
         args: EditResumeEducationRouteArgs(key: key, education: education),
         initialChildren: children,
       );

  static const String name = 'EditResumeEducationRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditResumeEducationRouteArgs>(
        orElse: () => const EditResumeEducationRouteArgs(),
      );
      return _i16.EditResumeEducationPage(
        key: args.key,
        education: args.education,
      );
    },
  );
}

class EditResumeEducationRouteArgs {
  const EditResumeEducationRouteArgs({this.key, this.education});

  final _i36.Key? key;

  final _i37.ResumeEducation? education;

  @override
  String toString() {
    return 'EditResumeEducationRouteArgs{key: $key, education: $education}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditResumeEducationRouteArgs) return false;
    return key == other.key && education == other.education;
  }

  @override
  int get hashCode => key.hashCode ^ education.hashCode;
}

/// generated route for
/// [_i17.EditResumeExperiencePage]
class EditResumeExperienceRoute
    extends _i35.PageRouteInfo<EditResumeExperienceRouteArgs> {
  EditResumeExperienceRoute({
    _i36.Key? key,
    _i37.ResumeExperience? experience,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         EditResumeExperienceRoute.name,
         args: EditResumeExperienceRouteArgs(key: key, experience: experience),
         initialChildren: children,
       );

  static const String name = 'EditResumeExperienceRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditResumeExperienceRouteArgs>(
        orElse: () => const EditResumeExperienceRouteArgs(),
      );
      return _i17.EditResumeExperiencePage(
        key: args.key,
        experience: args.experience,
      );
    },
  );
}

class EditResumeExperienceRouteArgs {
  const EditResumeExperienceRouteArgs({this.key, this.experience});

  final _i36.Key? key;

  final _i37.ResumeExperience? experience;

  @override
  String toString() {
    return 'EditResumeExperienceRouteArgs{key: $key, experience: $experience}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditResumeExperienceRouteArgs) return false;
    return key == other.key && experience == other.experience;
  }

  @override
  int get hashCode => key.hashCode ^ experience.hashCode;
}

/// generated route for
/// [_i18.EditResumeSkillsPage]
class EditResumeSkillsRoute extends _i35.PageRouteInfo<void> {
  const EditResumeSkillsRoute({List<_i35.PageRouteInfo>? children})
    : super(EditResumeSkillsRoute.name, initialChildren: children);

  static const String name = 'EditResumeSkillsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i18.EditResumeSkillsPage();
    },
  );
}

/// generated route for
/// [_i19.HRProfilePage]
class HRProfileRoute extends _i35.PageRouteInfo<void> {
  const HRProfileRoute({List<_i35.PageRouteInfo>? children})
    : super(HRProfileRoute.name, initialChildren: children);

  static const String name = 'HRProfileRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i19.HRProfilePage();
    },
  );
}

/// generated route for
/// [_i20.HrDashboardPage]
class HrDashboardRoute extends _i35.PageRouteInfo<void> {
  const HrDashboardRoute({List<_i35.PageRouteInfo>? children})
    : super(HrDashboardRoute.name, initialChildren: children);

  static const String name = 'HrDashboardRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i20.HrDashboardPage();
    },
  );
}

/// generated route for
/// [_i21.LoginPage]
class LoginRoute extends _i35.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i36.Key? key,
    required _i38.UserRole role,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, role: role),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i21.LoginPage(key: args.key, role: args.role);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.role});

  final _i36.Key? key;

  final _i38.UserRole role;

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
/// [_i22.MainLayoutPage]
class MainLayoutRoute extends _i35.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i35.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i22.MainLayoutPage();
    },
  );
}

/// generated route for
/// [_i23.NearbyJobsPage]
class NearbyJobsRoute extends _i35.PageRouteInfo<void> {
  const NearbyJobsRoute({List<_i35.PageRouteInfo>? children})
    : super(NearbyJobsRoute.name, initialChildren: children);

  static const String name = 'NearbyJobsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return _i35.WrappedRoute(child: const _i23.NearbyJobsPage());
    },
  );
}

/// generated route for
/// [_i24.NotificationDetailsPage]
class NotificationDetailsRoute
    extends _i35.PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    _i36.Key? key,
    required String id,
    required String title,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         NotificationDetailsRoute.name,
         args: NotificationDetailsRouteArgs(key: key, id: id, title: title),
         initialChildren: children,
       );

  static const String name = 'NotificationDetailsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return _i24.NotificationDetailsPage(
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

  final _i36.Key? key;

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
/// [_i25.NotificationsPage]
class NotificationsRoute extends _i35.PageRouteInfo<void> {
  const NotificationsRoute({List<_i35.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i25.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i26.OnboardingPage]
class OnboardingRoute extends _i35.PageRouteInfo<void> {
  const OnboardingRoute({List<_i35.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i26.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i27.OtpConfirmationPage]
class OtpConfirmationRoute
    extends _i35.PageRouteInfo<OtpConfirmationRouteArgs> {
  OtpConfirmationRoute({
    _i36.Key? key,
    String? phoneNumber,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         OtpConfirmationRoute.name,
         args: OtpConfirmationRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'OtpConfirmationRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpConfirmationRouteArgs>(
        orElse: () => const OtpConfirmationRouteArgs(),
      );
      return _i27.OtpConfirmationPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class OtpConfirmationRouteArgs {
  const OtpConfirmationRouteArgs({this.key, this.phoneNumber});

  final _i36.Key? key;

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
/// [_i28.RegisterPage]
class RegisterRoute extends _i35.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i36.Key? key,
    required String? phoneNumber,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return _i28.RegisterPage(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.phoneNumber});

  final _i36.Key? key;

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
/// [_i29.ResumeDetailsPage]
class ResumeDetailsRoute extends _i35.PageRouteInfo<ResumeDetailsRouteArgs> {
  ResumeDetailsRoute({
    _i36.Key? key,
    required String id,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         ResumeDetailsRoute.name,
         args: ResumeDetailsRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'ResumeDetailsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResumeDetailsRouteArgs>();
      return _i29.ResumeDetailsPage(key: args.key, id: args.id);
    },
  );
}

class ResumeDetailsRouteArgs {
  const ResumeDetailsRouteArgs({this.key, required this.id});

  final _i36.Key? key;

  final String id;

  @override
  String toString() {
    return 'ResumeDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResumeDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i30.ResumeSuccessPage]
class ResumeSuccessRoute extends _i35.PageRouteInfo<void> {
  const ResumeSuccessRoute({List<_i35.PageRouteInfo>? children})
    : super(ResumeSuccessRoute.name, initialChildren: children);

  static const String name = 'ResumeSuccessRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i30.ResumeSuccessPage();
    },
  );
}

/// generated route for
/// [_i31.SettingsPage]
class SettingsRoute extends _i35.PageRouteInfo<void> {
  const SettingsRoute({List<_i35.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i31.SettingsPage();
    },
  );
}

/// generated route for
/// [_i32.SplashScreen]
class SplashRoute extends _i35.PageRouteInfo<void> {
  const SplashRoute({List<_i35.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i32.SplashScreen();
    },
  );
}

/// generated route for
/// [_i33.TalentsSearchResultPage]
class TalentsSearchResultRoute extends _i35.PageRouteInfo<void> {
  const TalentsSearchResultRoute({List<_i35.PageRouteInfo>? children})
    : super(TalentsSearchResultRoute.name, initialChildren: children);

  static const String name = 'TalentsSearchResultRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      return const _i33.TalentsSearchResultPage();
    },
  );
}

/// generated route for
/// [_i34.VacancyDetailsPage]
class VacancyDetailsRoute extends _i35.PageRouteInfo<VacancyDetailsRouteArgs> {
  VacancyDetailsRoute({
    _i36.Key? key,
    required String id,
    List<_i35.PageRouteInfo>? children,
  }) : super(
         VacancyDetailsRoute.name,
         args: VacancyDetailsRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'VacancyDetailsRoute';

  static _i35.PageInfo page = _i35.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<VacancyDetailsRouteArgs>(
        orElse: () => VacancyDetailsRouteArgs(id: pathParams.getString('id')),
      );
      return _i35.WrappedRoute(
        child: _i34.VacancyDetailsPage(key: args.key, id: args.id),
      );
    },
  );
}

class VacancyDetailsRouteArgs {
  const VacancyDetailsRouteArgs({this.key, required this.id});

  final _i36.Key? key;

  final String id;

  @override
  String toString() {
    return 'VacancyDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VacancyDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}
