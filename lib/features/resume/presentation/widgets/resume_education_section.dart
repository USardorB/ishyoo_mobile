import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/resume/data/models/resume.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_education_item.dart';

class ResumeEducationSection extends StatelessWidget {
  final List<ResumeEducation> educations;

  const ResumeEducationSection({super.key, required this.educations});

  @override
  Widget build(BuildContext context) {
    if (educations.isEmpty) {
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
          ...educations.map((edu) {
            final startStr = edu.startDate != null
                ? "${edu.startDate!.year}"
                : "";
            final endStr = edu.endDate != null
                ? "${edu.endDate!.year}"
                : "resume.present".tr();
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ResumeEducationItem(
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
}
