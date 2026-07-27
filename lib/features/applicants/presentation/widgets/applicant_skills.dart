import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ApplicantSkills extends StatelessWidget {
  final List<String> skills;
  const ApplicantSkills({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Ko'nikmalar", style: context.textThemes.s2),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(12),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills
                .map((skill) => _buildSkill(context, skill))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSkill(BuildContext context, String text) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: .circular(8),
      ),
      padding: const .symmetric(horizontal: 12, vertical: 6),
      child: Text(
        text,
        style: context.textThemes.b1.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
