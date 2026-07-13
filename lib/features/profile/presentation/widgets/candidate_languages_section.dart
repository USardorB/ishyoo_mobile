import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class CandidateLanguagesSection extends StatelessWidget {
  const CandidateLanguagesSection({super.key});

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
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildLanguageChip(context, "O'zbek, ona tili"),
              _buildLanguageChip(context, "Ingliz tili, A1 - Boshlang'ich"),
              _buildLanguageChip(context, "Rus tili, S2 - Mukammal"),
            ],
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

  Widget _buildLanguageChip(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: context.textThemes.b2,
      ),
    );
  }
}
