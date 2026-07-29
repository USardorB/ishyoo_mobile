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
class TalentsSearchResultPage extends StatelessWidget {
  const TalentsSearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TalentsBloc>()..add(LoadTalents()),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 64,
          title: const Text('talents.search_results').tr(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Flexible(child: DarkGlassSearchField()),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => const TallentFilterSheet(),
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
                  leading: const CircleAvatar(
                    foregroundImage: CachedNetworkImageProvider(
                      "https://ui-avatars.com/api/?name=Kandidat",
                    ),
                  ),
                  title: Text(
                    'nav.candidates'.tr(),
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
      ),
    );
  }
}
