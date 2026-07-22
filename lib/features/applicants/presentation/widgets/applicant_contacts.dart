import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applicants/data/models/applicant.dart';

class ApplicantContacts extends StatelessWidget {
  final Applicant? applicant;
  const ApplicantContacts({super.key, this.applicant});

  @override
  Widget build(BuildContext context) {
    final phone = applicant?.user?.phoneNumber;
    final email = applicant?.user?.email;

    if (phone == null && email == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Kontaktlar', style: context.textThemes.s2),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (phone != null) ...[
                Text(
                  'Telefon raqami',
                  style: context.textThemes.b1.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(phone, style: context.textThemes.s2),
              ],
              if (phone != null && email != null)
                Divider(height: 24, color: context.colors.lineSecondary),
              if (email != null) ...[
                Text(
                  'Elektron pochta',
                  style: context.textThemes.b1.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(email, style: context.textThemes.s2),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
