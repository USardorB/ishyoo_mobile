import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_timeline_item.dart';

class ResumeExperienceSection extends StatelessWidget {
  final List<ResumeExperience> experiences;

  const ResumeExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    if (experiences.isEmpty) {
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
          ...experiences.map((exp) {
            final startStr = exp.startDate != null
                ? "${exp.startDate!.year}"
                : "";
            final endStr = exp.endDate != null
                ? "${exp.endDate!.year}"
                : "resume.present".tr();
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ResumeTimelineItem(
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
}
