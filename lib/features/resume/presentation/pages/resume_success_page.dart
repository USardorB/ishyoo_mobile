import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';

@RoutePage()
class ResumeSuccessPage extends StatelessWidget {
  const ResumeSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: context.colors.brandProgress.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.check,
                  size: 64,
                  color: context.colors.brandProgress,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                "resume.successTitle",
                style: context.textThemes.h4,
              ).tr(),
              const SizedBox(height: 16),
              Text(
                "resume.successDesc",
                textAlign: TextAlign.center,
                style: context.textThemes.b2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ).tr(),
              const Spacer(),
              AppButton(
                onTap: () {
                  context.router.popUntilRoot();
                },
                label: "resume.createResume".tr(),
                color: context.colors.brandProgress,
                foregroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
