// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i43;
import 'package:flutter/material.dart' as _i44;
import 'package:mobile/core/enums/user_role.dart' as _i48;
import 'package:mobile/core/shared/pages/home_screen.dart' as _i26;
import 'package:mobile/core/shared/pages/splash_screen.dart' as _i39;
import 'package:mobile/features/applicants/presentation/pages/applicant_details_page.dart'
    as _i1;
import 'package:mobile/features/applicants/presentation/pages/applicants_page.dart'
    as _i2;
import 'package:mobile/features/applications/presentation/pages/applications_page.dart'
    as _i3;
import 'package:mobile/features/articles/presentation/pages/article_details_page.dart'
    as _i4;
import 'package:mobile/features/articles/presentation/pages/articles_page.dart'
    as _i5;
import 'package:mobile/features/auth/presentation/pages/complete_profile_page.dart'
    as _i12;
import 'package:mobile/features/auth/presentation/pages/confirm_password_page.dart'
    as _i13;
import 'package:mobile/features/auth/presentation/pages/login_page.dart'
    as _i25;
import 'package:mobile/features/auth/presentation/pages/otp_confirmation_page.dart'
    as _i32;
import 'package:mobile/features/auth/presentation/pages/register_page.dart'
    as _i33;
import 'package:mobile/features/messaging/presentation/pages/chat_details_page.dart'
    as _i8;
import 'package:mobile/features/messaging/presentation/pages/chats_page.dart'
    as _i9;
import 'package:mobile/features/notifications/presentation/pages/notification_details_page.dart'
    as _i29;
import 'package:mobile/features/notifications/presentation/pages/notifications_page.dart'
    as _i30;
import 'package:mobile/features/onboarding/presentation/pages/choose_language_page.dart'
    as _i10;
import 'package:mobile/features/onboarding/presentation/pages/onboarding_page.dart'
    as _i31;
import 'package:mobile/features/opportunities/data/models/organization.dart'
    as _i45;
import 'package:mobile/features/opportunities/data/models/vacancy.dart' as _i47;
import 'package:mobile/features/opportunities/presentation/pages/candidate_home_page.dart'
    as _i6;
import 'package:mobile/features/opportunities/presentation/pages/company_details_page.dart'
    as _i11;
import 'package:mobile/features/opportunities/presentation/pages/nearby_jobs_page.dart'
    as _i28;
import 'package:mobile/features/opportunities/presentation/pages/saved_vacancies_page.dart'
    as _i37;
import 'package:mobile/features/opportunities/presentation/pages/vacancy_details_page.dart'
    as _i41;
import 'package:mobile/features/opportunities/presentation/pages/vacancy_search_page.dart'
    as _i42;
import 'package:mobile/features/postings/presentation/pages/create_vacancy_page.dart'
    as _i15;
import 'package:mobile/features/postings/presentation/pages/hr_dashboard_page.dart'
    as _i23;
import 'package:mobile/features/postings/presentation/pages/hr_vacancy_details_page.dart'
    as _i24;
import 'package:mobile/features/postings/presentation/pages/my_vacancies_page.dart'
    as _i27;
import 'package:mobile/features/profile/presentation/pages/candidate_profile_page.dart'
    as _i7;
import 'package:mobile/features/profile/presentation/pages/edit_candidate_profile_page.dart'
    as _i16;
import 'package:mobile/features/profile/presentation/pages/edit_company_info_page.dart'
    as _i17;
import 'package:mobile/features/profile/presentation/pages/hr_profile_page.dart'
    as _i22;
import 'package:mobile/features/resume/data/models/resume.dart' as _i46;
import 'package:mobile/features/resume/presentation/pages/create_resume_flow_page.dart'
    as _i14;
import 'package:mobile/features/resume/presentation/pages/edit_resume_contacts_page.dart'
    as _i18;
import 'package:mobile/features/resume/presentation/pages/edit_resume_education_page.dart'
    as _i19;
import 'package:mobile/features/resume/presentation/pages/edit_resume_experience_page.dart'
    as _i20;
