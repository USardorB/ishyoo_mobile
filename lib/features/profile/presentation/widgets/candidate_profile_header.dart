import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class CandidateProfileHeader extends StatelessWidget {
  const CandidateProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: context.colors.bgPrimary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              "KM",
              style: context.textThemes.s1.copyWith(
                color: context.colors.brandProgress,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Komilov Muxriddin",
                  style: context.textThemes.s1,
                ),
                Text(
                  "+998 88 554 88 88",
                  style: context.textThemes.c1.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
