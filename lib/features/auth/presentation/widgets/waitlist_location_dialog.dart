import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class WaitlistLocationDialog extends StatelessWidget {
  const WaitlistLocationDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (_) => const WaitlistLocationDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.bgPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.location,
              height: 120,
              width: 120,
            ),
            const SizedBox(height: 24),
            Text(
              "auth.waitlistDialog.title".tr(),
              style: context.textThemes.h4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "auth.waitlistDialog.description".tr(),
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            AppButton(
              onTap: () => Navigator.of(context).pop(true),
              label: "auth.waitlistDialog.buttons.yes".tr(),
            ),
            const SizedBox(height: 16),
            AppButton(
              onTap: () => Navigator.of(context).pop(false),
              label: "auth.waitlistDialog.buttons.no".tr(),
              color: context.colors.bgTertiary,
              foregroundColor: context.colors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
