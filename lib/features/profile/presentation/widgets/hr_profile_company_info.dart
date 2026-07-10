import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class HrProfileCompanyInfo extends StatelessWidget {
  const HrProfileCompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return DividerTheme(
      data: DividerThemeData(
        color: context.colors.lineSecondary,
        thickness: .5,
      ),
      child: Builder(
        builder: (context) => Column(
          crossAxisAlignment: .stretch,
          children: [
            SizedBox(height: 20),
            Text('Aloqa va manzil', style: context.textThemes.s2),
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
                  ...ListTile.divideTiles(
                    context: context,
                    tiles: List.generate(
                      3,
                      (index) => _buildContactTile(context),
                    ),
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
        ),
      ),
    );
  }

  Widget _buildContactTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        spacing: 12,
        children: [
          Icon(Icons.call_outlined, color: context.colors.textSecondary),
          Expanded(
            child: Column(
              spacing: 4,
              crossAxisAlignment: .stretch,
              children: [
                Text('Telefon', style: context.textThemes.s3),
                Text('+998 90 123 45 67', style: context.textThemes.b2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
