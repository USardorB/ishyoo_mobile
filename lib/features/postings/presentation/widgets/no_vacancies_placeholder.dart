import 'package:flutter/material.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class NoVacanciesPlaceholder extends StatelessWidget {
  const NoVacanciesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Align(child: Image.asset(AppAssets.onboardingDark, width: 250)),
        Text(
          "Birinchi vakansiyangizni yarating",
          style: context.textThemes.h4,
          textAlign: .center,
        ),
        SizedBox(height: 12),
        Text(
          "Vakansiya joylashtirishni boshlash uchun \"Vakansiya yaratish\" tugmasini bosing",
          textAlign: .center,
          style: context.textThemes.b2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: 24),
        AppButton(
          label: "Vakansiya yaratish",
          onTap: () {},
        ),
        SizedBox(height: 48),
      ],
    );
  }
}