import 'package:mobile/features/resume/presentation/pages/edit_resume_skills_page.dart'
    as _i21;
import 'package:mobile/features/resume/presentation/pages/resume_details_page.dart'
    as _i34;
import 'package:mobile/features/resume/presentation/pages/resume_pdf_preview_page.dart'
    as _i35;
import 'package:mobile/features/resume/presentation/pages/resume_success_page.dart'
    as _i36;
import 'package:mobile/features/settings/pages/presentation/settings_page.dart'
    as _i38;
import 'package:mobile/features/talents/presentation/pages/talents_search_result_page.dart'
    as _i40;

/// generated route for
/// [_i1.ApplicantDetailsPage]
class ApplicantDetailsRoute
    extends _i43.PageRouteInfo<ApplicantDetailsRouteArgs> {
  ApplicantDetailsRoute({
    _i44.Key? key,
    required String vacancyId,
    required String applicantId,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         ApplicantDetailsRoute.name,
         args: ApplicantDetailsRouteArgs(
           key: key,
           vacancyId: vacancyId,
           applicantId: applicantId,
         ),
         initialChildren: children,
       );

  static const String name = 'ApplicantDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ApplicantDetailsRouteArgs>();
      return _i1.ApplicantDetailsPage(
        key: args.key,
        vacancyId: args.vacancyId,
        applicantId: args.applicantId,
      );
    },
  );
}

class ApplicantDetailsRouteArgs {
  const ApplicantDetailsRouteArgs({
    this.key,
    required this.vacancyId,
    required this.applicantId,
  });

  final _i44.Key? key;

  final String vacancyId;

  final String applicantId;

  @override
  String toString() {
    return 'ApplicantDetailsRouteArgs{key: $key, vacancyId: $vacancyId, applicantId: $applicantId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ApplicantDetailsRouteArgs) return false;
    return key == other.key &&
        vacancyId == other.vacancyId &&
        applicantId == other.applicantId;
  }

  @override
  int get hashCode => key.hashCode ^ vacancyId.hashCode ^ applicantId.hashCode;
}

/// generated route for
/// [_i2.ApplicantsPage]
class ApplicantsRoute extends _i43.PageRouteInfo<ApplicantsRouteArgs> {
  ApplicantsRoute({
    _i44.Key? key,
    String? vacancyId,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         ApplicantsRoute.name,
         args: ApplicantsRouteArgs(key: key, vacancyId: vacancyId),
         rawQueryParams: {'vacancyId': vacancyId},
         initialChildren: children,
       );

  static const String name = 'ApplicantsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<ApplicantsRouteArgs>(
        orElse: () =>
            ApplicantsRouteArgs(vacancyId: queryParams.optString('vacancyId')),
      );
      return _i2.ApplicantsPage(key: args.key, vacancyId: args.vacancyId);
    },
  );
}

class ApplicantsRouteArgs {
  const ApplicantsRouteArgs({this.key, this.vacancyId});

  final _i44.Key? key;

  final String? vacancyId;

  @override
  String toString() {
    return 'ApplicantsRouteArgs{key: $key, vacancyId: $vacancyId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ApplicantsRouteArgs) return false;
    return key == other.key && vacancyId == other.vacancyId;
  }

  @override
  int get hashCode => key.hashCode ^ vacancyId.hashCode;
}

/// generated route for
/// [_i3.ApplicationsPage]
class ApplicationsRoute extends _i43.PageRouteInfo<void> {
  const ApplicationsRoute({List<_i43.PageRouteInfo>? children})
    : super(ApplicationsRoute.name, initialChildren: children);

  static const String name = 'ApplicationsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i3.ApplicationsPage();
    },
  );
}

/// generated route for
/// [_i4.ArticleDetailsPage]
class ArticleDetailsRoute extends _i43.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i44.Key? key,
    required String id,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         ArticleDetailsRoute.name,
         args: ArticleDetailsRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'ArticleDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ArticleDetailsRouteArgs>(
        orElse: () => ArticleDetailsRouteArgs(id: pathParams.getString('id')),
      );
      return _i4.ArticleDetailsPage(key: args.key, id: args.id);
    },
  );
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({this.key, required this.id});

  final _i44.Key? key;

  final String id;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ArticleDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i5.ArticlesPage]
