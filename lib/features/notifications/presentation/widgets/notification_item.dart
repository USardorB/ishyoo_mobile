import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class NotificationItem extends StatelessWidget {
  final bool read;
  final String title;
  final String body;
  final String date;
  final VoidCallback? onTap;
  final String? imageUrl;
  const NotificationItem({
    super.key,
    required this.read,
    required this.title,
    required this.body,
    required this.date,
    this.onTap,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: .circular(12),
      ),
      clipBehavior: .hardEdge,
      color: context.colors.bgPrimary,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            if (imageUrl != null) ...[
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  maxWidthDiskCache: 400,
                  maxHeightDiskCache: 200,
                ),
              ),
              const SizedBox(height: 12),
            ],
            Padding(
              padding: const .all(12),
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  Text(
                    title,
                    style: context.textThemes.s2,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    body,
                    style: context.textThemes.b2.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        date,
                        style: context.textThemes.b2.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      const Spacer(),
                      if (!read) const Icon(Icons.done) else const Icon(Icons.done_all),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
