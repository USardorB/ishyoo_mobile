import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/painters/dashed_outline_border.dart';
import 'package:mobile/features/opportunities/data/models/vacancy.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';
import 'package:mobile/features/postings/presentation/widgets/hr_dashboard_app_bar.dart';
import 'package:mobile/features/postings/presentation/widgets/hr_vacancy_card.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/profile/presentation/bloc/employer_organization_bloc.dart';

@RoutePage()
class HrDashboardPage extends StatelessWidget {
  const HrDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthBloc>().state.user;
    final userName = user?.name ?? '';

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<PostingsBloc>()..add(LoadPostings()),
        ),
        BlocProvider(
          create: (context) =>
              sl<EmployerOrganizationBloc>()..add(LoadEmployerOrganization()),
        ),
      ],
      child: BlocBuilder<PostingsBloc, PostingsState>(
        builder: (context, state) {
          final stats = state.stats;

          return Scaffold(
            appBar: const HrDashboardAppBar(),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ).copyWith(bottom: MediaQuery.paddingOf(context).bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'postings.greeting'.tr(args: [userName.isEmpty ? 'HR' : userName]),
                    style: context.textThemes.h5,
                  ),
                  Text(
                    'postings.today_summary'.tr(args: [
                      (stats?.newApplicantsCount ?? 0).toString(),
                      (stats?.activeVacanciesCount ?? 0).toString(),
                    ]),
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: _buildStatCard(
                          context,
                          title: "postings.interviews".tr(),
                          value: "${stats?.interviewsTodayCount ?? 0}",
                          bottomText: "postings.interviews_sub".tr(),
                          isPrimary: true,
                        ),
                      ),
                      Expanded(
                        child: _buildStatCard(
                          context,
                          title: "postings.responses".tr(),
                          value: "${stats?.newApplicantsCount ?? 0}",
                          bottomText: "postings.responses_sub".tr(),
                        ),
                      ),
                      Expanded(
                        child: _buildStatCard(
                          context,
                          title: "postings.active".tr(),
                          value: "${stats?.activeVacanciesCount ?? 0}",
                          bottomText: "postings.active_sub".tr(),
                          showTrendingIcon: false,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'profile.my_vacancies',
                          style: context.textThemes.s2,
                          maxLines: 2,
                          overflow: .ellipsis,
                        ).tr(),
                      ),
                      TextButton.icon(
                        onPressed: () => context.pushRoute(
                          const MyVacanciesRoute(),
                        ),
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        label: const Text("shared.show_all").tr(),
                        style: TextButton.styleFrom(
                          textStyle: context.textThemes.buttonSmall,
                          iconAlignment: .end,
                          visualDensity: .compact,
                          tapTargetSize: .shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  if (state.isLoading)
                    const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (state.vacancies?.isEmpty ?? true)
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Center(
                        child: Text(
                          "shared.no_data",
                          style: context.textThemes.b2.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ).tr(),
                      ),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final vacancy
                            in state.vacancies?.take(5) ?? <Vacancy>[]) ...[
                          HrVacancyCard(vacancy: vacancy),
                          const SizedBox(height: 12),
                        ],
                      ],
                    ),

                  FilledButton.icon(
                    onPressed: () async {
                      final result = await context.pushRoute(
                        CreateVacancyRoute(),
                      );
                      if (result == true && context.mounted) {
                        context.read<PostingsBloc>().add(LoadPostings());
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("opportunities.create_vacancy").tr(),
                    style: FilledButton.styleFrom(
                      padding: const .all(14),
                      shape: DashedOutlineBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: context.colors.bgTertiary),
                      ),
                      textStyle: context.textThemes.buttonLarge,
                      foregroundColor: context.colors.brandDefault,
                      backgroundColor: context.colors.bgPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required String bottomText,
    bool isPrimary = false,
    bool showTrendingIcon = true,
  }) {
    final bgColor = isPrimary
        ? context.colors.brandDefault
        : context.colors.bgSecondary;
    final titleColor = isPrimary
        ? context.colors.bgPrimary
        : context.colors.textSecondary;
    final valueColor = isPrimary
        ? context.colors.bgPrimary
        : context.colors.textPrimary;
    final bottomColor = isPrimary
        ? context.colors.bgPrimary
        : (showTrendingIcon
              ? context.colors.success
              : context.colors.textSecondary);
    final iconColor = isPrimary
        ? context.colors.bgPrimary
        : context.colors.success;

    return Material(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: context.textThemes.c1.copyWith(color: titleColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              value,
              style: context.textThemes.h3.copyWith(color: valueColor),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (showTrendingIcon) ...[
                  Icon(Icons.trending_up, size: 16, color: iconColor),
                  const SizedBox(width: 4),
                ],
                Expanded(
                  child: Text(
                    bottomText,
                    style: context.textThemes.c1.copyWith(color: bottomColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
