import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class OnboardingPageViewItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imageURL;
  const OnboardingPageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 24),
      child: Column(
        children: [
          Flexible(child: Image.asset(imageURL)),
          Flexible(flex: 0, child: SizedBox(height: 32)),
          Column(
            crossAxisAlignment: .stretch,
            children: [
              Text(
                title,
                style: context.textThemes.h5,
                maxLines: 2,
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
