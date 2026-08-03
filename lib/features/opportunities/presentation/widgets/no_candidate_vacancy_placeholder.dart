import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class NoCandidateVacancyPlaceholder extends StatelessWidget {
  const NoCandidateVacancyPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/no_results.webp",
            width: 220,
          ),
          Text(
            "opportunities.search.empty",
            textAlign: TextAlign.center,
            style: context.textThemes.b1.copyWith(
              color: context.colors.textSecondary,
            ),
          ).tr(),
        ],
      ),
    );
  }
}
