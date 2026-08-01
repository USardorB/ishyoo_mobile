import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/data/models/resume.dart';

class CandidateEducationSection extends StatelessWidget {
  final List<ResumeEducation> educations;

  const CandidateEducationSection({super.key, required this.educations});

  @override
  Widget build(BuildContext context) {
    if (educations.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text("shared.no_data").tr(),
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
          ...educations.map((edu) {
            final startStr = edu.startDate != null
                ? "${edu.startDate!.year}"
                : "";
            final endStr = edu.endDate != null
                ? "${edu.endDate!.year}"
                : "shared.present".tr();
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildEducationItem(
                context,
                title: edu.school,
                subtitle: edu.degree,
                date: "$startStr - $endStr",
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildEducationItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textThemes.s1),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: context.textThemes.b2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          date,
          style: context.textThemes.c2.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
