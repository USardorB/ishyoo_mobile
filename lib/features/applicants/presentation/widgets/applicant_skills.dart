import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ApplicantSkills extends StatelessWidget {
  const ApplicantSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          'Ko‘nikmalar',
          style: context.textThemes.s2,
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: .all(12),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildSkill(context, 'Figma'),
              _buildSkill(context, 'UX UI Design'),
              _buildSkill(context, 'Design Systen'),
              _buildSkill(context, 'Adobe Photoshop'),
              _buildSkill(context, 'Wiframes'),
              _buildSkill(context, 'Adobe Illustraror'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkill(BuildContext context, String text) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: .symmetric(horizontal: 12, vertical: 8),
      child: Text(
        text,
        style: context.textThemes.b1.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
