import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/applicants/data/models/applicant.dart';
import 'package:mobile/features/applicants/presentation/widgets/new_applicant_action_buttons.dart';
import 'package:mobile/features/resume/data/models/resume.dart';

class ApplicantListingItem extends StatelessWidget {
  final Applicant applicant;

  const ApplicantListingItem({
    super.key,
    required this.applicant,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return 'shared.present'.tr();
    try {
      final year = date.year.toString();
      final month = date.month.toString();
      return '$year-$month';
    } catch (e) {
      return '${date.year}';
    }
  }

  String _formatDuration(DateTime? start, DateTime? end) {
    if (start == null) return '';
    final endDate = end ?? DateTime.now();
    if (endDate.isBefore(start)) return '';
    final days = endDate.difference(start).inDays;
    final years = days ~/ 365;
    final remainingMonths = (days % 365) ~/ 30;

    if (years > 0 && remainingMonths > 0) {
      return 'applicants.experience_years'.tr(args: [years.toString()]);
    } else if (years > 0) {
      return 'applicants.experience_years'.tr(args: [years.toString()]);
    } else if (remainingMonths > 0) {
      return '$remainingMonths m';
    } else {
      return '1 m';
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalExperienceDays = 0;
    if (applicant.experiences != null) {
      for (final exp in applicant.experiences!) {
        if (exp.startDate != null) {
          final end = exp.endDate ?? DateTime.now();
          if (end.isAfter(exp.startDate!)) {
            totalExperienceDays += end.difference(exp.startDate!).inDays;
          }
        }
      }
    }

    String experienceText;
    if (totalExperienceDays == 0) {
      experienceText = "shared.no_data".tr();
    } else {
      final years = totalExperienceDays ~/ 365;
      experienceText = "applicants.experience_years".tr(
        args: [years.toString()],
      );
    }

    ResumeExperience? latestExp;
    if (applicant.experiences != null && applicant.experiences!.isNotEmpty) {
      final sortedExperiences = List.of(applicant.experiences!);
      final currentJobs = sortedExperiences
          .where((e) => e.endDate == null)
          .toList();
      if (currentJobs.isNotEmpty) {
        currentJobs.sort((a, b) {
          final aDate = a.startDate ?? DateTime.now();
          final bDate = b.startDate ?? DateTime.now();
          return bDate.compareTo(aDate);
        });
        latestExp = currentJobs.first;
      } else {
        sortedExperiences.sort((a, b) {
          final aDate = a.endDate ?? a.startDate ?? DateTime.now();
          final bDate = b.endDate ?? b.startDate ?? DateTime.now();
          return bDate.compareTo(aDate);
        });
        latestExp = sortedExperiences.first;
      }
    }
    final vacancyId = applicant.vacancyId ?? '';
    return InkWell(
      onTap: () {
        context.pushRoute(
          ApplicantDetailsRoute(
            vacancyId: applicant.vacancyId ?? vacancyId,
            applicantResumeId: applicant.id,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: context.colors.bgPrimary,
          border: Border.all(
            color: context.colors.brandDefault,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      applicant.specialization ?? '',
                      style: context.textThemes.s1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      applicant.user?.name ?? applicant.profile?.name ?? '',
                      style: context.textThemes.b2,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      applicant.expectedSalary != null
                          ? '${applicant.expectedSalary} ${applicant.currency ?? 'UZS'}'
                          : 'shared.all'.tr(),
                      style: context.textThemes.s3,
                    ),
                  ],
                ),
                Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colors.bgSecondary,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        applicant.profile?.avatarUrl ?? '',
                      ),
                      onError: (_, _) {
                        return;
                      },
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    color: context.colors.textPrimary,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'profile.experience',
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ).tr(),
            const SizedBox(height: 6),
            Text(
              experienceText,
              style: context.textThemes.b2,
            ),
            const SizedBox(height: 12),
            Text(
              'resume.workplace',
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ).tr(),
            const SizedBox(height: 6),
            if (latestExp != null) ...[
              Text(
                latestExp.companyName,
                style: context.textThemes.b2,
              ),
              const SizedBox(height: 3),
              Text(
                '${latestExp.position} • ${_formatDuration(latestExp.startDate, latestExp.endDate)}',
                style: context.textThemes.b2,
              ),
              const SizedBox(height: 3),
              Text(
                '(${_formatDate(latestExp.startDate)} - ${_formatDate(latestExp.endDate)})',
                style: context.textThemes.b2,
              ),
            ] else
              Text(
                "-",
                style: context.textThemes.b2,
              ),
            const SizedBox(height: 16),
            NewApplicantActionButtons(
              vacancyId: applicant.vacancyId ?? vacancyId,
              applicantId: applicant.id,
            ),
          ],
        ),
      ),
    );
  }
}
