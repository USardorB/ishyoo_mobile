import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class DeleteResumeDialog extends StatelessWidget {
  const DeleteResumeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.bgPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "resume.deleteTitle",
              textAlign: TextAlign.center,
              style: context.textThemes.s1,
            ).tr(),
            const SizedBox(height: 12),
            Text(
              "resume.deleteDesc",
              textAlign: TextAlign.center,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ).tr(),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onTap: context.pop,
                    label: "resume.actions.cancel".tr(),
                    color: context.colors.bgTertiary,
                    foregroundColor: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: AppButton(
                    onTap: () => context.pop(true),
                    label: "resume.actions.delete".tr(),
                    color: context.colors.danger,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
