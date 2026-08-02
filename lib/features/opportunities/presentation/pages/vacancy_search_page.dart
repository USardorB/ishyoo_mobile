import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/presentation/bloc/vacancy_feed_bloc.dart';
import 'package:mobile/features/opportunities/presentation/widgets/trending_vacancy_card.dart';
import 'package:mobile/features/opportunities/presentation/widgets/vacancy_filter_sheet.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';

@RoutePage()
class VacancySearchPage extends StatefulWidget {
  final bool autoFocusSearch;
  final String? initialJobType;
  final String? initialExperienceLevel;
  final String? initialSpecialization;

  const VacancySearchPage({
    super.key,
    this.autoFocusSearch = true,
    this.initialJobType,
    this.initialExperienceLevel,
    this.initialSpecialization,
  });

  @override
  State<VacancySearchPage> createState() => _VacancySearchPageState();
}

class _VacancySearchPageState extends State<VacancySearchPage> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  String? _jobType;
  String? _experienceLevel;
  String? _specialization;

  @override
  void initState() {
    super.initState();
    _jobType = widget.initialJobType;
    _experienceLevel = widget.initialExperienceLevel;
    _specialization = widget.initialSpecialization;
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query, BuildContext innerContext) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _loadVacancies(innerContext);
    });
  }

  void _loadVacancies(BuildContext context) {
    context.read<VacancyFeedBloc>().add(
          UpdateVacancyFeedFilters(
            jobType: _jobType,
            experienceLevel: _experienceLevel,
            specialization: _specialization,
          ),
        );
    context.read<VacancyFeedBloc>().add(
          UpdateVacancyFeedSearch(
            title: _searchController.text.isNotEmpty ? _searchController.text : null,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<VacancyFeedBloc>()..add(
        LoadVacancyFeed(
          title: _searchController.text.isNotEmpty ? _searchController.text : null,
          jobType: _jobType,
          experienceLevel: _experienceLevel,
          specialization: _specialization,
        ),
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 64,
              title: const Text('opportunities.searchResults').tr(),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Flexible(
                        child: DarkGlassSearchField(
                          controller: _searchController,
                          autoFocus: widget.autoFocusSearch,
                          onChanged: (query) => _onSearchChanged(query, context),
                          onSubmitted: (_) => _loadVacancies(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => VacancyFilterSheet(
                            initialJobType: _jobType,
                            initialExperienceLevel: _experienceLevel,
                            initialSpecialization: _specialization,
                            onApply: (jobType, experienceLevel, specialization) {
                              _jobType = jobType;
                              _experienceLevel = experienceLevel;
                              _specialization = specialization;
                              _loadVacancies(context);
                            },
                          ),
                        ),
                        icon: const Icon(Icons.tune),
                      ),
                    ],
                  ),
                ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/no_results.png",
                              width: 280,
                            ),
                            Text(
                              "opportunities.search.empty",
                              textAlign: TextAlign.center,
                              style: context.textThemes.b1.copyWith(
                                color: context.colors.textSecondary,
                              ),
                            ).tr(),
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
      ),
    );
  }
}
