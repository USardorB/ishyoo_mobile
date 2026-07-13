import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_skill_chip.dart';

class ResumeSkillsSection extends StatelessWidget {
  const ResumeSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              ResumeSkillChip(label: "Figma"),
              ResumeSkillChip(label: "UX UI Design"),
              ResumeSkillChip(label: "Design System"),
              ResumeSkillChip(label: "Adobe Photoshop"),
              ResumeSkillChip(label: "Wiframes"),
              ResumeSkillChip(label: "Adobe Illustrator"),
            ],
          ),
          const SizedBox(height: 16),
          AppButton(
            onTap: () {
              context.pushRoute(const EditResumeSkillsRoute());
            },
            label: "Tahrirlash",
            color: context.colors.bgTertiary,
            foregroundColor: context.colors.textPrimary,
          ),
        ],
      ),
    );
  }
}
