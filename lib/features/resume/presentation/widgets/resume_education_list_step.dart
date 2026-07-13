import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ResumeEducationListStep extends StatelessWidget {
  const ResumeEducationListStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _buildEducationCard(context),
        const SizedBox(height: 12),
        _buildEducationCard(context),
        const SizedBox(height: 24),
        AppButton(
          onTap: () {
            context.pushRoute(const EditResumeEducationRoute());
          },
          icon: Icons.add,
          label: "Ta'lim ma'lumotini qo'shish",
          color: context.colors.brandProgress.withValues(alpha: 0.15),
          foregroundColor: context.colors.brandProgress,
          labelStyle: context.textThemes.b2,
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildEducationCard(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushRoute(const EditResumeEducationRoute());
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
                  "Gurlan tumani 1-praktikum kasb...",
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
              "Grafik dizayner",
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "2023 yil O'rta maxsus ta'lim",
              style: context.textThemes.c1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
