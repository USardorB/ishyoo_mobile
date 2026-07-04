import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ApplicantContacts extends StatelessWidget {
  const ApplicantContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          'Kontaktlar',
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
              Text(
                'Telefon raqami',
                style: context.textThemes.b1.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '+998 88 545 55 55',
                style: context.textThemes.s2,
              ),
              Divider(
                height: 13,
                color: context.colors.lineSecondary,
              ),
              Text(
                'Elektron pochta',
                style: context.textThemes.b1.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'mkomilovv55@gmai.com',
                style: context.textThemes.s2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