class ArticlesRoute extends _i43.PageRouteInfo<void> {
  const ArticlesRoute({List<_i43.PageRouteInfo>? children})
    : super(ArticlesRoute.name, initialChildren: children);

  static const String name = 'ArticlesRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i5.ArticlesPage();
    },
  );
}

/// generated route for
/// [_i6.CandidateHomePage]
class CandidateHomeRoute extends _i43.PageRouteInfo<void> {
  const CandidateHomeRoute({List<_i43.PageRouteInfo>? children})
    : super(CandidateHomeRoute.name, initialChildren: children);

  static const String name = 'CandidateHomeRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return _i43.WrappedRoute(child: const _i6.CandidateHomePage());
    },
  );
}

/// generated route for
/// [_i7.CandidateProfilePage]
class CandidateProfileRoute extends _i43.PageRouteInfo<void> {
  const CandidateProfileRoute({List<_i43.PageRouteInfo>? children})
    : super(CandidateProfileRoute.name, initialChildren: children);

  static const String name = 'CandidateProfileRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i7.CandidateProfilePage();
    },
  );
}

/// generated route for
/// [_i8.ChatDetailsPage]
class ChatDetailsRoute extends _i43.PageRouteInfo<ChatDetailsRouteArgs> {
  ChatDetailsRoute({
    _i44.Key? key,
    required String chatId,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         ChatDetailsRoute.name,
         args: ChatDetailsRouteArgs(key: key, chatId: chatId),
         initialChildren: children,
       );

  static const String name = 'ChatDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ChatDetailsRouteArgs>();
      return _i8.ChatDetailsPage(key: args.key, chatId: args.chatId);
    },
  );
}

class ChatDetailsRouteArgs {
  const ChatDetailsRouteArgs({this.key, required this.chatId});

  final _i44.Key? key;

  final String chatId;

  @override
  String toString() {
    return 'ChatDetailsRouteArgs{key: $key, chatId: $chatId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChatDetailsRouteArgs) return false;
    return key == other.key && chatId == other.chatId;
  }

  @override
  int get hashCode => key.hashCode ^ chatId.hashCode;
}

/// generated route for
/// [_i9.ChatsPage]
class ChatsRoute extends _i43.PageRouteInfo<void> {
  const ChatsRoute({List<_i43.PageRouteInfo>? children})
    : super(ChatsRoute.name, initialChildren: children);

  static const String name = 'ChatsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i9.ChatsPage();
    },
  );
}

/// generated route for
/// [_i10.ChooseLanguagePage]
class ChooseLanguageRoute extends _i43.PageRouteInfo<void> {
  const ChooseLanguageRoute({List<_i43.PageRouteInfo>? children})
    : super(ChooseLanguageRoute.name, initialChildren: children);

  static const String name = 'ChooseLanguageRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i10.ChooseLanguagePage();
    },
  );
}

/// generated route for
/// [_i11.CompanyDetailsPage]
class CompanyDetailsRoute extends _i43.PageRouteInfo<CompanyDetailsRouteArgs> {
  CompanyDetailsRoute({
    _i44.Key? key,
    required _i45.Organization organization,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         CompanyDetailsRoute.name,
         args: CompanyDetailsRouteArgs(key: key, organization: organization),
         initialChildren: children,
       );

  static const String name = 'CompanyDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompanyDetailsRouteArgs>();
      return _i11.CompanyDetailsPage(
        key: args.key,
        organization: args.organization,
      );
    },
  );
}

class CompanyDetailsRouteArgs {
  const CompanyDetailsRouteArgs({this.key, required this.organization});

  final _i44.Key? key;

  final _i45.Organization organization;

  @override
  String toString() {
    return 'CompanyDetailsRouteArgs{key: $key, organization: $organization}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CompanyDetailsRouteArgs) return false;
    return key == other.key && organization == other.organization;
  }

  @override
  int get hashCode => key.hashCode ^ organization.hashCode;
}

