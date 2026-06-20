import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/extensions/page_controller_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/onboarding/presentation/widgets/onboarding_page_view_item.dart';
import 'package:mobile/features/onboarding/presentation/widgets/page_view_indicator.dart';

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
                  title: 'Biz bilan ishingizni toping',
                  subTitle:
                      'IT, dizayn, marketing, savdo, xizmat ko‘rsatish va boshqa ko‘plab kasblar uchun imkoniyatlar mavjud',
                ),
                OnboardingPageViewItem(
                  title: 'O‘zingizga mos ishni tanlang',
                  subTitle:
                      'Minglab vakansiyalar orasidan qiziqishingiz va tajribangizga mos ishni toping. Karyerangizni yangi bosqichga olib chiqing.',
                ),
                OnboardingPageViewItem(
                  title: 'Qulay va tezkor jarayon',
                  subTitle:
                      'Kerakli vakansiyalarni filtrlar orqali oson toping, kompaniyalarni solishtiring va bir necha daqiqada ariza yuboring.',
                ),
              ],
            ),
          ),
          Flexible(
            flex: 0,
            child: SizedBox(height: 18),
          ),
          PageViewIndicator(
            pageController: pageController,
          ),
          Spacer(),
          SafeArea(
            minimum: .all(16),
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
                      label: isLastPage ? "Xodimlarni topish" : "Davom etish",
                    ),
                    SizedBox(height: 12),
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
                          ? "Bo‘sh ish o‘rinlarini topish"
                          : "O‘tkazish",
                      color: context.colors.bgPrimary,
                    ),
                    Flexible(flex: 0, child: SizedBox(height: 12)),
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
    // final isFromNamangan = await showDialog<bool>(
    //   context: context,
    //   builder: (_) => ConfirmationDialog(),
    // );

    // if (isFromNamangan == null || !context.mounted) return;
    context.pushRoute(LoginRoute(role: role));
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colors.bgPrimary,
      insetPadding: .all(16),
      icon: Icon(
        Icons.location_on,
        size: 80,
        color: context.colors.brandDefault,
      ),
      title: Text(
        "Siz Namangandanmisiz?",
        textAlign: .center,
      ),
      content: Text(
        "Agarda siz Namangandan bo'lsangiz, iltimos Namangandanman tugmasini bosing. Aks holda, Yo'q Namangandan emasman tugmasini bosing.",
        textAlign: .center,
      ),
      actions: [
        AppButton(
          onTap: () => context.pop(true),
          label: "Namangandanman",
        ),
        SizedBox(height: 12),
        AppButton(
          label: "Yo'q Namangandan emasman",
          onTap: () => context.pop(false),
          color: context.colors.bgTertiary,
        ),
      ],
    );
  }
}
