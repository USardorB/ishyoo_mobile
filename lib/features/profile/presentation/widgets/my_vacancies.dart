import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';
import 'package:mobile/features/profile/presentation/widgets/vacancy_listing_item.dart';

class MyVacancies extends StatelessWidget {
  const MyVacancies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('profile.my_vacancies', style: context.textThemes.s2).tr(),
            GestureDetector(
              onTap: () => context.pushRoute(const MyVacanciesRoute()),
              child: Text(
                'shared.show_all',
                style: context.textThemes.b2.copyWith(
                  color: context.colors.brandDefault,
                ),
              ).tr(),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const VacancyListingItem(),
        const SizedBox(height: 16),
        AppButton(
          label: "opportunities.create_vacancy".tr(),
          onTap: () async {
            final result = await context.pushRoute(CreateVacancyRoute());
            if (result == true && context.mounted) {
              context.read<EmployerOrganizationBloc>().add(
                LoadEmployerOrganization(),
              );
            }
          },
        ),
      ],
    );
  }
}
