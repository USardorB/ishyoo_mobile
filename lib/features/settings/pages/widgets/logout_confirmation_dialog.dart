import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';

class LogoutConfirmationDialog extends StatelessWidget {
  const LogoutConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.colors.bgPrimary,
      insetPadding: .all(16),
      shape: RoundedRectangleBorder(
        borderRadius: .circular(20),
      ),
      title: Text(
        "Akkauntdan chiqmoqchimisiz?",
        textAlign: .center,
      ),
      titleTextStyle: context.textThemes.h5,
      contentTextStyle: context.textThemes.s2.copyWith(
        color: context.colors.textSecondary,
      ),
      content: Column(
        mainAxisSize: .min,
        children: [
          Text(
            "Diqqat! akkauntga qayta kirish uchun parol kerak bo‘ladi.",
            textAlign: .center,
          ),

          SizedBox(height: 16),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.unauthenticated) {
                context.router.replaceAll([const ChooseLanguageRoute()]);
              }
            },
            builder: (context, state) {
              return Row(
                spacing: 12,
                children: [
                  Flexible(
                    child: AppButton(
                      onTap: context.pop,
                      label: "Bekor qilish",
                      color: context.colors.bgTertiary,
                    ),
                  ),
                  Flexible(
                    child: AppButton(
                      onTap: () {
                        final role = state.userRole;
                        final roleString = role == UserRole.employer
                            ? 'employer'
                            : 'candidate';
                        context.read<AuthBloc>().add(
                          AuthLogoutRequested(roleString),
                        );
                      },
                      label: "Chiqish",
                      color: context.colors.danger,
                      isLoading: state.status == AuthStatus.loading,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
