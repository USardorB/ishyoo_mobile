import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
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
        child: const Text("Ish tajribasi yo'q"),
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
            final startStr = exp.startDate != null ? "${exp.startDate!.year} yil" : "";
            final endStr = exp.endDate != null ? "${exp.endDate!.year} yil" : "hozir";
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
          const SizedBox(height: 16),
          AppButton(
            onTap: () {
              context.pushRoute(EditResumeExperienceRoute());
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
