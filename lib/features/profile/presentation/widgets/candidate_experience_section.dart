import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/data/models/resume.dart';

class CandidateExperienceSection extends StatelessWidget {
  final List<ResumeExperience> experiences;

  const CandidateExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    if (experiences.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text("shared.no_data").tr(),
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
          ...experiences.map((exp) {
            final startStr = exp.startDate != null
                ? "${exp.startDate!.year}"
                : "";
            final endStr = exp.endDate != null
                ? "${exp.endDate!.year}"
                : "shared.present".tr();
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildTimelineItem(
                context,
                title: exp.position,
                subtitle: exp.companyName,
                date: "$startStr - $endStr",
                isActive: exp.endDate == null,
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String date,
    required bool isActive,
  }) {
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
