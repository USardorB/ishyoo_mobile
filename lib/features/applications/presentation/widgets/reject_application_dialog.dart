import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class RejectApplicationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const RejectApplicationDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.bgPrimary,
      insetPadding: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_rounded,
              size: 72,
              color: context.colors.warning,
            ),
            const SizedBox(height: 24),
            Text(
              "applications.reject_title",
              textAlign: TextAlign.center,
              style: context.textThemes.h5,
            ).tr(),
            const SizedBox(height: 24),
            AppButton(
              onTap: () {
                context.pop();
                onConfirm();
              },
              label: "shared.yes".tr(),
              color: context.colors.brandDefault,
            ),
            const SizedBox(height: 12),
            AppButton(
              onTap: context.pop,
              label: "shared.no".tr(),
              color: context.colors.bgTertiary,
              foregroundColor: context.colors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
