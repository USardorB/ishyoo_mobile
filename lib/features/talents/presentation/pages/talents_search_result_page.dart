import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';
import 'package:mobile/features/talents/presentation/bloc/talents_bloc.dart';

@RoutePage()
class TalentsSearchResultPage extends StatefulWidget {
  final bool autoFocusSearch;
  final String? initialJobType;
  final String? initialExperienceLevel;
  final String? initialSpecialization;

  const TalentsSearchResultPage({
    super.key,
    this.autoFocusSearch = true,
    this.initialJobType,
    this.initialExperienceLevel,
    this.initialSpecialization,
  });

  @override
  State<TalentsSearchResultPage> createState() =>
      _TalentsSearchResultPageState();
}

class _TalentsSearchResultPageState extends State<TalentsSearchResultPage> {
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
      _loadTalents(innerContext);
    });
  }

  void _loadTalents(BuildContext context) {
    context.read<TalentsBloc>().add(
          LoadTalents(
            query: _searchController.text.isNotEmpty ? _searchController.text : null,
            jobType: _jobType,
            experienceLevel: _experienceLevel,
            specialization: _specialization,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TalentsBloc>()..add(LoadTalents()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 64,
              title: const Text('talents.search_results').tr(),
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
                          onSubmitted: (_) => _loadTalents(context),
                        ),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => TallentFilterSheet(
                            initialJobType: _jobType,
                            initialExperienceLevel: _experienceLevel,
                            initialSpecialization: _specialization,
                            onApply: (jobType, experienceLevel, specialization) {
                              _jobType = jobType;
                              _experienceLevel = experienceLevel;
                              _specialization = specialization;
                              _loadTalents(context);
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
        body: BlocBuilder<TalentsBloc, TalentsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.error != null) {
              return Center(child: Text(state.error!));
            } else if (state.talents == null || state.talents!.isEmpty) {
              return Center(
                child: const Text("talents.no_resumes_found").tr(),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.talents!.length + 1,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Text(
                    'talents.results_count'.tr(args: [state.talents!.length.toString()]),
                    style: context.textThemes.s2,
                  );
                }

                final resume = state.talents![index - 1];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tileColor: context.colors.bgPrimary,
                  minTileHeight: 64,
                  leading: CircleAvatar(
                    foregroundImage: CachedNetworkImageProvider(
                      resume.profile?.avatarUrl ??
                          "https://ui-avatars.com/api/?name=${resume.profile?.name ?? 'Kandidat'}",
                    ),
                  ),
                  title: Text(
                    resume.profile?.name ?? 'nav.candidates'.tr(),
                    style: context.textThemes.b2,
                  ),
                  subtitle: Text(
                    resume.specialization ?? 'nav.candidates'.tr(),
                    style: context.textThemes.b3.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.colors.brandProgress,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '100%',
                          style: context.textThemes.b3.copyWith(
                            color: context.colors.brandDefault,
                          ),
                        ),
                        Text(
                          "opportunities.matches_filter".tr(),
                          style: context.textThemes.c1.copyWith(
                            color: context.colors.brandDefault,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
    }),
    );
  }
}
