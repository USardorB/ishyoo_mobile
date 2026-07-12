import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class CandidateHomeBanner extends StatelessWidget {
  const CandidateHomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.brandDefault,
        borderRadius: .circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Orzuingizdagi ishni\ntoping",
                  style: context.textThemes.s1.copyWith(
                    color: context.colors.midnightImmutable,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Lorem Ipsum is simply",
                  style: context.textThemes.c1.copyWith(
                    color: context.colors.brandProgress,
                  ),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: context.colors.midnightImmutable,
                    textStyle: context.textThemes.b3,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: const Text("Get started"),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_outline,
                  color: Colors.black54,
                  size: 48,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
