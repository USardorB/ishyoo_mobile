import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/app_enums.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/opportunities/data/models/vacancy.dart';
import 'package:mobile/features/postings/presentation/bloc/postings_bloc.dart';
import 'package:mobile/features/postings/presentation/widgets/posting_actions_sheet.dart';

class HrVacancyCard extends StatelessWidget {
  final Vacancy vacancy;

  /// When false, the three-dot menu button is hidden — useful when the
  /// [PostingsBloc] is not in scope (e.g. profile page preview).
  final bool showActions;

  const HrVacancyCard({
    super.key,
    required this.vacancy,
    this.showActions = true,
  });

  @override
  Widget build(BuildContext context) {
    final viewsCount = vacancy.metadata?['views_count'] as int? ?? 0;
    final newResponses =
        vacancy.metadata?['new_applications_count'] as int? ?? 0;
    final totalResponses = vacancy.totalApplicationsCount;

    return Material(
      color: context.colors.bgPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => context.pushRoute(HrVacancyDetailsRoute(id: vacancy.id)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 8, 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Tags row + more-actions ──────────────────────────────────
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 34,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 6,
                          children: [
                            if (vacancy.location != null &&
                                vacancy.location!.isNotEmpty)
                              _buildTag(context, vacancy.location!),
                            if (vacancy.jobType != null &&
                                vacancy.jobType!.isNotEmpty)
                              _buildTag(
                                context,
                                EmploymentType.fromServer(
                                      vacancy.jobType,
                                    )?.localizedLabel ??
                                    vacancy.jobType!,
                              ),
                            if (vacancy.experienceLevel != null &&
                                vacancy.experienceLevel!.isNotEmpty)
                              _buildTag(
                                context,
                                AppExperienceLevel.fromServer(
                                      vacancy.experienceLevel,
                                    )?.localizedLabel ??
                                    vacancy.experienceLevel!,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (showActions) ...[
                    const SizedBox(width: 4),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {
                        final bloc = context.read<PostingsBloc>();
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => BlocProvider.value(
                            value: bloc,
                            child: PostingActionsSheet(vacancy: vacancy),
                          ),
                        );
                      },
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 10),

              // ── Job title ────────────────────────────────────────────────
              Text(
                vacancy.jobTitle,
                style: context.textThemes.s1,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Divider(
                height: 25,
                thickness: .5,
                color: context.colors.lineSecondary,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _buildSalary(context)),
                  if (vacancy.createdAt != null) ...[
                    const SizedBox(width: 12),
                    _buildDate(context),
                  ],
                ],
              ),
              const SizedBox(height: 24),
              _buildAnalyticsRow(
                context,
                viewsCount: viewsCount,
                newResponses: newResponses,
                totalResponses: totalResponses,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSalary(BuildContext context) {
    final fmt = NumberFormat('#,###', 'en_US');
    final currency =
        AppCurrency.fromServer(vacancy.currency)?.displayCode ??
        vacancy.currency ??
        "so'm";

    if (vacancy.salaryFrom != null && vacancy.salaryTo != null) {
      return Text(
        '${fmt.format(vacancy.salaryFrom!.toInt())}–${fmt.format(vacancy.salaryTo!.toInt())} $currency',
        style: context.textThemes.s2.copyWith(
          color: context.colors.brandDefault,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    } else if (vacancy.salaryFrom != null) {
      return Text(
        '${fmt.format(vacancy.salaryFrom!.toInt())} $currency',
        style: context.textThemes.s2.copyWith(
          color: context.colors.brandDefault,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Text(
        'postings.no_salary_specified',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textThemes.s2.copyWith(
          color: context.colors.brandProgress,
        ),
      ).tr();
    }
  }

  Widget _buildDate(BuildContext context) {
    final d = vacancy.createdAt!;
    final label = DateFormat('MMM d, yyyy').format(d);
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        Icon(
          Icons.calendar_month_outlined,
          size: 18,
          color: context.colors.textSecondary,
        ),
        Text(
          label,
          style: context.textThemes.b2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildAnalyticsRow(
    BuildContext context, {
    required int viewsCount,
    required int newResponses,
    required int totalResponses,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildAnalyticsStat(
              context,
              icon: Icons.remove_red_eye_outlined,
              iconColor: context.colors.textSecondary,
              count: viewsCount,
              label: 'applicants.view_count',
              countColor: context.colors.textPrimary,
            ),
            VerticalDivider(
              thickness: .5,
              width: 1,
              color: context.colors.bgTertiary,
            ),
            _buildAnalyticsStat(
              context,
              icon: Icons.people_alt_outlined,
              iconColor: context.colors.brandDefault,
              count: newResponses > 0 ? newResponses : totalResponses,
              label: 'applicants.invited',
              countColor: newResponses > 0
                  ? context.colors.brandDefault
                  : context.colors.textPrimary,
              prefix: newResponses > 0 ? 'new' : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsStat(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required int count,
    required String label,
    required Color countColor,
    String? prefix,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Icon(icon, color: iconColor, size: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  if (prefix != null)
                    TextSpan(
                      text: '$count ',
                      style: context.textThemes.buttonGiant.copyWith(
                        color: countColor,
                      ),
                    )
                  else
                    TextSpan(
                      text: '$count',
                      style: context.textThemes.buttonGiant.copyWith(
                        color: countColor,
                      ),
                    ),
                  if (prefix != null)
                    TextSpan(
                      text: prefix,
                      style: context.textThemes.buttonGiant.copyWith(
                        color: countColor,
                      ),
                    ),
                ],
              ),
            ),
            Text(
              label,
              style: context.textThemes.buttonMedium.copyWith(
                color: context.colors.textSecondary,
              ),
            ).tr(),
          ],
        ),
      ],
    );
  }

  Widget _buildTag(BuildContext context, String text) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: context.colors.bgSecondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(text, style: context.textThemes.b3),
      ),
    );
  }
}
