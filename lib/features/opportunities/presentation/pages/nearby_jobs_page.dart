import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/opportunities/presentation/widgets/trending_vacancy_card.dart';

@RoutePage()
class NearbyJobsPage extends StatelessWidget {
  const NearbyJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yaqinlikdagi ish"),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: .horizontal,
            padding: const .symmetric(horizontal: 16, vertical: 12),
            child: Row(
              spacing: 8,
              children: [
                _buildChip(context, "Yaqin (3 km)", isActive: true),
                _buildChip(context, "Yaqin (5 km)"),
                _buildChip(context, "Yaqin (8 km)"),
                _buildChip(context, "Yaqin (10 km)"),
              ],
            ),
          ),

          Padding(
            padding: const .symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "85 ta ish topildi",
                  style: context.textThemes.s2,
                ),
                Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  label: Text("Mos ravishda"),
                  style: TextButton.styleFrom(
                    textStyle: context.textThemes.buttonLarge,
                    visualDensity: .compact,
                    iconAlignment: .end,
                    padding: .symmetric(horizontal: 8),
                  ),
                  icon: Icon(Icons.swap_vert, size: 20),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Vacancy List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                bottom: MediaQuery.paddingOf(context).bottom + 16,
              ),
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return TrendingVacancyCard(isLiked: index == 0);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    BuildContext context,
    String label, {
    bool isActive = false,
  }) {
    return Container(
      padding: const .symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive
            ? context.colors.brandProgress
            : context.colors.bgPrimary,
        borderRadius: .circular(20),
      ),
      child: Text(
        label,
        style: context.textThemes.buttonMedium.copyWith(
          color: isActive ? context.colors.brandDefault : null,
        ),
      ),
    );
  }
}
