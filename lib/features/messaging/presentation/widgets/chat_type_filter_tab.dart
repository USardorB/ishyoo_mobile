import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ChatTypeFilterTab extends StatelessWidget implements PreferredSizeWidget {
  const ChatTypeFilterTab({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.bgSecondary.withAlpha(200),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: context.colors.lineSecondary),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  dividerHeight: 0,
                  splashBorderRadius: BorderRadius.circular(20),
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  labelStyle: context.textThemes.buttonMedium.copyWith(
                    color: context.colors.brandDefault,
                  ),
                  unselectedLabelStyle: context.textThemes.buttonMedium
                      .copyWith(
                        color: context.colors.textSecondary,
                      ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: context.colors.brandProgress,
                  ),
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 6),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  tabs: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("shared.all").tr(),
                        const SizedBox(width: 6),
                        const Flexible(
                          child: CircleAvatar(
                            radius: 12,
                            child: Text("4"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("applications.tabs.received").tr(),
                        const SizedBox(width: 6),
                        const Flexible(
                          child: CircleAvatar(
                            radius: 12,
                            child: Text("4"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("applications.tabs.rejected").tr(),
                        const SizedBox(width: 6),
                        const Flexible(
                          child: CircleAvatar(
                            radius: 12,
                            child: Text("1"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
