import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colors.bgPrimary,
      insetPadding: .all(16),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(20),
      ),
      title: Text(
        "Akkauntdan chiqmoqchimisiz?",
        textAlign: .center,
      ),
      titleTextStyle: context.textThemes.h5,
      contentTextStyle: context.textThemes.s2.copyWith(
        color: context.colors.textSecondary,
      ),
      content: Column(
        mainAxisSize: .min,
        children: [
          Text(
            "Diqqat! akkauntga qayta kirish uchun parol kerak bo‘ladi.",
            textAlign: .center,
          ),

          SizedBox(height: 16),
          Row(
            spacing: 12,
            children: [
              Flexible(
                child: AppButton(
                  onTap: context.pop,
                  label: "Bekor qilish",
                  color: context.colors.bgTertiary,
                ),
              ),
              Flexible(
                child: AppButton(
                  onTap: () {
                    // context.router.replace(const OnboardingRoute());
                  },
                  label: "Chiqish",
                  color: context.colors.danger,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
