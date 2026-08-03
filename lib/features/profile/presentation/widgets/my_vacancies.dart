import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';
import 'package:mobile/features/postings/presentation/widgets/hr_vacancy_card.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';

class MyVacancies extends StatelessWidget {
  const MyVacancies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PostingsBloc>()..add(LoadPostings()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'profile.company.myVacancies',
                style: context.textThemes.s2,
              ).tr(),
              GestureDetector(
                onTap: () => context.pushRoute(const MyVacanciesRoute()),
                child: Text(
                  'profile.company.viewAll',
                  style: context.textThemes.b2.copyWith(
                    color: context.colors.brandDefault,
                  ),
                ).tr(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          BlocBuilder<PostingsBloc, PostingsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final vacancies = state.vacancies?.take(2).toList() ?? [];
              if (vacancies.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'shared.no_data',
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ).tr(),
                );
              }
              return Column(
                children: [
                  for (final vacancy in vacancies) ...[
                    // showActions=false — no PostingsBloc actions needed here
                    HrVacancyCard(vacancy: vacancy, showActions: false),
                    const SizedBox(height: 12),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: 4),
          AppButton(
            label: 'profile.company.createVacancy'.tr(),
            onTap: () async {
              final result = await context.pushRoute(CreateVacancyRoute());
              if (result == true && context.mounted) {
                context.read<EmployerOrganizationBloc>().add(
                  LoadEmployerOrganization(),
                );
                context.read<PostingsBloc>().add(LoadPostings());
              }
            },
          ),
        ],
      ),
    );
  }
}
