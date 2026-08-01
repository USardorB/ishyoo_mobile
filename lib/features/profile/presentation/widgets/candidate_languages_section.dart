import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class CandidateLanguagesSection extends StatelessWidget {
  const CandidateLanguagesSection({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildLanguageChip(context, "O'zbek"),
                _buildLanguageChip(context, "English"),
                _buildLanguageChip(context, "Русский"),
              ],
            ),
          ],
        ),
      );
    }
  
    Widget _buildLanguageChip(BuildContext context, String label) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: context.colors.bgSecondary,
          borderRadius: BorderRadius.circular(8),
        ),
      child: Text(
        label,
        style: context.textThemes.b2,
      ),
    );
  }
}
