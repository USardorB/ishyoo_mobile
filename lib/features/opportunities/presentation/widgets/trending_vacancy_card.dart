import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/opportunities/presentation/bloc/vacancy_feed_bloc.dart';
import 'package:mobile/features/opportunities/presentation/widgets/apply_vacancy_sheet.dart';

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

  String _formatNumber(double n) {
    return n.truncateToDouble() == n ? n.toInt().toString() : n.toString();
  }

  String _formatSalary(double? from, double? to, String? currency) {
    if (from == null && to == null)
      return "opportunities.vacancyCard.negotiable".tr();
    final c = currency?.toUpperCase() ?? "UZS";
    if (from != null && to != null) {
      return "${_formatNumber(from)} - ${_formatNumber(to)} $c";
    }
    if (from != null) return "${_formatNumber(from)} $c";
    return "${_formatNumber(to!)} $c";
  }

  @override
  Widget build(BuildContext context) {
    final v = vacancy;
    final orgName = v?.organization?.name ?? "";
    final isHot = v?.isTemporary == true;
    final title = v?.jobTitle ?? "";

    final details = [
      v?.location ?? '',
      EmploymentType.fromServer(v?.jobType)?.localizedLabel ?? '',
      AppExperienceLevel.fromServer(v?.experienceLevel)?.localizedLabel ?? '',
    ].where((s) => s.isNotEmpty).join(' • ');

    return InkWell(
      onTap: () => context.pushRoute(VacancyDetailsRoute(id: v!.id)),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          orgName,
                          style: context.textThemes.c2.copyWith(
                            color: context.colors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (isHot)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.bgTertiary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "HOT",
                            style: context.textThemes.c3,
                          ),
                        ),
                    ],
                  ),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 20,
                    color: isLiked ? Colors.red : null,
                  ),
                  onPressed: () {
                    if (vacancy?.id != null) {
                      context.read<VacancyFeedBloc>().add(
                        ToggleSaveVacancyFeed(
                          id: vacancy!.id,
                          currentlySaved: isLiked,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
              mainAxisAlignment: .spaceBetween,
              spacing: 8,
              children: [
                Flexible(
                  child: FittedBox(
                    fit: .scaleDown,
                    child: Text(
                      _formatSalary(v?.salaryFrom, v?.salaryTo, v?.currency),
                      style: context.textThemes.s2,
                    ),
                  ),
                ),
                AppButton(
                  widthType: ButtonWidthType.shrink,
                  onTap: () {
                    if (v?.hasApplied == true) return;
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => ApplyVacancySheet(
                        onApply: (resumeId, coverLetter) {
                          if (v?.id != null) {
                            context.read<VacancyFeedBloc>().add(
                              ApplyToVacancyFeed(
                                id: v!.id,
                                resumeId: resumeId,
                                coverLetter: coverLetter,
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                  label: v?.hasApplied == true
                      ? "opportunities.alreadyApplied".tr()
                      : "opportunities.applyButton".tr(),
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
