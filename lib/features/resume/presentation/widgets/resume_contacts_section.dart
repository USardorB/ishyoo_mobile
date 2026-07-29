import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

class ResumeContactsSection extends StatelessWidget {
  const ResumeContactsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    final phone = user?.phoneNumber ?? '';
    final email = user?.email ?? "shared.no_data".tr();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "auth.login.phone_label",
            style: context.textThemes.c2.copyWith(
              color: context.colors.textSecondary,
            ),
          ).tr(),
          const SizedBox(height: 4),
          Text(phone, style: context.textThemes.b1),
          const SizedBox(height: 16),
          Text(
            "EMAIL",
            style: context.textThemes.c2.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(email, style: context.textThemes.b1),
        ],
      ),
    );
  }
}
