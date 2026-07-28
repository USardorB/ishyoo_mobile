import 'package:auto_route/auto_route.dart';
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
        title: const Text('Applicants'),
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
          tabs: const [
            Text('Ko‘rilmaganlar'),
            Text('Taklif etilganlar'),
            Text('To‘g‘ri kelmaydi'),
            Text('Arxivlanganlar'),
            Text('Ishga qabul qilinganlar'),
            Text('Saralanganlar'),
          ],
        ),
      ),
      body: BlocBuilder<ApplicantsBloc, ApplicantsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text(state.error!));
          } else if (state.applicants == null || state.applicants!.isEmpty) {
            return const NoApplicationPlaceholder(
              message:
                  "Hozircha javoblar yo‘q. Sizning e'loningizga hali hech kim ariza topshmagan.",
            );
          }

          return TabBarView(
            controller: _tabController,
            children: _statuses.map((status) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 12,
                  children: state.applicants!.map((applicant) {
                    return ApplicantListingItem(
                      applicant: applicant,
                    );
                  }).toList(),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
