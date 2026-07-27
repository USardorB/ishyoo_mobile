import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applicants/data/models/applicant.dart';

class ApplicantAvatarInfo extends StatelessWidget {
  final Applicant? applicant;
  const ApplicantAvatarInfo({super.key, this.applicant});

  @override
  Widget build(BuildContext context) {
    final name =
        applicant?.user?.name ?? applicant?.profile?.name ?? 'Noma\'lum';
    final workFormats = [
      ...(applicant?.employmentType ?? []),
      ...(applicant?.workFormat ?? []),
    ].join(' • ');

    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.colors.bgSecondary,
          ),
          child: const Icon(Icons.person, size: 40),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: context.textThemes.s1,
        ),
        const SizedBox(height: 6),
        if (workFormats.isNotEmpty)
          Text(
            workFormats,
            style: context.textThemes.b2.copyWith(
              color: context.colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        if (applicant?.specialization != null) ...[
          const SizedBox(height: 4),
          Text(
            applicant!.specialization!,
            style: context.textThemes.b2.copyWith(
              color: context.colors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
