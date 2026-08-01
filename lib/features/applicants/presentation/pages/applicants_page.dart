import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicant_detail_bloc.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicants_bloc.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_listing_item.dart';
import 'package:mobile/features/applications/presentation/widgets/no_application_placeholder.dart';

@RoutePage()
class ApplicantsPage extends StatefulWidget implements AutoRouteWrapper {
  const ApplicantsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              sl<ApplicantsBloc>()..add(LoadApplicants(null, 'pending')),
        ),
        BlocProvider(create: (_) => sl<ApplicantDetailBloc>()),
      ],
      child: this,
    );
  }

  @override
  State<ApplicantsPage> createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends State<ApplicantsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _statuses = [
    'pending',
    'invited',
    'rejected',
    'archived',
    'hired',
    'shortlisted',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _statuses.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) return;
    context.read<ApplicantsBloc>().add(
      LoadApplicants(null, _statuses[_tabController.index]),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('applicants.title').tr(),
        bottom: TabBar(
          controller: _tabController,
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
          tabs: [
            const Text('applications.status.pending').tr(),
            const Text('applications.status.interview').tr(),
            const Text('applications.status.rejected').tr(),
            const Text('shared.all').tr(),
            const Text('applications.status.accepted').tr(),
            const Text('shared.filter').tr(),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _statuses.map((status) {
          return BlocBuilder<ApplicantsBloc, ApplicantsState>(
            builder: (context, state) {
              final applicants = state.applicantsByStatus[status];

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
                  message: "applications.no_applications".tr(),
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
        }).toList(),
      ),
    );
  }
}
