import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

import 'package:mobile/features/opportunities/data/models/organization.dart';

class FieldOfActivity extends StatelessWidget {
  final Organization? organization;
  const FieldOfActivity({super.key, this.organization});

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
              if (organization?.industry != null)
                Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: [_buildPill(context, organization!.industry!)],
                )
              else
                Text("Kiritilmagan", style: context.textThemes.b2),
              AppButton(
                onTap: () {
                  context.pushRoute(const EditCompanyInfoRoute());
                },
                label: "Tahrirlash",
                color: context.colors.bgSecondary,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPill(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        title,
        style: context.textThemes.b2,
      ),
    );
  }
}
