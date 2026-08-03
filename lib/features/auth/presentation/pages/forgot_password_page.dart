import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:mobile/core/shared/widgets/app_notification.dart';
import 'package:mobile/core/utils/app_validators.dart';
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
    final formKey = useMemoized(() => GlobalKey<FormState>());

    void onRequestSms() {
      if (!formKey.currentState!.validate()) return;

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
              message:
                  state.errorMessage ??
                  'auth.forgotPassword.errors.general'.tr(),
              type: AppNotificationType.error,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "auth.forgotPassword.title",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textThemes.h5,
                      ).tr(),
                      const SizedBox(height: 12),
                      Text(
                        'auth.forgotPassword.subtitle',
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.textThemes.b1.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ).tr(),
                    ],
                  ),
                  const SizedBox(height: 32),
                  AppInputField(
                    hintText: '99 888 99 88',
                    autofillHints: const [
                      AutofillHints.telephoneNumberNational,
                    ],
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    validator: AppValidators.required,
                    prefixIcon: const PhoneNumberFieldPrefix(),
                    label: 'auth.forgotPassword.phoneLabel'.tr(),
                  ),
                  const Spacer(),
                  const SizedBox(height: 16),
                  AppButton(
                    onTap: onRequestSms,
                    isLoading: state.status == AuthStatus.loading,
                    label: 'auth.forgotPassword.buttons.getCode'.tr(),
                  ),
                  const Flexible(flex: 0, child: SizedBox(height: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
