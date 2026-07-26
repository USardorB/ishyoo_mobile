import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/enums/user_role.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';
import 'package:mobile/core/shared/overlays/app_notification_overlay.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/data/models/auth_request.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/auth/presentation/widgets/phone_number_field_prefix.dart';

@RoutePage()
class ForgotPasswordPage extends HookWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneController = useTextEditingController(text: '');

    void onRequestSms() {
      if (phoneController.text.isEmpty) {
        AppNotificationOverlay.instance.show(
          message: 'Iltimos telefon raqamini kiriting',
          type: .warning,
        );
        return;
      }

      final role = context.read<AuthBloc>().state.userRole;
      final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';
      final number = '+998${phoneController.text.replaceAll(' ', '')}';

      context.read<AuthBloc>().add(
        AuthForgotPasswordSmsRequested(
          roleString,
          SmsRequestPayload(
            phoneNumber: number,
            method: 'recovery_password',
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AppAssets.ishYoo,
          height: 24,
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.otpSent) {
            context.router.push(
              ForgotPasswordOtpRoute(
                phoneNumber: '+998${phoneController.text.replaceAll(' ', '')}',
              ),
            );
          } else if (state.status == AuthStatus.failure) {
            AppNotificationOverlay.instance.show(
              message: state.errorMessage ?? 'Xatolik yuz berdi',
              type: .error,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: .all(16),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Text(
                      "Hisobga kirish",
                      textAlign: .center,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.textThemes.h5,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Hisob kirish uchun telefon raqamini kiriting',
                      textAlign: .center,
                      maxLines: 3,
                      overflow: .ellipsis,
                      style: context.textThemes.b1.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                AppInputField(
                  hintText: '00 000 00 00',
                  autofillHints: const [AutofillHints.telephoneNumberNational],
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  prefixIcon: const PhoneNumberFieldPrefix(),
                  label: 'Telefon raqami',
                ),
                Spacer(),
                SizedBox(height: 16),
                AppButton(
                  onTap: onRequestSms,
                  isLoading: state.status == AuthStatus.loading,
                  label: 'Davom etish',
                ),
                Flexible(flex: 0, child: SizedBox(height: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
