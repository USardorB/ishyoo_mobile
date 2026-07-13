import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ResumeExperienceListStep extends StatelessWidget {
  const ResumeExperienceListStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "3 yil 6 oy",
          style: context.textThemes.s1,
        ),
        const SizedBox(height: 16),
        _buildExperienceCard(context),
        const SizedBox(height: 12),
        _buildExperienceCard(context),
        const SizedBox(height: 12),
        _buildExperienceCard(context),
        const SizedBox(height: 24),
        AppButton(
          onTap: () {
            context.pushRoute(const EditResumeExperienceRoute());
          },
          icon: Icons.add,
          label: "Ish tajribasini qo'shish",
          color: context.colors.brandProgress.withValues(alpha: 0.15),
          foregroundColor: context.colors.brandProgress,
          labelStyle: context.textThemes.b2,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildExperienceCard(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(const EditResumeExperienceRoute());
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "UX/UI Dizayner",
                  style: context.textThemes.s1,
                ),
                Icon(
                  Icons.chevron_right,
                  color: context.colors.textSecondary,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "Click",
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "2023 yil yanvar - hozir - 1 y 4 oy",
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                height: 1,
                color: context.colors.bgTertiary,
              ),
            ),
            Text(
              "Raqamli mahsulotlarning UX UI dizaynini ishlab chiqish",
              style: context.textThemes.b2,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
