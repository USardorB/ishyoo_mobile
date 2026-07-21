import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/opportunities/presentation/widgets/apply_to_vacancy_sheet.dart';
import '../../data/models/vacancy.dart';

class TrendingVacancyCard extends StatelessWidget {
  final Vacancy? vacancy;
  final bool isLiked;
  const TrendingVacancyCard({
    super.key,
    this.vacancy,
    this.isLiked = false,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return "N/A";
    return DateFormat("MMM dd, yyyy").format(date);
  }

  String _formatSalary(double? from, double? to, String? currency) {
    if (from == null && to == null) return "Kelishuv asosida";
    final c = currency?.toUpperCase() ?? "UZS";
    if (from != null && to != null) {
      return "$from - $to $c";
    }
    if (from != null) return "dan $from $c";
    return "gacha $to $c";
  }

  @override
  Widget build(BuildContext context) {
    final v = vacancy;
    final orgName = v?.organization?.name ?? "Uzum Bank";
    final isHot = v?.isTemporary == true;
    final title = v?.jobTitle ?? "UX/UI Dizayner";
    
    final details = [
      v?.location ?? "Toshkent",
      v?.jobType?.replaceAll('_', ' ') ?? "To'liq stavka",
      v?.experienceLevel?.replaceAll('_', ' ') ?? "Tajriba 1-3 yil",
    ].join(" • ");

    return InkWell(
      onTap: () {
        if (v?.id != null) context.pushRoute(VacancyDetailsRoute(id: v!.id));
      },
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
                  orgName,
                  style: context.textThemes.c2.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(width: 8),
                if (isHot)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: context.colors.bgTertiary,
                      borderRadius: BorderRadius.circular(4),
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
              title,
              style: context.textThemes.s1,
            ),
            const SizedBox(height: 8),
            Text(
              details,
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
                  _formatDate(v?.publishedAt ?? v?.createdAt),
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
                      _formatSalary(v?.salaryFrom, v?.salaryTo, v?.currency),
                      style: context.textThemes.s2,
                    ),
                    if (v?.salaryFrom != null || v?.salaryTo != null)
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
