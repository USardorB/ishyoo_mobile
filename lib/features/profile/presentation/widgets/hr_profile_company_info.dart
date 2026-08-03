import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';

class HrProfileCompanyInfo extends StatelessWidget {
  final Organization? organization;
  const HrProfileCompanyInfo({super.key, this.organization});

  @override
  Widget build(BuildContext context) {
    return DividerTheme(
      data: DividerThemeData(
        color: context.colors.lineSecondary,
        thickness: .5,
      ),
      child: Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text('profile.company.companyInfo', style: context.textThemes.s2).tr(),
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
                  if (organization?.website != null)
                    _buildContactTile(
                      context,
                      icon: Icons.language_outlined,
                      label: 'WEBSITE',
                      value: organization!.website!,
                    ),
                  if (organization?.location != null) ...[
                    if (organization?.website != null) const Divider(),
                    _buildContactTile(
                      context,
                      icon: Icons.location_on_outlined,
                      label: 'profile.company.location'.tr(),
                      value: organization!.location!,
                    ),
                  ],
                  if (organization?.phoneNumber != null) ...[
                    if (organization?.website != null ||
                        organization?.location != null)
                      const Divider(),
                    _buildContactTile(
                      context,
                      icon: Icons.phone_outlined,
                      label: 'profile.company.phoneLabel'.tr(),
                      value: organization!.phoneNumber!,
                    ),
                  ],
                  if (organization?.website == null &&
                      organization?.location == null &&
                      organization?.phoneNumber == null &&
                      organization?.since == null &&
                      organization?.onMarket == null)
                    Text(
                      "shared.no_data",
                      style: context.textThemes.b2.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ).tr(),
                  const SizedBox(height: 12),
                  AppButton(
                    color: context.colors.bgSecondary,
                    onTap: () {
                      context.pushRoute(const EditCompanyInfoRoute());
                    },
                    label: "profile.edit".tr(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: context.colors.textSecondary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.textThemes.s3),
                const SizedBox(height: 4),
                Text(value, style: context.textThemes.b2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
