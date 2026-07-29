import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/enums/app_languages.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/onboarding/presentation/widgets/language_tile.dart';

@RoutePage()
class ChooseLanguagePage extends StatefulWidget {
  const ChooseLanguagePage({super.key});

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  late AppLanguages _language;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _language = AppLanguages.fromLocale(context.locale);
  }

  void _onSelectLanguage(AppLanguages lang) {
    setState(() => _language = lang);
    context.setLocale(lang.locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "onboarding.choose_language.title",
                    style: context.textThemes.h4,
                  ).tr(),
                  const SizedBox(height: 8),
                  Text(
                    "onboarding.choose_language.subtitle",
                    style: context.textThemes.b1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ).tr(),
                  const SizedBox(height: 16),
                  ...AppLanguages.values.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: LanguageTile(
                        value: e,
                        isSelected: _language == e,
                        onSelect: _onSelectLanguage,
                      ),
                    ),
                  ),
                  const Spacer(),
                  AppButton(
                    onTap: () => context.pushRoute(const OnboardingRoute()),
                    enabled: true,
                    label: "onboarding.choose_language.cta_button".tr(),
                  ),
                ],
              ),
            ),
            const Flexible(flex: 0, child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}
