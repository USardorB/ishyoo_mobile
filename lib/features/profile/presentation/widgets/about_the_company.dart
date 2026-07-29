import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        Text('profile.about_company', style: context.textThemes.s2).tr(),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: context.colors.bgPrimary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStats(
                    context,
                    "nav.candidates".tr(),
                    organization?.size?.toString() ?? "-",
                  ),
                  _buildStats(
                    context,
                    "profile.experience".tr(),
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
                    "shared.no_data".tr(),
                style: context.textThemes.b2,
              ),
              const SizedBox(height: 12),
              AppButton(
                onTap: () {
                  context.pushRoute(const EditCompanyInfoRoute());
                },
                label: "profile.edit_profile".tr(),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textThemes.c1.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: context.textThemes.s3,
        ),
      ],
    );
  }
}
