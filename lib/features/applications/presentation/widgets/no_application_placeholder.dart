import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class NoApplicationPlaceholder extends StatelessWidget {
  final String message;
  const NoApplicationPlaceholder({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: .min,
          children: [
            Image.asset(
              "assets/images/no_applications.webp",
              width: 198,
            ),
            const SizedBox(height: 4),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
