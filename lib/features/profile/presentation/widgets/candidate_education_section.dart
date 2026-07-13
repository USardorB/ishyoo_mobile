import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class CandidateEducationSection extends StatelessWidget {
  const CandidateEducationSection({super.key});

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
          _buildEducationItem(
            context,
            title: "Gurlan tumani 1-praktikum kasb hunar maktabi",
            subtitle: "Grafuk dizayner",
            date: "2023 yil O'rta maxsus ta'lim",
          ),
          Divider(color: context.colors.bgTertiary, height: 24),
          _buildEducationItem(
            context,
            title: "Gurlan tumani 1-praktikum kasb hunar maktabi",
            subtitle: "Grafuk dizayner",
            date: "2023 yil O'rta maxsus ta'lim",
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

  Widget _buildEducationItem(BuildContext context, {required String title, required String subtitle, required String date}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textThemes.s1),
        const SizedBox(height: 4),
        Text(subtitle, style: context.textThemes.b2.copyWith(color: context.colors.textSecondary)),
        const SizedBox(height: 2),
        Text(
          date,
          style: context.textThemes.c2.copyWith(color: context.colors.textSecondary),
        ),
      ],
    );
  }
}
