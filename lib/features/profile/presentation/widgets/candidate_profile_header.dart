import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';

class CandidateProfileHeader extends StatelessWidget {
  const CandidateProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthBloc>().state.user;
    final name = user?.name ?? 'Kiritilmagan';
    final phone = user?.phoneNumber ?? '';
    final initials = name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '?';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: context.colors.bgPrimary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: context.textThemes.s1.copyWith(
                color: context.colors.brandProgress,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: context.textThemes.s1,
                ),
                Text(
                  phone,
                  style: context.textThemes.c1.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
