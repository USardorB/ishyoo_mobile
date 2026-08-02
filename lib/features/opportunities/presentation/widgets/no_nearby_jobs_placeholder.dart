import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class NoNearbyJobsPlaceholder extends StatelessWidget {
  const NoNearbyJobsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: .min,
          children: [
            Image.asset(
              "assets/images/no_results.png",
              width: 224,
            ),
            Text(
              "opportunities.noNearbyJobs",
              textAlign: TextAlign.center,
              style: context.textThemes.b2.copyWith(
                color: context.colors.textSecondary,
              ),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
