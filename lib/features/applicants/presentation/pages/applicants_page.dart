import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applicants/presentation/bloc/applicants_bloc.dart';
import 'package:mobile/features/applicants/presentation/widgets/applicant_listing_item.dart';

@RoutePage()
class ApplicantsPage extends StatelessWidget {
  final String? vacancyId;
  const ApplicantsPage({super.key, @QueryParam('vacancyId') this.vacancyId});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ApplicantsBloc>()..add(LoadApplicants(vacancyId ?? '')),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Applicants'),
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
                Text('Ko‘rilmaganlar (89)'),
                Text('Taklif etilganlar (5)'),
                Text('To‘g‘ri kelmaydi (8)'),
              ],
            ),
          ),
          body: BlocBuilder<ApplicantsBloc, ApplicantsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.error != null) {
                return Center(child: Text(state.error!));
              } else if (state.applicants == null ||
                  state.applicants!.isEmpty) {
                return const Center(child: Text("Hozircha arizalar yo'q."));
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
                          vacancyId: vacancyId ?? '',
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
      ),
    );
  }
}
