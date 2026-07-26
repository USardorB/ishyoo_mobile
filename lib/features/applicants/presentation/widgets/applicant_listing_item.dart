import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/applicants/data/models/applicant.dart';
import 'package:mobile/features/applicants/presentation/widgets/new_applicant_action_buttons.dart';

class ApplicantListingItem extends StatelessWidget {
  final Applicant applicant;
  final String vacancyId;

  const ApplicantListingItem({
    super.key,
    required this.applicant,
    required this.vacancyId,
  });

  @override
  Widget build(BuildContext context) {
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
                      '${applicant.user?.name ?? ''} • ${applicant.user?.email ?? 'Noma\'lum'}',
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
                Icon(Icons.person),
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
              applicant.applicationStatus ?? 'Noma\'lum',
              style: context.textThemes.b2,
            ),
            SizedBox(height: 16),
            if (applicant.applicationStatus == 'applied')
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