/// generated route for
/// [_i12.CompleteProfilePage]
class CompleteProfileRoute
    extends _i43.PageRouteInfo<CompleteProfileRouteArgs> {
  CompleteProfileRoute({
    _i44.Key? key,
    String? phoneNumber,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         CompleteProfileRoute.name,
         args: CompleteProfileRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'CompleteProfileRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompleteProfileRouteArgs>(
        orElse: () => const CompleteProfileRouteArgs(),
      );
      return _i12.CompleteProfilePage(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class CompleteProfileRouteArgs {
  const CompleteProfileRouteArgs({this.key, this.phoneNumber});

  final _i44.Key? key;

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
/// [_i13.ConfirmPasswordPage]
class ConfirmPasswordRoute extends _i43.PageRouteInfo<void> {
  const ConfirmPasswordRoute({List<_i43.PageRouteInfo>? children})
    : super(ConfirmPasswordRoute.name, initialChildren: children);

  static const String name = 'ConfirmPasswordRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i13.ConfirmPasswordPage();
    },
  );
}

/// generated route for
/// [_i14.CreateResumeFlowPage]
class CreateResumeFlowRoute
    extends _i43.PageRouteInfo<CreateResumeFlowRouteArgs> {
  CreateResumeFlowRoute({
    _i44.Key? key,
    _i46.Resume? resume,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         CreateResumeFlowRoute.name,
         args: CreateResumeFlowRouteArgs(key: key, resume: resume),
         initialChildren: children,
       );

  static const String name = 'CreateResumeFlowRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateResumeFlowRouteArgs>(
        orElse: () => const CreateResumeFlowRouteArgs(),
      );
      return _i14.CreateResumeFlowPage(key: args.key, resume: args.resume);
    },
  );
}

class CreateResumeFlowRouteArgs {
  const CreateResumeFlowRouteArgs({this.key, this.resume});

  final _i44.Key? key;

  final _i46.Resume? resume;

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
/// [_i15.CreateVacancyPage]
class CreateVacancyRoute extends _i43.PageRouteInfo<CreateVacancyRouteArgs> {
  CreateVacancyRoute({
    _i44.Key? key,
    _i47.Vacancy? vacancyToEdit,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         CreateVacancyRoute.name,
         args: CreateVacancyRouteArgs(key: key, vacancyToEdit: vacancyToEdit),
         initialChildren: children,
       );

  static const String name = 'CreateVacancyRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateVacancyRouteArgs>(
        orElse: () => const CreateVacancyRouteArgs(),
      );
      return _i15.CreateVacancyPage(
        key: args.key,
        vacancyToEdit: args.vacancyToEdit,
      );
    },
  );
}

class CreateVacancyRouteArgs {
  const CreateVacancyRouteArgs({this.key, this.vacancyToEdit});

  final _i44.Key? key;

  final _i47.Vacancy? vacancyToEdit;

  @override
  String toString() {
    return 'CreateVacancyRouteArgs{key: $key, vacancyToEdit: $vacancyToEdit}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CreateVacancyRouteArgs) return false;
    return key == other.key && vacancyToEdit == other.vacancyToEdit;
  }

  @override
  int get hashCode => key.hashCode ^ vacancyToEdit.hashCode;
}

/// generated route for
/// [_i16.EditCandidateProfilePage]
class EditCandidateProfileRoute extends _i43.PageRouteInfo<void> {
  const EditCandidateProfileRoute({List<_i43.PageRouteInfo>? children})
    : super(EditCandidateProfileRoute.name, initialChildren: children);

  static const String name = 'EditCandidateProfileRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i16.EditCandidateProfilePage();
    },
  );
}

/// generated route for
/// [_i17.EditCompanyInfoPage]
class EditCompanyInfoRoute extends _i43.PageRouteInfo<void> {
  const EditCompanyInfoRoute({List<_i43.PageRouteInfo>? children})
    : super(EditCompanyInfoRoute.name, initialChildren: children);

  static const String name = 'EditCompanyInfoRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i17.EditCompanyInfoPage();
    },
  );
}

