import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class FieldOfActivity extends StatelessWidget {
  const FieldOfActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        SizedBox(height: 20),
        Text('Faoliyat sohasi', style: context.textThemes.s2),
        SizedBox(height: 16),
        Container(
          padding: .all(12),
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: .circular(16),
          ),
          child: Column(
            spacing: 12,
            crossAxisAlignment: .stretch,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 12,
                children: _exampleSkillsets
                    .map((e) => _buildPill(context, e))
                    .toList(),
              ),
              AppButton(
                onTap: () {},
                label: "Tahrirlash",
                color: context.colors.bgSecondary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildPill(BuildContext context, String text) {
    return Container(
      padding: .symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: .circular(6),
      ),
      child: Text(
        text,
        style: context.textThemes.b1.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }

  static const _exampleSkillsets = [
    'Bank',
    'Moliya',
    'Fintech',
    'Raqamli xizmatlar',
    'IT mahsulotlari',
  ];
}
