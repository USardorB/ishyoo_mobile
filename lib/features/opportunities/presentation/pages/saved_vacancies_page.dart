import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/presentation/bloc/saved_vacancies_bloc.dart';
import 'package:mobile/features/opportunities/presentation/widgets/trending_vacancy_card.dart';

@RoutePage()
class SavedVacanciesPage extends StatefulWidget implements AutoRouteWrapper {
  const SavedVacanciesPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SavedVacanciesBloc>()..add(LoadSavedVacancies()),
      child: this,
    );
  }

  @override
  State<SavedVacanciesPage> createState() => _SavedVacanciesPageState();
}

class _SavedVacanciesPageState extends State<SavedVacanciesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("opportunities.saved_vacancies").tr(),
      ),
      body: Column(
        children: [
          BlocBuilder<SavedVacanciesBloc, SavedVacanciesState>(
            builder: (context, state) {
              int count = 0;
              if (state is SavedVacanciesLoaded) {
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
                      'opportunities.resultsCount'.tr(args: [count.toString()]),
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
            child: BlocBuilder<SavedVacanciesBloc, SavedVacanciesState>(
              builder: (context, state) {
                if (state is SavedVacanciesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SavedVacanciesError) {
                  return Center(child: Text(state.message));
                } else if (state is SavedVacanciesLoaded) {
                  if (state.vacancies.isEmpty) {
                    return Center(
                      child: Text(
                        "shared.no_data",
                        style: TextStyle(color: context.colors.textSecondary),
                      ).tr(),
                    );
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
}
