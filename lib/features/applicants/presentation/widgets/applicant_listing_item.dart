import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    if (date == null) return 'Hozirgacha';
    try {
      final year = date.year.toString();
      const months = [
        'yanvar',
        'fevral',
        'mart',
        'aprel',
        'may',
        'iyun',
        'iyul',
        'avgust',
        'sentabr',
        'oktabr',
        'noyabr',
        'dekabr',
      ];
      final month = months[date.month - 1];
      return '$year-yil $month';
    } catch (e) {
      return '${date.year}-yil';
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
      return '$years yil $remainingMonths oy';
    } else if (years > 0) {
      return '$years yil';
    } else if (remainingMonths > 0) {
      return '$remainingMonths oy';
    } else {
      return '1 oydan kam';
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
      experienceText = "Tajriba yo'q";
    } else if (totalExperienceDays < 365) {
      experienceText = "1 yildan kam";
    } else {
      final years = totalExperienceDays ~/ 365;
      final remainingMonths = (totalExperienceDays % 365) ~/ 30;
      if (remainingMonths > 0) {
        experienceText = "$years yil, $remainingMonths oy";
      } else {
        experienceText = "$years yil";
      }
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
        // if (applicant.resumeId == null) {
        //   AppNotificationOverlay.instance.show(
        //     message: 'Nomzodning rezyumesini olishda xatolik yuz berdi',
        //     type: AppNotificationType.error,
        //   );
        //   return;
        // }
        context.pushRoute(
          ApplicantDetailsRoute(
            vacancyId: applicant.vacancyId ?? vacancyId,
            applicantResumeId: applicant.id,
          ),
        );
      },
      child: Container(
        padding: .all(18),
        decoration: BoxDecoration(
          borderRadius: .circular(12),
          color: context.colors.bgPrimary,
          border: Border.all(
            color: context.colors.brandDefault,
          ),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Bugun onlayn edi',
                      style: context.textThemes.c2.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      applicant.specialization ?? 'Lavozim kiritilmagan',
                      style: context.textThemes.s1,
                    ),
                    SizedBox(height: 8),
                    Text(
                      applicant.user?.name ?? applicant.profile?.name ?? '',
                      style: context.textThemes.b2,
                    ),
                    SizedBox(height: 8),
                    Text(
                      applicant.expectedSalary != null
                          ? '${applicant.expectedSalary} ${applicant.currency ?? 'UZS'}'
                          : 'Kelishilgan',
                      style: context.textThemes.s3,
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: .symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.colors.dangerLight.withAlpha(
                          180,
                        ),
                      ),
                      child: Text(
                        "17 kun javob kutmoqda",
                        style: context.textThemes.c2.copyWith(
                          color: context.colors.danger,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: .symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.colors.successLight.withAlpha(180),
                      ),
                      child: Text(
                        "Faol ish qidirmoqda",
                        style: context.textThemes.c2.copyWith(
                          color: context.colors.success,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 56,
                  height: 56,
                  padding: .all(8),
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
            SizedBox(height: 12),
            Text(
              'Ish tajribasi',
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 6),
            Text(
              experienceText,
              style: context.textThemes.b2,
            ),
            SizedBox(height: 12),
            Text(
              'Oxirgi ish joyi',
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 6),
            if (latestExp != null) ...[
              Text(
                latestExp.companyName,
                style: context.textThemes.b2,
              ),
              SizedBox(height: 3),
              Text(
                '${latestExp.position} • ${_formatDuration(latestExp.startDate, latestExp.endDate)}',
                style: context.textThemes.b2,
              ),
              SizedBox(height: 3),
              Text(
                '(${_formatDate(latestExp.startDate)} - ${_formatDate(latestExp.endDate)})',
                style: context.textThemes.b2,
              ),
            ] else
              Text(
                "-",
                style: context.textThemes.b2,
              ),
            SizedBox(height: 16),
            // if (true)
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