/// generated route for
/// [_i18.EditResumeContactsPage]
class EditResumeContactsRoute extends _i43.PageRouteInfo<void> {
  const EditResumeContactsRoute({List<_i43.PageRouteInfo>? children})
    : super(EditResumeContactsRoute.name, initialChildren: children);

  static const String name = 'EditResumeContactsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i18.EditResumeContactsPage();
    },
  );
}

/// generated route for
/// [_i19.EditResumeEducationPage]
class EditResumeEducationRoute
    extends _i43.PageRouteInfo<EditResumeEducationRouteArgs> {
  EditResumeEducationRoute({
    _i44.Key? key,
    _i46.ResumeEducation? education,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         EditResumeEducationRoute.name,
         args: EditResumeEducationRouteArgs(key: key, education: education),
         initialChildren: children,
       );

  static const String name = 'EditResumeEducationRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditResumeEducationRouteArgs>(
        orElse: () => const EditResumeEducationRouteArgs(),
      );
      return _i19.EditResumeEducationPage(
        key: args.key,
        education: args.education,
      );
    },
  );
}

class EditResumeEducationRouteArgs {
  const EditResumeEducationRouteArgs({this.key, this.education});

  final _i44.Key? key;

  final _i46.ResumeEducation? education;

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
/// [_i20.EditResumeExperiencePage]
class EditResumeExperienceRoute
    extends _i43.PageRouteInfo<EditResumeExperienceRouteArgs> {
  EditResumeExperienceRoute({
    _i44.Key? key,
    _i46.ResumeExperience? experience,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         EditResumeExperienceRoute.name,
         args: EditResumeExperienceRouteArgs(key: key, experience: experience),
         initialChildren: children,
       );

  static const String name = 'EditResumeExperienceRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditResumeExperienceRouteArgs>(
        orElse: () => const EditResumeExperienceRouteArgs(),
      );
      return _i20.EditResumeExperiencePage(
        key: args.key,
        experience: args.experience,
      );
    },
  );
}

class EditResumeExperienceRouteArgs {
  const EditResumeExperienceRouteArgs({this.key, this.experience});

  final _i44.Key? key;

  final _i46.ResumeExperience? experience;

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
/// [_i21.EditResumeSkillsPage]
class EditResumeSkillsRoute extends _i43.PageRouteInfo<void> {
  const EditResumeSkillsRoute({List<_i43.PageRouteInfo>? children})
    : super(EditResumeSkillsRoute.name, initialChildren: children);

  static const String name = 'EditResumeSkillsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i21.EditResumeSkillsPage();
    },
  );
}

/// generated route for
/// [_i22.HRProfilePage]
class HRProfileRoute extends _i43.PageRouteInfo<void> {
  const HRProfileRoute({List<_i43.PageRouteInfo>? children})
    : super(HRProfileRoute.name, initialChildren: children);

  static const String name = 'HRProfileRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i22.HRProfilePage();
    },
  );
}

/// generated route for
/// [_i23.HrDashboardPage]
class HrDashboardRoute extends _i43.PageRouteInfo<void> {
  const HrDashboardRoute({List<_i43.PageRouteInfo>? children})
    : super(HrDashboardRoute.name, initialChildren: children);

  static const String name = 'HrDashboardRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i23.HrDashboardPage();
    },
  );
}

/// generated route for
/// [_i24.HrVacancyDetailsPage]
class HrVacancyDetailsRoute
    extends _i43.PageRouteInfo<HrVacancyDetailsRouteArgs> {
  HrVacancyDetailsRoute({
    _i44.Key? key,
    required String id,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         HrVacancyDetailsRoute.name,
         args: HrVacancyDetailsRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'HrVacancyDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<HrVacancyDetailsRouteArgs>(
        orElse: () => HrVacancyDetailsRouteArgs(id: pathParams.getString('id')),
      );
      return _i43.WrappedRoute(
        child: _i24.HrVacancyDetailsPage(key: args.key, id: args.id),
      );
    },
  );
}

class HrVacancyDetailsRouteArgs {
  const HrVacancyDetailsRouteArgs({this.key, required this.id});

