import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/extensions/page_controller_extension.dart';

class PageViewIndicator extends StatelessWidget {
  final PageController pageController;
  const PageViewIndicator({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: pageController,
      builder: (BuildContext context, _) {
        final currentPage = pageController.currentPage;
        return Row(
          spacing: 6,
          mainAxisAlignment: .center,
          children: .generate(3, (index) {
            final isSelected = currentPage == index;
            return AnimatedContainer(
              width: isSelected ? 14 : 12,
              height: isSelected ? 14 : 12,
              decoration: BoxDecoration(
                shape: .circle,
                color: isSelected
                    ? context.colors.brandDefault
                    : context.colors.bgTertiary,
              ),
              duration: Durations.short4,
            );
          }),
        );
      },
    );
  }
}
