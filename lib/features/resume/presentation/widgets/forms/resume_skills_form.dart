import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';

class ResumeSkillsForm extends StatelessWidget {
  const ResumeSkillsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        AppInputField(
          label: "Ko'nikmalar",
          hintText: "Ko'nikma kiriting (Masalan: Figma)",
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildSkillChip(context, "Figma"),
            _buildSkillChip(context, "UX UI Design"),
            _buildSkillChip(context, "Design System"),
            _buildSkillChip(context, "Adobe Photoshop"),
            _buildSkillChip(context, "Wiframes"),
            _buildSkillChip(context, "Adobe Illustrator"),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.bgTertiary.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textThemes.b2,
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.close,
            size: 16,
            color: context.colors.textPrimary,
          ),
        ],
      ),
    );
  }
}
