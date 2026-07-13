import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class CandidateResumesSection extends StatelessWidget {
  const CandidateResumesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.pushRoute(const ResumeDetailsRoute());
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UX/UI Dizayner",
                            style: context.textThemes.s1,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Bugun soat 15:46 da qo'lda ko'tarish mumkin",
                            style: context.textThemes.c1.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: context.colors.bgTertiary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: context.colors.bgPrimary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStat(context, "Namoyishlar", "4", false),
                      Container(width: 1, height: 32, color: context.colors.bgTertiary),
                      _buildStat(context, "Tomoshalar", "120", true),
                      Container(width: 1, height: 32, color: context.colors.bgTertiary),
                      _buildStat(context, "Takliflar", "12", true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        AppButton(
          onTap: () {
            context.pushRoute(const CreateResumeFlowRoute());
          },
          icon: Icons.add,
          label: "Yangi rezyume yuklash",
          color: context.colors.bgSecondary,
          foregroundColor: context.colors.brandProgress,
          labelStyle: context.textThemes.b2.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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
