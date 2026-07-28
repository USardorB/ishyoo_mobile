import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicants_bloc.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_listing_item.dart';
import 'package:mobile/features/applications/presentation/widgets/no_application_placeholder.dart';
import 'package:mobile/features/postings/presentation/bloc/hr_vacancy_details_bloc.dart';

@RoutePage()
class VacancyApplicantsPage extends StatelessWidget
    implements AutoRouteWrapper {
  final String vacancyId;

  const VacancyApplicantsPage({
    super.key,
    @PathParam('vacancyId') required this.vacancyId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<ApplicantsBloc>()..add(LoadApplicants(vacancyId)),
        ),
        BlocProvider(
          create: (_) =>
              sl<HrVacancyDetailsBloc>()..add(LoadHrVacancyDetail(vacancyId)),
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vakansiya bo\'yicha javoblar'),
          bottom: TabBar(
            dividerColor: Colors.transparent,
            dividerHeight: 0,
            automaticIndicatorColorAdjustment: true,
            splashBorderRadius: .circular(20),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            padding: EdgeInsets.symmetric(horizontal: 16),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.colors.brandProgress,
            ),
            labelPadding: .symmetric(horizontal: 12, vertical: 8),
            tabAlignment: TabAlignment.start,
            tabs: [
              Text('Ko‘rilmaganlar'),
              Text('Taklif etilganlar'),
              Text('To‘g‘ri kelmaydi'),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BlocBuilder<HrVacancyDetailsBloc, HrVacancyDetailsState>(
              builder: (context, state) {
                if (state is HrVacancyDetailsSuccess) {
                  return Container(
                    margin: const EdgeInsets.all(16).copyWith(bottom: 0),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: context.colors.brandDefault.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: context.colors.brandDefault.withValues(
                          alpha: 0.2,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vakansiya",
                                style: context.textThemes.c1.copyWith(
                                  color: context.colors.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                state.vacancy.jobTitle,
                                style: context.textThemes.b1.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushRoute(
                              HrVacancyDetailsRoute(id: vacancyId),
                            );
                          },
                          style: TextButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                            foregroundColor: context.colors.brandDefault,
                          ),
                          child: const Text("Ko'rish"),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Expanded(
              child: BlocBuilder<ApplicantsBloc, ApplicantsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.error != null) {
                    return Center(child: Text(state.error!));
                  } else if (state.applicants == null ||
                      state.applicants!.isEmpty) {
                    return const NoApplicationPlaceholder(
                      message:
                          "Hozircha javoblar yo‘q. Sizning e'loningizga hali hech kim ariza topshmagan.",
                    );
                  }
                  return TabBarView(
                    children: [
                      SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          spacing: 12,
                          children: state.applicants!.map((applicant) {
                            return ApplicantListingItem(
                              applicant: applicant,
                              // vacancyId: applicant.vacancyId ?? vacancyId,
                            );
                          }).toList(),
                        ),
                      ),
                      Container(color: Colors.green),
                      Container(color: Colors.blue),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
