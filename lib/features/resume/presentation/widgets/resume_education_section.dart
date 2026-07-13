import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_education_item.dart';

class ResumeEducationSection extends StatelessWidget {
  const ResumeEducationSection({super.key});

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
          const ResumeEducationItem(
            title: "Gurlan tumani 1-praktikum kasb hunar maktabi",
            subtitle: "Grafuk dizayner",
            date: "2023 yil O'rta maxsus ta'lim",
          ),
          Divider(color: context.colors.bgTertiary, height: 24),
          const ResumeEducationItem(
            title: "Gurlan tumani 1-praktikum kasb hunar maktabi",
            subtitle: "Grafuk dizayner",
            date: "2023 yil O'rta maxsus ta'lim",
          ),
          const SizedBox(height: 16),
          AppButton(
            onTap: () {
              context.pushRoute(const EditResumeEducationRoute());
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
