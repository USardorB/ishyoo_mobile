import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/data/models/resume_language.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_skill_chip.dart';

class ResumeSkillsSection extends StatelessWidget {
  final List<String> skills;
  final List<ResumeLanguage> languages;

  const ResumeSkillsSection({
    super.key,
    required this.skills,
    required this.languages,
  });

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty && languages.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text("resume.noData").tr(),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (skills.isNotEmpty) ...[
            Text("resume.skills".tr(), style: context.textThemes.s2),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map((skill) => ResumeSkillChip(label: skill))
                  .toList(),
            ),
          ],
          if (skills.isNotEmpty && languages.isNotEmpty)
            const SizedBox(height: 24),
          if (languages.isNotEmpty) ...[
            Text("resume.languages".tr(), style: context.textThemes.s2),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: languages
                  .map((lang) => ResumeSkillChip(label: "${lang.lang} - ${lang.level}"))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
