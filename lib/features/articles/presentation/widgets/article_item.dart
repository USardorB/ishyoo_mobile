import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

import '../../data/models/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  final VoidCallback onTap;

  const ArticleItem({
    super.key,
    required this.article,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.bgPrimary,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.colors.lineSecondary),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.coverImage != null)
              Image.network(
                article.coverImage!,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: context.colors.brandProgress,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Maqola",
                          style: context.textThemes.buttonTiny.copyWith(
                            color: context.colors.brandDefault,
                          ),
                        ),
                      ),
                      const Spacer(),
                      if (article.createdAt != null)
                        Text(
                          DateFormat('dd MMM, yyyy').format(article.createdAt!),
                          style: context.textThemes.c1.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    article.title ?? '',
                    style: context.textThemes.s3,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  if (article.content != null)
                    Html(
                      data: article.content!,
                      style: {
                        "body": Style(
                          margin: Margins.zero,
                          padding: HtmlPaddings.zero,
                          color: context.colors.textSecondary,
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      },
                    ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 16,
                        color: context.colors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${article.viewsCount ?? 0}",
                        style: context.textThemes.c1.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.access_time,
                        size: 16,
                        color: context.colors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${article.readTimeMinutes ?? 1} daqiqa",
                        style: context.textThemes.c1.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
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
