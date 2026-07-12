import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';

@RoutePage()
class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isCandidate = true;
    return AutoTabsScaffold(
      routes: [
        if (isCandidate) ...[
          CandidateHomeRoute(),
          ApplicantsRoute(),
          ChatsRoute(),
          HRProfileRoute(),
        ] else ...[
          HrDashboardRoute(),
          ApplicantsRoute(),
          ChatsRoute(),
          HRProfileRoute(),
        ],
      ],
      extendBody: true,
      bottomNavigationBuilder: (context, tabsRouter) {
        return SafeArea(
          minimum: EdgeInsets.all(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 12,
                sigmaY: 12,
              ), // Strength of the blur
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.15),
                    width: 1.5,
                  ),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: context.colors.brandDefault.withValues(
                              alpha: 0.25,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              visualDensity: .comfortable,
                              textStyle: context.textThemes.buttonSmall,
                            ),
                            label: Column(
                              mainAxisAlignment: .center,
                              // mainAxisSize: .min,
                              children: [
                                Icon(Icons.home, size: 24),
                                Text(
                                  'Home',
                                  maxLines: 1,
                                  overflow: .ellipsis,
                                ),
                              ],
                            ),
                            onPressed: () {
                              tabsRouter.setActiveIndex(0);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            visualDensity: .comfortable,
                            textStyle: context.textThemes.buttonSmall,
                          ),
                          child: Column(
                            mainAxisAlignment: .center,
                            // mainAxisSize: .min,
                            children: [
                              Icon(Icons.list, size: 24),
                              Text(
                                'Applications',
                                maxLines: 1,
                                // overflow: .ellipsis,
                              ),
                            ],
                          ),
                          onPressed: () {
                            tabsRouter.setActiveIndex(1);
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            visualDensity: .comfortable,
                            textStyle: context.textThemes.buttonSmall,
                          ),
                          child: Column(
                            mainAxisAlignment: .center,
                            // mainAxisSize: .min,
                            children: [
                              Icon(Icons.chat, size: 24),
                              Text(
                                'Chat',
                                maxLines: 1,
                                overflow: .ellipsis,
                              ),
                            ],
                          ),
                          onPressed: () {
                            tabsRouter.setActiveIndex(2);
                          },
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            visualDensity: .comfortable,
                            textStyle: context.textThemes.buttonSmall,
                          ),
                          child: Column(
                            mainAxisAlignment: .center,
                            // mainAxisSize: .min,
                            children: [
                              Icon(Icons.person, size: 24),
                              Text(
                                'Profile',
                                maxLines: 1,
                                overflow: .ellipsis,
                              ),
                            ],
                          ),
                          onPressed: () {
                            tabsRouter.setActiveIndex(3);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