  final _i44.Key? key;

  final String id;

  @override
  String toString() {
    return 'HrVacancyDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! HrVacancyDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i25.LoginPage]
class LoginRoute extends _i43.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i44.Key? key,
    required _i48.UserRole role,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, role: role),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return _i25.LoginPage(key: args.key, role: args.role);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, required this.role});

  final _i44.Key? key;

  final _i48.UserRole role;

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
/// [_i26.MainLayoutPage]
class MainLayoutRoute extends _i43.PageRouteInfo<void> {
  const MainLayoutRoute({List<_i43.PageRouteInfo>? children})
    : super(MainLayoutRoute.name, initialChildren: children);

  static const String name = 'MainLayoutRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i26.MainLayoutPage();
    },
  );
}

/// generated route for
/// [_i27.MyVacanciesPage]
class MyVacanciesRoute extends _i43.PageRouteInfo<void> {
  const MyVacanciesRoute({List<_i43.PageRouteInfo>? children})
    : super(MyVacanciesRoute.name, initialChildren: children);

  static const String name = 'MyVacanciesRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i27.MyVacanciesPage();
    },
  );
}

/// generated route for
/// [_i28.NearbyJobsPage]
class NearbyJobsRoute extends _i43.PageRouteInfo<void> {
  const NearbyJobsRoute({List<_i43.PageRouteInfo>? children})
    : super(NearbyJobsRoute.name, initialChildren: children);

  static const String name = 'NearbyJobsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return _i43.WrappedRoute(child: const _i28.NearbyJobsPage());
    },
  );
}

/// generated route for
/// [_i29.NotificationDetailsPage]
class NotificationDetailsRoute
    extends _i43.PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    _i44.Key? key,
    required String id,
    required String title,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         NotificationDetailsRoute.name,
         args: NotificationDetailsRouteArgs(key: key, id: id, title: title),
         initialChildren: children,
       );

  static const String name = 'NotificationDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return _i29.NotificationDetailsPage(
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

  final _i44.Key? key;

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
/// [_i30.NotificationsPage]
class NotificationsRoute extends _i43.PageRouteInfo<void> {
  const NotificationsRoute({List<_i43.PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i30.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i31.OnboardingPage]
class OnboardingRoute extends _i43.PageRouteInfo<void> {
  const OnboardingRoute({List<_i43.PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i31.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i32.OtpConfirmationPage]
class OtpConfirmationRoute
    extends _i43.PageRouteInfo<OtpConfirmationRouteArgs> {
  OtpConfirmationRoute({
    _i44.Key? key,
    String? phoneNumber,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         OtpConfirmationRoute.name,
         args: OtpConfirmationRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'OtpConfirmationRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpConfirmationRouteArgs>(
        orElse: () => const OtpConfirmationRouteArgs(),
      );
      return _i32.OtpConfirmationPage(
        key: args.key,
        phoneNumber: args.phoneNumber,
      );
    },
  );
}

class OtpConfirmationRouteArgs {
  const OtpConfirmationRouteArgs({this.key, this.phoneNumber});

  final _i44.Key? key;

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
/// [_i33.RegisterPage]
class RegisterRoute extends _i43.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    _i44.Key? key,
    required String? phoneNumber,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return _i33.RegisterPage(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.phoneNumber});

  final _i44.Key? key;

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
/// [_i34.ResumeDetailsPage]
class ResumeDetailsRoute extends _i43.PageRouteInfo<ResumeDetailsRouteArgs> {
  ResumeDetailsRoute({
    _i44.Key? key,
    required String id,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         ResumeDetailsRoute.name,
         args: ResumeDetailsRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'ResumeDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResumeDetailsRouteArgs>();
      return _i43.WrappedRoute(
        child: _i34.ResumeDetailsPage(key: args.key, id: args.id),
      );
    },
  );
}

class ResumeDetailsRouteArgs {
  const ResumeDetailsRouteArgs({this.key, required this.id});

  final _i44.Key? key;

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
/// [_i35.ResumePdfPreviewPage]
class ResumePdfPreviewRoute
    extends _i43.PageRouteInfo<ResumePdfPreviewRouteArgs> {
  ResumePdfPreviewRoute({
    _i44.Key? key,
    required String resumeId,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         ResumePdfPreviewRoute.name,
         args: ResumePdfPreviewRouteArgs(key: key, resumeId: resumeId),
         initialChildren: children,
       );

  static const String name = 'ResumePdfPreviewRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResumePdfPreviewRouteArgs>();
      return _i35.ResumePdfPreviewPage(key: args.key, resumeId: args.resumeId);
    },
  );
}

class ResumePdfPreviewRouteArgs {
  const ResumePdfPreviewRouteArgs({this.key, required this.resumeId});

  final _i44.Key? key;

  final String resumeId;

  @override
  String toString() {
    return 'ResumePdfPreviewRouteArgs{key: $key, resumeId: $resumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResumePdfPreviewRouteArgs) return false;
    return key == other.key && resumeId == other.resumeId;
  }

  @override
  int get hashCode => key.hashCode ^ resumeId.hashCode;
}

/// generated route for
/// [_i36.ResumeSuccessPage]
class ResumeSuccessRoute extends _i43.PageRouteInfo<void> {
  const ResumeSuccessRoute({List<_i43.PageRouteInfo>? children})
    : super(ResumeSuccessRoute.name, initialChildren: children);

  static const String name = 'ResumeSuccessRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i36.ResumeSuccessPage();
    },
  );
}

/// generated route for
/// [_i37.SavedVacanciesPage]
class SavedVacanciesRoute extends _i43.PageRouteInfo<void> {
  const SavedVacanciesRoute({List<_i43.PageRouteInfo>? children})
    : super(SavedVacanciesRoute.name, initialChildren: children);

