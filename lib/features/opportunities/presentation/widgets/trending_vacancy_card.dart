import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/opportunities/presentation/widgets/apply_to_vacancy_sheet.dart';

class TrendingVacancyCard extends StatelessWidget {
  final bool isLiked;
  const TrendingVacancyCard({
    super.key,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushRoute(const VacancyDetailsRoute()),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Uzum Bank",
                  style: context.textThemes.c2.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const .symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: context.colors.bgTertiary,
                    borderRadius: .circular(4),
                  ),
                  child: Text(
                    "HOT",
                    style: context.textThemes.c3,
                  ),
                ),
                const Spacer(),
                Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : context.colors.textSecondary,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "UX/UI Dizayner",
              style: context.textThemes.s1,
            ),
            const SizedBox(height: 8),
            Text(
              "Toshkent • To'liq stavka • Tajriba 1-3 yil",
              style: context.textThemes.b1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 20,
                  color: context.colors.textSecondary,
                ),
                const SizedBox(width: 6),
                Text(
                  "Mar 31, 2024",
                  style: context.textThemes.b2.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              color: context.colors.lineSecondary,
              height: 1,
              thickness: .5,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "10–15 mln so'm",
                      style: context.textThemes.s2,
                    ),
                    Text(
                      "oyiga",
                      style: context.textThemes.c2.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                AppButton(
                  widthType: ButtonWidthType.shrink,
                  onTap: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const ApplyToVacancySheet(),
                  ),
                  label: "Javob qaytarish",
                  foregroundColor: context.colors.brandDefault,
                  color: context.colors.brandProgress,
                  labelStyle: context.textThemes.b3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
