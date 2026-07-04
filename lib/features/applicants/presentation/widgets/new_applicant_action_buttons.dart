import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class NewApplicantActionButtons extends StatelessWidget {
  const NewApplicantActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Flexible(
          child: AppButton(
            onTap: () {},
            label: "Taklif qilish",
            labelStyle: context.textThemes.b3,
            color: context.colors.brandProgress,
            foregroundColor: context.colors.brandDefault,
          ),
        ),
        Flexible(
          child: AppButton(
            color: context.colors.bgSecondary,
            onTap: () {},
            label: "Rad qilish",
            labelStyle: context.textThemes.b3,
          ),
        ),
        SizedBox(
          width: 48,
          child: AppButton(
            color: context.colors.bgSecondary,
            onTap: () {},
            icon: Icons.chat,
          ),
        ),
      ],
    );
  }
}
