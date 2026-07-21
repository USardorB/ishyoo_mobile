import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
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
        child: const Text("Ta'lim ma'lumotlari yo'q"),
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
            final startStr = edu.startDate != null ? "${edu.startDate!.year} yil" : "";
            final endStr = edu.endDate != null ? "${edu.endDate!.year} yil" : "hozir";
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ResumeEducationItem(
                title: edu.school,
                subtitle: edu.degree,
                date: "$startStr - $endStr",
              ),
            );
          }),
          const SizedBox(height: 16),
          AppButton(
            onTap: () {
              context.pushRoute(EditResumeEducationRoute());
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
