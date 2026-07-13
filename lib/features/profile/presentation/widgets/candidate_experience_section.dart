import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class CandidateExperienceSection extends StatelessWidget {
  const CandidateExperienceSection({super.key});

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
          _buildTimelineItem(
            context,
            title: "UX/UI Dizayner",
            subtitle: "Click",
            date: "2023 yil yanvar - hozir - 1 y 4 oy",
            isActive: true,
          ),
          Divider(color: context.colors.bgTertiary, height: 24),
          _buildTimelineItem(
            context,
            title: "Junior Designer",
            subtitle: "Espay",
            date: "2021 yil iyul - 2022 yil dekabr - 1 y 6 oy",
            isActive: false,
          ),
          const SizedBox(height: 16),
          AppButton(
            onTap: () {
              context.pushRoute(const EditCandidateProfileRoute());
            },
            label: "Tahrirlash",
            color: context.colors.bgPrimary,
            foregroundColor: context.colors.textPrimary,
            labelStyle: context.textThemes.b2,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, {required String title, required String subtitle, required String date, required bool isActive}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 6),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive ? context.colors.brandProgress : context.colors.bgTertiary,
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
                style: context.textThemes.c2.copyWith(color: context.colors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
