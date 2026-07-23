import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/configs/di/configure_dependencies.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/opportunities/presentation/bloc/vacancy_feed_bloc.dart';
import 'package:mobile/features/opportunities/presentation/widgets/candidate_home_banner.dart';
import 'package:mobile/features/opportunities/presentation/widgets/candidate_quick_access_cards.dart';
import 'package:mobile/features/opportunities/presentation/widgets/trending_vacancy_card.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';

@RoutePage()
class CandidateHomePage extends StatelessWidget implements AutoRouteWrapper {
  const CandidateHomePage({super.key});

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
        toolbarHeight: kToolbarHeight + 20,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: SvgPicture.asset(AppAssets.ishYoo, height: 24),
        ),
        centerTitle: false,
        actions: [
          IconButton.filled(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Xizmat tez orada qo'shiladi")),
              );
            },
            icon: const Icon(Icons.headset_mic_outlined),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgSecondary,
            ),
          ),
          IconButton.filled(
            onPressed: () => context.pushRoute(const NotificationsRoute()),
            icon: const Icon(Icons.notifications_none_outlined),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgSecondary,
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.only(right: 16),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Flexible(
                  child: DarkGlassSearchField(
                    onTap: () {
                      context.pushRoute(const VacancySearchRoute());
                    },
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => TallentFilterSheet(
                      onApply: (jobType, experienceLevel, specialization) {
                        context.read<VacancyFeedBloc>().add(
                          LoadVacancyFeed(
                            jobType: jobType,
                            experienceLevel: experienceLevel,
                            specialization: specialization,
                          ),
                        );
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
            .copyWith(
              bottom:
                  MediaQuery.paddingOf(context).bottom +
                  kBottomNavigationBarHeight,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CandidateHomeBanner(),
            const SizedBox(height: 24),
            const CandidateQuickAccessCards(),
            const SizedBox(height: 32),
            Text(
              "Trenddagi e'lonlar",
              style: context.textThemes.s2,
            ),
            const SizedBox(height: 16),
            BlocBuilder<VacancyFeedBloc, VacancyFeedState>(
              builder: (context, state) {
                if (state is VacancyFeedLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is VacancyFeedError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: TextStyle(color: context.colors.textSecondary),
                    ),
                  );
                } else if (state is VacancyFeedLoaded) {
                  if (state.vacancies.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisSize: .min,
                        children: [
                          Image.asset("assets/images/no_results.png"),
                          Text(
                            "Hozircha e’lonlar yo‘q. Sizga mos ish e’lonlari tez orada shu yerda paydo bo‘ladi.",
                            textAlign: .center,
                            style: context.textThemes.b1.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Column(
                    children: state.vacancies
                        .map(
                          (vacancy) => TrendingVacancyCard(
                            vacancy: vacancy,
                            isLiked: vacancy.hasSaved ?? false,
                          ),
                        )
                        .toList(),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
