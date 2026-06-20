import 'package:flutter/material.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class OnboardingPageViewItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const OnboardingPageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24),
      child: Column(
        children: [
          Flexible(
            child: Image.asset(
              AppAssets.onboardingDark,
            ),
          ),
          Flexible(flex: 0, child: SizedBox(height: 32)),
          Column(
            crossAxisAlignment: .stretch,
            children: [
              Text(
                title,
                style: context.textThemes.h5,
                maxLines: 1,
                overflow: .ellipsis,
                textAlign: .center,
              ),
              SizedBox(height: 12),
              Text(
                subTitle,
                style: context.textThemes.b1.copyWith(
                  color: context.colors.textSecondary,
                ),
                maxLines: 4,
                overflow: .ellipsis,
                textAlign: .center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
