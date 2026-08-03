import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/data/models/resume_language.dart';

class CandidateLanguagesSection extends StatelessWidget {
  final List<ResumeLanguage> languages;

  const CandidateLanguagesSection({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    if (languages.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text("profile.noData").tr(),
      );
    }
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: languages.map((l) {
              return _buildLanguageChip(context, "${l.lang} - ${l.level}");
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: context.textThemes.b2,
      ),
    );
  }
}
