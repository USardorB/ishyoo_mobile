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
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart' as bloc_state;
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/auth/presentation/widgets/phone_number_field_prefix.dart';
import 'package:mobile/features/auth/presentation/widgets/privacy_policy_notice.dart';

@RoutePage()
class RegisterPage extends HookWidget {
  final String? phoneNumber;
  const RegisterPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final phoneController = useTextEditingController(text: phoneNumber);

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
            AuthSmsRequested(
              roleString,
              SmsRequestPayload(
                phoneNumber: number,
                method: 'register',
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
      body: BlocConsumer<AuthBloc, bloc_state.AuthState>(
        listener: (context, state) {
          if (state.status == bloc_state.AuthStatus.otpSent) {
            context.pushRoute(
              OtpConfirmationRoute(phoneNumber: phoneController.text),
            );
          } else if (state.status == bloc_state.AuthStatus.failure) {
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
                      "Yangi hisob yaratish",
                      textAlign: .center,
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: context.textThemes.h5,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Hisob yaratish uchun telefon raqamingizni kiriting',
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
                  hintText: '99 888 99 88',
                  autofillHints: [AutofillHints.telephoneNumberNational],
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  prefixIcon: PhoneNumberFieldPrefix(),
                  label: 'Telefon raqami',
                ),
                Spacer(),
                AppButton(
                  onTap: onRequestSms,
                  isLoading: state.status == bloc_state.AuthStatus.loading,
                  label: 'Davom etish',
                ),
                SizedBox(height: 12),
                PrivacyPolicyNotice(),
                SizedBox(height: 32),
                Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Accountingiz mavjudmi?',
                      textAlign: .center,
                      style: context.textThemes.b1,
                    ),
                    TextButton(
                      onPressed: context.pop,
                      style: TextButton.styleFrom(
                        tapTargetSize: .shrinkWrap,
                        visualDensity: .compact,
                      ),
                      child: Text(
                        'Bu yerda kiring',
                        style: context.textThemes.b1,
                      ),
                    ),
                  ],
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
