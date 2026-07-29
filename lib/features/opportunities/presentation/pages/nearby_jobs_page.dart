import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/presentation/bloc/nearby_jobs_bloc.dart';
import 'package:mobile/features/opportunities/presentation/widgets/no_nearby_jobs_placeholder.dart';
import 'package:mobile/features/opportunities/presentation/widgets/trending_vacancy_card.dart';

@RoutePage()
class NearbyJobsPage extends StatefulWidget implements AutoRouteWrapper {
  const NearbyJobsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NearbyJobsBloc>()..add(const LoadNearbyJobs(radius: 3)),
      child: this,
    );
  }

  @override
  State<NearbyJobsPage> createState() => _NearbyJobsPageState();
}

class _NearbyJobsPageState extends State<NearbyJobsPage> {
  int _selectedRadius = 3;

  void _onRadiusSelected(int radius) {
    setState(() {
      _selectedRadius = radius;
    });
    context.read<NearbyJobsBloc>().add(LoadNearbyJobs(radius: radius));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("opportunities.nearby_jobs").tr(),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildChip(context, "3 km", 3),
                const SizedBox(width: 8),
                _buildChip(context, "5 km", 5),
                const SizedBox(width: 8),
                _buildChip(context, "8 km", 8),
                const SizedBox(width: 8),
                _buildChip(context, "10 km", 10),
              ],
            ),
          ),
          BlocBuilder<NearbyJobsBloc, NearbyJobsState>(
            builder: (context, state) {
              int count = 0;
              if (state is NearbyJobsLoaded) {
                count = state.vacancies.length;
              }

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'talents.results_count'.tr(args: [count.toString()]),
                      style: context.textThemes.s2,
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () {},
                      label: const Text("opportunities.matches_filter").tr(),
                      style: TextButton.styleFrom(
                        textStyle: context.textThemes.buttonLarge,
                        visualDensity: VisualDensity.compact,
                        iconAlignment: IconAlignment.end,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      icon: const Icon(Icons.swap_vert, size: 20),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: BlocBuilder<NearbyJobsBloc, NearbyJobsState>(
              builder: (context, state) {
                if (state is NearbyJobsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is NearbyJobsError) {
                  return Center(child: Text(state.message));
                } else if (state is NearbyJobsLocationError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "shared.error_occurred".tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: context.colors.textSecondary),
                      ),
                    ),
                  );
                } else if (state is NearbyJobsLoaded) {
                  if (state.vacancies.isEmpty) {
                    return const NoNearbyJobsPlaceholder();
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(
                          bottom: MediaQuery.paddingOf(context).bottom + 16,
                        ),
                    itemCount: state.vacancies.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return TrendingVacancyCard(
                        vacancy: state.vacancies[index],
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context,
    String label,
    int radius,
  ) {
    final isActive = _selectedRadius == radius;
    return GestureDetector(
      onTap: () => _onRadiusSelected(radius),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? context.colors.brandProgress
              : context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: context.textThemes.buttonMedium.copyWith(
            color: isActive ? context.colors.brandDefault : null,
          ),
        ),
      ),
    );
  }
}
