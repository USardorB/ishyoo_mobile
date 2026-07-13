import 'package:auto_route/auto_route.dart';
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
                "Rezyume tayyor!",
                style: context.textThemes.h4,
              ),
              const SizedBox(height: 16),
              Text(
                "Rezyumengiz e'lon qilindi. Endi ish beruvchilar\nsizni ko'radi va takliflar yuboradi.",
                textAlign: TextAlign.center,
                style: context.textThemes.b2.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const Spacer(),
              AppButton(
                onTap: () {
                  context.router.popUntilRoot();
                },
                label: "Rezyumeni ko'rish",
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
