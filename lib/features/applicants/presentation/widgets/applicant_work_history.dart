import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ApplicantWorkHistory extends StatelessWidget {
  const ApplicantWorkHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          'Ish tajribasi: 3 yil 6 oy',
          style: context.textThemes.s2,
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: .all(12),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              _buildVacancy(
                context,
                title: 'UX/UI Dizayner',
                company: 'Click',
                duration: '2023 yil yanvar — hozir',
                isCurrent: true,
              ),
              Divider(
                height: 13,
                color: context.colors.lineSecondary,
              ),
              _buildVacancy(
                context,
                title: 'UX/UI Dizayner',
                company: 'Payme',
                duration: '2022 yil yanvar — 2023 yil yanvar',
                isCurrent: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildVacancy(
    BuildContext context, {
    required String title,
    required String company,
    required String duration,
    required bool isCurrent,
  }) {
    return Row(
      spacing: 12,
      children: [
        // if (isCurrent)
        CircleAvatar(
          radius: 8.5,
          backgroundColor: isCurrent
              ? context.colors.brandProgress
              : context.colors.bgSecondary,
          child: Icon(
            Icons.circle,
            size: 12,
            color: isCurrent
                ? context.colors.brandDefault
                : context.colors.bgSecondary,
          ),
        ),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              title,
              style: context.textThemes.s2,
            ),
            SizedBox(height: 4),
            Text(
              company,
              style: context.textThemes.b1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 6),
            Text(
              duration,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
