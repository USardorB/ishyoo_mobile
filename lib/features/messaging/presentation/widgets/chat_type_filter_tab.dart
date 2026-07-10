import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class ChatTypeFilterTab extends StatelessWidget implements PreferredSizeWidget {
  const ChatTypeFilterTab({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Padding(
        padding: .symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.bgSecondary.withAlpha(200),
                  borderRadius: .circular(32),
                  border: Border.all(color: context.colors.lineSecondary),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  dividerHeight: 0,
                  splashBorderRadius: .circular(20),
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: EdgeInsets.symmetric(
                    // horizontal: 6,
                    vertical: 5,
                  ),
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
                  indicatorPadding: .symmetric(horizontal: 6),
                  labelPadding: .symmetric(horizontal: 8, vertical: 5),
                  tabs: [
                    Row(
                      mainAxisAlignment: .center,
                      spacing: 6,
                      children: [
                        Text("Barchasi"),
                        Flexible(
                          child: CircleAvatar(
                            radius: 12,
                            child: Text("4"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .center,
                      spacing: 6,
                      children: [
                        Text("Javoblar"),
                        Flexible(
                          child: CircleAvatar(
                            radius: 12,
                            child: Text("4"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: .center,
                      spacing: 6,
                      children: [
                        Text("Rad etilgan "),
                        Flexible(
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
