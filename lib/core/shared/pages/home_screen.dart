import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isCandidate =
        context.read<AuthBloc>().state.userRole == UserRole.job_seeker;
    return AutoTabsScaffold(
      routes: [
        if (isCandidate) ...[
          CandidateHomeRoute(),
          ApplicationsRoute(),
          ChatsRoute(),
          CandidateProfileRoute(),
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
                    children:
                        [
                          ('Bosh sahifa', Icons.home_outlined),
                          ('Javoblar', Icons.assignment_outlined),
                          ('Chat', Icons.chat),
                          ('Profile', Icons.person),
                        ].asMap().entries.map((entry) {
                          final index = entry.key;
                          final label = entry.value.$1;
                          final icon = entry.value.$2;
                          final isActive = tabsRouter.activeIndex == index;

                          return Expanded(
                            child: Container(
                              decoration: isActive
                                  ? BoxDecoration(
                                      color: context.colors.brandDefault
                                          .withValues(alpha: 0.25),
                                      borderRadius: BorderRadius.circular(40),
                                    )
                                  : null,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  visualDensity: VisualDensity.comfortable,
                                  textStyle: context.textThemes.buttonSmall,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      icon,
                                      size: 24,
                                      color: isActive
                                          ? context.colors.brandDefault
                                          : context.colors.textSecondary,
                                    ),
                                    Text(
                                      label,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: isActive
                                            ? context.colors.brandDefault
                                            : context.colors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  tabsRouter.setActiveIndex(index);
                                },
                              ),
                            ),
                          );
                        }).toList(),
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
