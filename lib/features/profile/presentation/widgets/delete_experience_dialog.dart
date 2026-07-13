import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class DeleteExperienceDialog extends StatelessWidget {
  const DeleteExperienceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.bgSecondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Ish tajribasini o'chirishni\ntasdiqlaysizmi?",
              textAlign: TextAlign.center,
              style: context.textThemes.s1,
            ),
            const SizedBox(height: 12),
            Text(
              "O'chirilgandan so'ng ushbu ish\ntajribasini qayta tiklab bo'lmaydi.",
              textAlign: TextAlign.center,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => context.maybePop(),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: context.colors.bgTertiary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Bekor qilish",
                        style: context.textThemes.b2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => context.maybePop(true),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: context.colors.danger,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "O'chirish",
                        style: context.textThemes.b2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
