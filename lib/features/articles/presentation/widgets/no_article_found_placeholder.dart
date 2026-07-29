import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class NoArticleFoundPlaceholder extends StatelessWidget {
  const NoArticleFoundPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/no_article.png",
              width: 224,
            ),
            const SizedBox(height: 16),
            Text(
              "articles.no_articles",
              textAlign: TextAlign.center,
              style: context.textThemes.b1.copyWith(
                color: context.colors.textSecondary,
              ),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
