import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ChatDetailsPageJobCard extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool isEmployer;

  const ChatDetailsPageJobCard({
    super.key,
    required this.title,
    required this.isEmployer,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 16),
      child: Container(
        padding: .symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: .circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              alignment: .center,
              decoration: BoxDecoration(
                color: context.colors.brandProgress,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                Icons.work_outline,
                size: 16,
                color: context.colors.brandDefault,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  Text(
                    isEmployer ? "Rezyume" : "Vakansiya",
                    style: context.textThemes.c1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  Text(
                    title,
                    style: context.textThemes.b3,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
