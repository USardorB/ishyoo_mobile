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
          mainAxisSize: .min,
          children: [
            Image.asset(
              "assets/images/no_article.png",
              width: 224,
            ),
            Text(
              "Hozircha maqolalar yo‘q. Yangi va foydali maqolalar tez orada shu yerda paydo bo‘ladi.",
              textAlign: .center,
              style: context.textThemes.b1.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
