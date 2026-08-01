import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';

@RoutePage()
class WaitlistedPage extends StatelessWidget {
  const WaitlistedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.bgPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: context.colors.bgTertiary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.access_time_filled,
                    size: 80,
                    color: context.colors.brandDefault,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                "waitlist.screen_title".tr(),
                style: context.textThemes.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                "waitlist.screen_subtitle".tr(),
                style: context.textThemes.b1.copyWith(
                  color: context.colors.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              AppButton(
                onTap: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                label: "waitlist.exit".tr(),
              ),
              const SizedBox(height: 16),
              TextButton.icon(
                onPressed: () {
                  final role = context.read<AuthBloc>().state.userRole;
                  final roleStr =
                      role?.name == 'employer' ? 'employer' : 'candidate';
                  context.read<AuthBloc>().add(AuthLogoutRequested(roleStr));
                  final userRole = role?.name == 'employer' 
                      ? UserRole.employer 
                      : UserRole.job_seeker;
                  context.router.replaceAll([LoginRoute(role: userRole)]);
                },
                icon: Icon(Icons.logout, color: context.colors.danger),
                label: Text(
                  "waitlist.logout".tr(),
                  style: context.textThemes.b1.copyWith(
                    color: context.colors.danger,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
