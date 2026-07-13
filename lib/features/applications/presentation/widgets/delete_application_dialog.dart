import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class DeleteApplicationDialog extends StatelessWidget {
  const DeleteApplicationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.bgPrimary,
      insetPadding: const .all(12),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(20),
      ),
      child: Padding(
        padding: const .all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_rounded,
              size: 72,
              color: context.colors.danger,
            ),
            const SizedBox(height: 24),
            Text(
              "Javobni o'chirish?",
              textAlign: TextAlign.center,
              style: context.textThemes.h4,
            ),
            const SizedBox(height: 24),
            AppButton(
              onTap: context.pop,
              label: "O'chirish",
              color: context.colors.bgTertiary,
              foregroundColor: context.colors.danger,
            ),
            const SizedBox(height: 12),
            AppButton(
              onTap: context.pop,
              label: "Bekor qilish",
              color: context.colors.bgTertiary,
              foregroundColor: context.colors.textPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
