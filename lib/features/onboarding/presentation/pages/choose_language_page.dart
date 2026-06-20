import 'package:auto_route/auto_route.dart';
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
  AppLanguages _language = .en;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: .all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                spacing: 12,
                children: [
                  Text(
                    "Tilni tanlang",
                    style: context.textThemes.h4,
                  ),
                  Text(
                    "Ro'yxatdan o'tgandan so'ng dastur sozlamalarida tilni o'zgartirishingiz mumkin",
                    style: context.textThemes.b1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8),
                  ...AppLanguages.values.map(
                    (e) => LanguageTile(
                      value: e,
                      isSelected: _language == e,
                      onSelect: (e) => setState(() => _language = e),
                    ),
                  ),
                  Spacer(),
                  AppButton(
                    onTap: () => context.pushRoute(OnboardingRoute()),
                    enabled: !false,
                    label: 'Davom etish',
                  ),
                ],
              ),
            ),
            Flexible(flex: 0, child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}