  static const String name = 'SavedVacanciesRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return _i43.WrappedRoute(child: const _i37.SavedVacanciesPage());
    },
  );
}

/// generated route for
/// [_i38.SettingsPage]
class SettingsRoute extends _i43.PageRouteInfo<void> {
  const SettingsRoute({List<_i43.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i38.SettingsPage();
    },
  );
}

/// generated route for
/// [_i39.SplashScreen]
class SplashRoute extends _i43.PageRouteInfo<void> {
  const SplashRoute({List<_i43.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i39.SplashScreen();
    },
  );
}

/// generated route for
/// [_i40.TalentsSearchResultPage]
class TalentsSearchResultRoute extends _i43.PageRouteInfo<void> {
  const TalentsSearchResultRoute({List<_i43.PageRouteInfo>? children})
    : super(TalentsSearchResultRoute.name, initialChildren: children);

  static const String name = 'TalentsSearchResultRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return const _i40.TalentsSearchResultPage();
    },
  );
}

/// generated route for
/// [_i41.VacancyDetailsPage]
class VacancyDetailsRoute extends _i43.PageRouteInfo<VacancyDetailsRouteArgs> {
  VacancyDetailsRoute({
    _i44.Key? key,
    required String id,
    List<_i43.PageRouteInfo>? children,
  }) : super(
         VacancyDetailsRoute.name,
         args: VacancyDetailsRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'VacancyDetailsRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<VacancyDetailsRouteArgs>(
        orElse: () => VacancyDetailsRouteArgs(id: pathParams.getString('id')),
      );
      return _i43.WrappedRoute(
        child: _i41.VacancyDetailsPage(key: args.key, id: args.id),
      );
    },
  );
}

class VacancyDetailsRouteArgs {
  const VacancyDetailsRouteArgs({this.key, required this.id});

  final _i44.Key? key;

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

/// generated route for
/// [_i42.VacancySearchPage]
class VacancySearchRoute extends _i43.PageRouteInfo<void> {
  const VacancySearchRoute({List<_i43.PageRouteInfo>? children})
    : super(VacancySearchRoute.name, initialChildren: children);

  static const String name = 'VacancySearchRoute';

  static _i43.PageInfo page = _i43.PageInfo(
    name,
    builder: (data) {
      return _i43.WrappedRoute(child: const _i42.VacancySearchPage());
    },
  );
}
