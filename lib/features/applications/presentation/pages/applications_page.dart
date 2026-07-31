import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applications/presentation/widgets/application_card.dart';
import 'package:mobile/features/applications/presentation/widgets/no_application_placeholder.dart';

import '../bloc/applications_bloc.dart';

@RoutePage()
class ApplicationsPage extends HookWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ApplicationsBloc>()),
      ],
      child: const _ApplicationsPageView(),
    );
  }
}

class _ApplicationsPageView extends HookWidget {
  const _ApplicationsPageView();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {"nameKey": "applications.tabs.all", "status": null},
      {"nameKey": "applications.status.interview", "status": "invited"},
      {"nameKey": "applications.status.pending", "status": "pending"},
      {"nameKey": "applications.status.rejected", "status": "rejected"},
      {"nameKey": "shared.all", "status": "archived"},
    ];
    final tabController = useTabController(initialLength: tabs.length);

    useEffect(() {
      final bloc = context.read<ApplicationsBloc>();
      bloc.add(LoadApplications(tabs[tabController.index]["status"]));

      void listener() {
        if (!tabController.indexIsChanging) {
          bloc.add(LoadApplications(tabs[tabController.index]["status"]));
        }
      }

      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("applications.title").tr(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                border: Border.all(color: context.colors.linePrimary),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: TabBar(
                  splashBorderRadius: BorderRadius.circular(32),
                  controller: tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: context.colors.brandProgress,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  labelColor: context.colors.brandDefault,
                  unselectedLabelColor: context.colors.textSecondary,
                  labelStyle: context.textThemes.buttonMedium,
                  unselectedLabelStyle: context.textThemes.buttonMedium,
                  tabs: tabs
                      .map((tab) => Tab(text: (tab["nameKey"] as String).tr()))
                      .toList(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: List.generate(tabs.length, (tabIndex) {
                return BlocBuilder<ApplicationsBloc, ApplicationsState>(
                  builder: (context, state) {
                    final tabStatus = tabs[tabIndex]["status"];
                    final applications = state.applicationsByStatus[tabStatus];

                    if (state.isLoading && applications == null) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.error != null && applications == null) {
                      return Center(child: Text(state.error!));
                    }

                    if (applications == null) {
                      return const SizedBox.shrink();
                    }

                    if (applications.isEmpty) {
                      return NoApplicationPlaceholder(
                        message: "applications.no_applications".tr(),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16)
                          .copyWith(
                            bottom: MediaQuery.paddingOf(context).bottom + 16,
                          ),
                      itemCount: applications.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final application = applications[index];
                        return ApplicationCard(
                          application: application,
                          onRefuse: () {
                            context.read<ApplicationsBloc>().add(
                              UpdateApplicationStatus(
                                application.id.toString(),
                                "rejected",
                              ),
                            );
                          },
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
