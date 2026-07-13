import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ResumeEducationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;

  const ResumeEducationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textThemes.s1),
        const SizedBox(height: 4),
        Text(subtitle, style: context.textThemes.b2.copyWith(color: context.colors.textSecondary)),
        const SizedBox(height: 2),
        Text(
          date,
          style: context.textThemes.c2.copyWith(color: context.colors.textSecondary),
        ),
      ],
    );
  }
}
