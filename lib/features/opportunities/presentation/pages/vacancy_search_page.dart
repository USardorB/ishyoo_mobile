import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/presentation/bloc/vacancy_feed_bloc.dart';
import 'package:mobile/features/opportunities/presentation/widgets/trending_vacancy_card.dart';

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
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Mutaxassislik yoki kompaniya nomini kiriting",
            border: InputBorder.none,
            hintStyle: context.textThemes.b2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          style: context.textThemes.b1,
          onSubmitted: (value) {
            context.read<VacancyFeedBloc>().add(LoadVacancyFeed(title: value));
          },
        ),
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
                child: Text(
                  "Hech narsa topilmadi",
                  style: context.textThemes.b1.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.vacancies.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
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
