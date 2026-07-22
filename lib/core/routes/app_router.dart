// import 'package:go_router/go_router.dart';
// import 'package:mobile/core/routes/routing.dart';
// import 'package:mobile/core/shared/pages/splash_screen.dart';
// import 'package:mobile/features/auth/presentation/pages/login_page.dart';
// import 'package:mobile/features/auth/presentation/pages/register_page.dart';
// import 'package:mobile/features/onboarding/presentation/pages/choose_language_page.dart';
// import 'package:mobile/features/onboarding/presentation/pages/onboarding_page.dart';
// final appRouter = GoRouter(
//   initialLocation: Routing.chooseLanguage.path,
//   routes: [
//     GoRoute(
//       path: Routing.login.path,
//       name: Routing.login.name,
//       builder: (_, _) => const LoginPage(),
//     ),
//     GoRoute(
//       path: Routing.register.path,
//       name: Routing.register.name,
//       builder: (_, _) => const RegisterPage(),
//     ),
//     GoRoute(
//       path: Routing.onboarding.path,
//       name: Routing.onboarding.name,
//       builder: (_, _) => const OnboardingPage(),
//     ),
//     GoRoute(
//       path: Routing.chooseLanguage.path,
//       name: Routing.chooseLanguage.name,
//       builder: (_, _) => const ChooseLanguagePage(),
//     ),
//     GoRoute(
//       path: Routing.splash.path,
//       name: Routing.splash.name,
//       builder: (_, _) => const SplashScreen(),
//     ),
//   ],
// );

import 'package:auto_route/auto_route.dart';
import 'package:mobile/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: ChooseLanguageRoute.page),
    AutoRoute(page: SplashRoute.page, initial: !false),
    AutoRoute(page: OtpConfirmationRoute.page),
    AutoRoute(page: ConfirmPasswordRoute.page),
    AutoRoute(page: CompleteProfileRoute.page),
    AutoRoute(page: NotificationsRoute.page),
    AutoRoute(page: NotificationDetailsRoute.page),
    AutoRoute(page: TalentsSearchResultRoute.page),
    AutoRoute(page: ApplicantDetailsRoute.page),
    AutoRoute(page: ChatDetailsRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: EditCompanyInfoRoute.page),
    AutoRoute(page: CreateVacancyRoute.page),
    AutoRoute(page: MyVacanciesRoute.page),
    AutoRoute(page: VacancyDetailsRoute.page),
    AutoRoute(page: HrVacancyDetailsRoute.page),
    AutoRoute(page: NearbyJobsRoute.page),
    AutoRoute(page: SavedVacanciesRoute.page),
    AutoRoute(page: EditCandidateProfileRoute.page),
    AutoRoute(page: ResumeDetailsRoute.page),
    AutoRoute(page: CreateResumeFlowRoute.page),
    AutoRoute(page: ResumeSuccessRoute.page),
    AutoRoute(page: EditResumeContactsRoute.page),
    AutoRoute(page: EditResumeExperienceRoute.page),
    AutoRoute(page: EditResumeEducationRoute.page),
    AutoRoute(page: EditResumeSkillsRoute.page),
    AutoRoute(page: ArticlesRoute.page),
    AutoRoute(page: ArticleDetailsRoute.page),
    AutoRoute(page: VacancySearchRoute.page),

    AutoRoute(
      initial: !true,
      path: '/home',
      page: MainLayoutRoute.page,
      children: [
        AutoRoute(page: HrDashboardRoute.page),
        AutoRoute(page: ApplicantsRoute.page),
        AutoRoute(page: ChatsRoute.page),
        AutoRoute(page: HRProfileRoute.page),
        AutoRoute(page: CandidateHomeRoute.page),
        AutoRoute(page: ApplicationsRoute.page),
        AutoRoute(page: CandidateProfileRoute.page),
      ],
    ),
  ];
}
