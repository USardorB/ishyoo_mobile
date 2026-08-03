import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ResumeTimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final bool isActive;

  const ResumeTimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive
                ? context.colors.brandProgress
                : context.colors.bgTertiary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.textThemes.s1),
              const SizedBox(height: 4),
              Text(subtitle, style: context.textThemes.b2),
              const SizedBox(height: 2),
              Text(
                date,
                style: context.textThemes.c2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
