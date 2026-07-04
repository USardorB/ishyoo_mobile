import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

class ApplicantStatusHeader extends StatelessWidget {
  const ApplicantStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: .circular(16),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            "Status",
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                "To‘g‘ri kelmaydi",
                style: context.textThemes.s1,
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 20,
                    color: context.colors.textSecondary,
                  ),
                  SizedBox(width: 6),
                  Text(
                    "Mar 31,2024",
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          AppButton(
            onTap: () {},
            color: context.colors.brandProgress,
            foregroundColor: context.colors.brandDefault,
            label: "Statusni o‘zgartirish",
          ),
        ],
      ),
    );
  }
}
