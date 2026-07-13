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
              "Rezyumeni o'chirishni tasdiqlaysizmi?",
              textAlign: TextAlign.center,
              style: context.textThemes.s1,
            ),
            const SizedBox(height: 12),
            Text(
              "Rezyume o'chirilgandan so'ng uni qayta tiklab bo'lmaydi.",
              textAlign: TextAlign.center,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: AppButton(
                    onTap: () => Navigator.pop(context),
                    label: "Bekor qilish",
                    color: context.colors.bgTertiary,
                    foregroundColor: context.colors.textPrimary,
                  ),
                ),
                Expanded(
                  child: AppButton(
                    onTap: () => Navigator.pop(context),
                    label: "O'chirish",
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
