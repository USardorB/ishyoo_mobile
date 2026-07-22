import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          title: Text('Qidiruv natijalari'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Padding(
              padding: .all(16),
              child: Row(
                children: [
                  Flexible(child: DarkGlassSearchField()),
                  SizedBox(width: 12),
                  IconButton(
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => TallentFilterSheet(),
                    ),
                    icon: Icon(Icons.tune),
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
              return const Center(
                child: Text("Hozircha rezyumelar topilmadi."),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.talents!.length + 1, // +1 for the header text
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Text(
                    'Topilgan rezyumelar: ${state.talents!.length}',
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
                      "https://ui-avatars.com/api/?name=Kandidat",
                    ),
                  ),
                  title: Text(
                    'Kandidat',
                    style: context.textThemes.b2,
                  ),
                  subtitle: Text(
                    resume.specialization ?? 'Mutaxassis',
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
                          "mos",
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
