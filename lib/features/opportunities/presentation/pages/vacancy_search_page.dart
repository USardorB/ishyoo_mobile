import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/presentation/bloc/vacancy_feed_bloc.dart';
import 'package:mobile/features/opportunities/presentation/widgets/trending_vacancy_card.dart';
import 'package:mobile/features/opportunities/presentation/widgets/vacancy_filter_sheet.dart';

@RoutePage()
class VacancySearchPage extends StatelessWidget implements AutoRouteWrapper {
  const VacancySearchPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<VacancyFeedBloc>()..add(const LoadVacancyFeed()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Builder(
          builder: (context) {
            final bloc = context.read<VacancyFeedBloc>();
            return TextField(
              autofocus: true,
              controller: TextEditingController(text: bloc.currentTitle),
              decoration: InputDecoration(
                hintText: "Mutaxassislik yoki kompaniya nomini kiriting",
                border: InputBorder.none,
                hintStyle: context.textThemes.b2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              style: context.textThemes.b1,
              onSubmitted: (value) {
                bloc.add(UpdateVacancyFeedSearch(title: value.isEmpty ? null : value));
              },
            );
          }
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.tune),
                onPressed: () {
                  final bloc = context.read<VacancyFeedBloc>();
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => VacancyFilterSheet(
                      initialJobType: bloc.currentJobType,
                      initialExperienceLevel: bloc.currentExperienceLevel,
                      initialSpecialization: bloc.currentSpecialization,
                      onApply: (jobType, experienceLevel, specialization) {
                        bloc.add(
                          UpdateVacancyFeedFilters(
                            jobType: jobType,
                            experienceLevel: experienceLevel,
                            specialization: specialization,
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          ),
        ],
      ),
      body: BlocBuilder<VacancyFeedBloc, VacancyFeedState>(
        builder: (context, state) {
          if (state is VacancyFeedLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is VacancyFeedError) {
            return Center(child: Text(state.message));
          }
          if (state is VacancyFeedLoaded) {
            if (state.vacancies.isEmpty) {
              return Center(
                child: Padding(
                  padding: .all(16),
                  child: Column(
                    mainAxisSize: .min,
                    children: [
                      Image.asset(
                        "assets/images/no_results.png",
                        width: 280,
                      ),
                      Text(
                        "Kiritilgan parametrlar bo'yicha bo'sh ish o'rni topilmadi",
                        textAlign: TextAlign.center,
                        style: context.textThemes.b1.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.vacancies.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return TrendingVacancyCard(vacancy: state.vacancies[index]);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
