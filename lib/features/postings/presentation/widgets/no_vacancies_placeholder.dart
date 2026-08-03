import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(child: Image.asset(AppAssets.onboardingDark, width: 250)),
        Text(
          "opportunities.create_vacancy",
          style: context.textThemes.h4,
          textAlign: TextAlign.center,
        ).tr(),
        const SizedBox(height: 12),
        Text(
          "shared.no_data",
          textAlign: TextAlign.center,
          style: context.textThemes.b2.copyWith(
            color: context.colors.textSecondary,
          ),
        ).tr(),
        const SizedBox(height: 24),
        AppButton(
          label: "opportunities.create_vacancy".tr(),
          onTap: () async {
            final result = await context.pushRoute(CreateVacancyRoute());
            if (result == true && context.mounted) {
              context.read<PostingsBloc>().add(LoadPostings());
            }
          },
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
