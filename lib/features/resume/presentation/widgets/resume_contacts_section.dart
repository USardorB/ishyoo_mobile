import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

class ResumeContactsSection extends StatelessWidget {
  const ResumeContactsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    final phone = user?.phoneNumber ?? '';
    final email = user?.email ?? "Kiritilmagan";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Telefon raqami", style: context.textThemes.c2.copyWith(color: context.colors.textSecondary)),
          const SizedBox(height: 4),
          Text(phone, style: context.textThemes.b1),
          const SizedBox(height: 16),
          Text("Elektron pochta", style: context.textThemes.c2.copyWith(color: context.colors.textSecondary)),
          const SizedBox(height: 4),
          Text(email, style: context.textThemes.b1),
          const SizedBox(height: 16),
          AppButton(
            onTap: () {
              context.pushRoute(const EditResumeContactsRoute());
            },
            label: "Tahrirlash",
            color: context.colors.bgTertiary,
            foregroundColor: context.colors.textPrimary,
          ),
        ],
      ),
    );
  }
}
