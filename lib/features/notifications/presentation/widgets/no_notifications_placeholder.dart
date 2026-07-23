import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class NoNotificationsPlaceholder extends StatelessWidget {
  const NoNotificationsPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: .min,
        children: [
          Image.asset(
            "assets/images/no_notifications.png",
            width: 260,
          ),
          Text(
            "Hozircha bildirishnomalar yo‘q. Yangi bildirishnomalar paydo bo‘lganda, ular shu yerda ko‘rinadi.",
            textAlign: .center,
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
