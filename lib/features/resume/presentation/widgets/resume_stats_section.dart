import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ResumeStatsSection extends StatelessWidget {
  const ResumeStatsSection({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat(context, "Namoyishlar", "4", false),
              Container(width: 1, height: 32, color: context.colors.bgTertiary),
              _buildStat(context, "Tomoshalar", "120", true),
              Container(width: 1, height: 32, color: context.colors.bgTertiary),
              _buildStat(context, "Takliflar", "12", true),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Rezyume kamdan-kam hollarda qidiruv natijalariga kiritiladi. Ko'proq ko'rishlar va taklifnomalar olish uchun uni ko'taring",
            style: context.textThemes.b2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          AppButton(
            onTap: () {},
            label: "Qidiruv natijalariga ko'tarish",
            color: context.colors.brandProgress.withValues(alpha: 0.15),
            foregroundColor: context.colors.brandProgress,
          ),
        ],
      ),
    );
  }

  Widget _buildStat(BuildContext context, String label, String value, bool isHighlighted) {
    return Column(
      children: [
        Text(
          label,
          style: context.textThemes.c2.copyWith(
            color: isHighlighted ? context.colors.info : context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: context.textThemes.s1.copyWith(
            color: isHighlighted ? context.colors.info : context.colors.textPrimary,
          ),
        ),
      ],
    );
  }
}
