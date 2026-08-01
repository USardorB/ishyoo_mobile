import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

enum AppNotificationType { error, success, warning }

class AppNotification extends StatelessWidget {
  final VoidCallback onClose;
  final AppNotificationType type;
  final String msg;
  const AppNotification({
    super.key,
    required this.type,
    required this.msg,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final color = switch (type) {
      .success => context.colors.success,
      .error => context.colors.danger,
      .warning => context.colors.warning,
    };

    return Material(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color),
        borderRadius: .circular(16),
      ),
      color: context.colors.bgPrimary,
      child: Padding(
        padding: const .all(12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: color,
              child: Icon(switch (type) {
                .success => Icons.done,
                .error => Icons.priority_high,
                .warning => Icons.priority_high_rounded,
              }, color: context.colors.textPrimary),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Flexible(child: Text(msg, style: context.textThemes.b2)),
                  IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
