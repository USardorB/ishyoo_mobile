import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/applicants/data/models/applicant.dart';

class ApplicantContacts extends StatelessWidget {
  final Applicant? applicant;
  const ApplicantContacts({super.key, this.applicant});

  @override
  Widget build(BuildContext context) {
    final phone = applicant?.profile?.phoneNumber;
    final email = applicant?.profile?.email;

    if (phone == null && email == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text('Kontaktlar', style: context.textThemes.s2),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: .circular(16),
          ),
          padding: const .all(12),
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
                Divider(
                  height: 25,
                  color: context.colors.lineSecondary,
                  thickness: .5,
                ),
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
