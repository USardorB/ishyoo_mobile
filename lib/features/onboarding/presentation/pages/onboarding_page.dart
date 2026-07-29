import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/extensions/page_controller_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/onboarding/presentation/widgets/onboarding_page_view_item.dart';
import 'package:mobile/features/onboarding/presentation/widgets/page_view_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

@RoutePage()
class OnboardingPage extends HookWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(initialPage: 0);

    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: PageView(
              controller: pageController,
              children: [
                OnboardingPageViewItem(
                  title: 'onboarding.slide1.title'.tr(),
                  subTitle: 'onboarding.slide1.subtitle'.tr(),
                ),
                OnboardingPageViewItem(
                  title: 'onboarding.slide2.title'.tr(),
                  subTitle: 'onboarding.slide2.subtitle'.tr(),
                ),
                OnboardingPageViewItem(
                  title: 'onboarding.slide3.title'.tr(),
                  subTitle: 'onboarding.slide3.subtitle'.tr(),
                ),
              ],
            ),
          ),
          const Flexible(
            flex: 0,
            child: SizedBox(height: 18),
          ),
          PageViewIndicator(
            pageController: pageController,
          ),
          const Spacer(),
          SafeArea(
            minimum: const EdgeInsets.all(16),
            child: ListenableBuilder(
              listenable: pageController,
              builder: (context, child) {
                final isLastPage = pageController.currentPage == 2;
                return Column(
                  children: [
                    AppButton(
                      onTap: () {
                        if (isLastPage) {
                          navigateToAuth(context, UserRole.employer);
                          return;
                        }
                        pageController.nextPage(
                          duration: Durations.medium1,
                          curve: Curves.ease,
                        );
                      },
                      label: isLastPage
                          ? "auth.select_role.employer_sub".tr()
                          : "shared.continue".tr(),
                    ),
                    const SizedBox(height: 12),
                    AppButton(
                      onTap: () {
                        if (isLastPage) {
                          return navigateToAuth(context, UserRole.job_seeker);
                        }
                        pageController.animateToPage(
                          2,
                          duration: Durations.medium1,
                          curve: Curves.ease,
                        );
                      },
                      label: isLastPage
                          ? "auth.select_role.candidate_sub".tr()
                          : "shared.skip".tr(),
                      color: context.colors.bgPrimary,
                    ),
                    const Flexible(flex: 0, child: SizedBox(height: 12)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void navigateToAuth(BuildContext context, UserRole role) async {
    await [
      Permission.notification,
      Permission.locationWhenInUse,
    ].request();

    if (!context.mounted) return;
    context.pushRoute(LoginRoute(role: role));
  }
}
