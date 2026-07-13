import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/resume/presentation/widgets/resume_timeline_item.dart';

class ResumeExperienceSection extends StatelessWidget {
  const ResumeExperienceSection({super.key});

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
          const ResumeTimelineItem(
            title: "UX/UI Dizayner",
            subtitle: "Click",
            date: "2023 yil yanvar - hozir - 1 y 4 oy",
            isActive: true,
          ),
          Divider(color: context.colors.bgTertiary, height: 24),
          const ResumeTimelineItem(
            title: "Junior Designer",
            subtitle: "Espay",
            date: "2021 yil iyul - 2022 yil dekabr - 1 y 6 oy",
            isActive: false,
          ),
          const SizedBox(height: 16),
          AppButton(
            onTap: () {
              context.pushRoute(const EditResumeExperienceRoute());
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
