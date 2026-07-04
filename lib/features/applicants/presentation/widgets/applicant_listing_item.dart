import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/applicants/presentation/widgets/new_applicant_action_buttons.dart';

class ApplicantListingItem extends StatelessWidget {
  const ApplicantListingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(ApplicantDetailsRoute());
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
                      'UX/UI Dizayner',
                      style: context.textThemes.s1,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fozilov Muzaffar • 29 yosh • Toshkent',
                      style: context.textThemes.b2,
                    ),
                    SizedBox(height: 8),
                    Text(
                      '20 000 000 UZS',
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
              '7 yil 6 oy',
              style: context.textThemes.b2,
            ),
            SizedBox(height: 16),
            Text(
              'O‘xshash lavozimlarda tajriba',
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '7 yil 6 oy',
              style: context.textThemes.b2.copyWith(
                color: context.colors.brandDefault,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'O‘xshash lavozimlarda tajriba',
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 6),
            Text(
              '''Flexobo corp.
    UX/UI dizayner • 1 yil 1 oy
    (2025-yil may - 2026-yil may)''',
              style: context.textThemes.b2,
            ),
            SizedBox(height: 16),
            NewApplicantActionButtons(),
          ],
        ),
      ),
    );
  }
}
