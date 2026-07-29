import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicants_bloc.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_listing_item.dart';
import 'package:mobile/features/applications/presentation/widgets/no_application_placeholder.dart';
import 'package:mobile/features/postings/presentation/bloc/hr_vacancy_details_bloc.dart';

@RoutePage()
class VacancyApplicantsPage extends HookWidget implements AutoRouteWrapper {
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
          create: (_) => sl<ApplicantsBloc>(),
        ),
        BlocProvider(
          create: (_) =>
              sl<HrVacancyDetailsBloc>()..add(LoadHrVacancyDetail(vacancyId)),
        ),
      ],
      child: this,
    );
  }

  final tabs = const [
    {"nameKey": "applications.status.pending", "status": "pending"},
    {"nameKey": "applications.status.invited", "status": "invited"},
    {"nameKey": "applications.status.rejected", "status": "rejected"},
    {"nameKey": "applications.status.archived", "status": "archived"},
    {"nameKey": "applications.status.hired", "status": "hired"},
    {"nameKey": "applications.status.shortlisted", "status": "shortlisted"},
  ];

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: tabs.length);

    useEffect(() {
      final bloc = context.read<ApplicantsBloc>();
      bloc.add(LoadApplicants(vacancyId, tabs[tabController.index]["status"]));

      void listener() {
        if (!tabController.indexIsChanging) {
          bloc.add(
            LoadApplicants(vacancyId, tabs[tabController.index]["status"]),
          );
        }
      }

      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController, vacancyId]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('applications.title').tr(),
        bottom: TabBar(
          controller: tabController,
          dividerColor: Colors.transparent,
          dividerHeight: 0,
          automaticIndicatorColorAdjustment: true,
          splashBorderRadius: BorderRadius.circular(20),
          indicatorSize: TabBarIndicatorSize.tab,
          isScrollable: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.colors.brandProgress,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          tabAlignment: TabAlignment.start,
          tabs: tabs.map((tab) => Text(tab["nameKey"]!).tr()).toList(),
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
                              "nav.vacancies",
                              style: context.textThemes.c1.copyWith(
                                color: context.colors.textSecondary,
                              ),
                            ).tr(),
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
                        child: const Text("shared.show_all").tr(),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(tabs.length, (tabIndex) {
                return BlocBuilder<ApplicantsBloc, ApplicantsState>(
                  builder: (context, state) {
                    final tabStatus = tabs[tabIndex]["status"];
                    final applicants = state.applicantsByStatus[tabStatus];

                    if (state.isLoading && applicants == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.error != null && applicants == null) {
                      return Center(child: Text(state.error!));
                    }

                    if (applicants == null) {
                      return const SizedBox.shrink();
                    }

                    if (applicants.isEmpty) {
                      return NoApplicationPlaceholder(
                        message: "applicants.no_responses".tr(),
                      );
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: applicants.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return ApplicantListingItem(
                          applicant: applicants[index],
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
