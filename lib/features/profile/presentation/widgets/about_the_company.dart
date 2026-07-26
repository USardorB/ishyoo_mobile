import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';

class AboutTheCompany extends StatelessWidget {
  final Organization? organization;
  const AboutTheCompany({super.key, this.organization});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        SizedBox(height: 20),
        Text('Kompaniya haqida', style: context.textThemes.s2),
        SizedBox(height: 16),
        Container(
          padding: .all(12),
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: .circular(16),
          ),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  _buildStats(
                    context,
                    "Xodimlar",
                    organization?.size?.toString() ?? "-",
                  ),
                  _buildStats(context, "Bozorda", "8 yil"),
                  _buildStats(
                    context,
                    "Yaratilgan",
                    organization?.createdAt?.year.toString() ?? "-",
                  ),
                ],
              ),
              Divider(
                color: context.colors.lineSecondary,
                thickness: .5,
                height: 25,
              ),
              Text(
                organization?.description ??
                    "Kompaniya haqida ma'lumot kiritilmagan.",
                style: context.textThemes.b2,
              ),
              SizedBox(height: 12),
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

  Column _buildStats(BuildContext context, String label, String value) {
    return Column(
      spacing: 8,
      crossAxisAlignment: .start,
      children: [
        Text(
          label,
          style: context.textThemes.c1.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        Text(
          value,
          style: context.textThemes.s3,
        ),
      ],
    );
  }
}
