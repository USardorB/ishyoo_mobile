import 'package:easy_localization/easy_localization.dart';
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/no_notifications.webp",
            width: 260,
          ),
          const SizedBox(height: 16),
          Text(
            "notifications.emptyState",
            textAlign: TextAlign.center,
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
