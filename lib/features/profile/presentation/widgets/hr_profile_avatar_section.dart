import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class HrProfileAvatarSection extends StatelessWidget {
  const HrProfileAvatarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(12),
      decoration: BoxDecoration(
        color: context.colors.bgPrimary,
        borderRadius: .circular(20),
      ),
      child: Row(
        spacing: 12,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: context.colors.bgSecondary,
            child: Text(
              'UB',
              style: context.textThemes.h5.copyWith(
                color: context.colors.brandDefault,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: .start,
            spacing: 4,
            children: [
              Row(
                mainAxisAlignment: .start,
                spacing: 6,
                children: [
                  Text('Uzum Bank', style: context.textThemes.s1),
                  Icon(
                    Icons.check_circle_rounded,
                    color: context.colors.brandDefault,
                  ),
                ],
              ),
              Text(
                'Bank · Moliya · Toshkent',
                style: context.textThemes.c1.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
