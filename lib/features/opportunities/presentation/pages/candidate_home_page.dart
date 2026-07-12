import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/opportunities/presentation/widgets/candidate_home_banner.dart';
import 'package:mobile/features/opportunities/presentation/widgets/candidate_quick_access_cards.dart';
import 'package:mobile/features/opportunities/presentation/widgets/trending_vacancy_card.dart';
import 'package:mobile/features/postings/presentation/widgets/dark_glass_search_field.dart';
import 'package:mobile/features/postings/presentation/widgets/tallent_filter_sheet.dart';

@RoutePage()
class CandidateHomePage extends StatelessWidget {
  const CandidateHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 20,
        title: Padding(
          padding: .only(left: 6),
          child: SvgPicture.asset(AppAssets.ishYoo, height: 24),
        ),
        centerTitle: false,
        actions: [
          IconButton.filled(
            onPressed: () {},
            icon: Icon(Icons.headset_mic_outlined),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgSecondary,
            ),
          ),
          IconButton.filled(
            onPressed: () => context.pushRoute(NotificationsRoute()),
            icon: Icon(Icons.notifications_none_outlined),
            style: IconButton.styleFrom(
              backgroundColor: context.colors.bgSecondary,
            ),
          ),
        ],
        actionsPadding: .only(right: 16),
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
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: index == 3 ? 10 : 6,
                  height: index == 3 ? 10 : 6,
                  decoration: BoxDecoration(
                    color: index == 3
                        ? context.colors.brandDefault
                        : context.colors.bgTertiary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const CandidateQuickAccessCards(),
            const SizedBox(height: 32),
            Text(
              "Trenddagi e'lonlar",
              style: context.textThemes.s2,
            ),
            const SizedBox(height: 16),
            const TrendingVacancyCard(isLiked: true),
            const TrendingVacancyCard(),
          ],
        ),
      ),
    );
  }
}
