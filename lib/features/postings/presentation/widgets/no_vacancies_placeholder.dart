import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';

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
          textAlign: TextAlign.center,
          style: context.textThemes.b2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: 24),
        AppButton(
          label: "Yangi qo'shish",
          onTap: () async {
            final result = await context.pushRoute(CreateVacancyRoute());
            if (result == true && context.mounted) {
              context.read<PostingsBloc>().add(LoadPostings());
            }
          },
        ),
        SizedBox(height: 48),
      ],
    );
  }
}
