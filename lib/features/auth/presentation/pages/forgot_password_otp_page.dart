import 'dart:async';

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
import 'package:mobile/features/auth/data/models/auth_request.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart'
    as bloc_state;
import 'package:pinput/pinput.dart';

@RoutePage()
class ForgotPasswordOtpPage extends HookWidget {
  final String? phoneNumber;
  const ForgotPasswordOtpPage({
    super.key,
    this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final otpController = useTextEditingController();

    final authState = context.read<AuthBloc>().state;
    final initialTtl = authState.ttl ?? 60;
    final remainingSeconds = useState<int>(initialTtl);

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (remainingSeconds.value > 0) {
          remainingSeconds.value = remainingSeconds.value - 1;
        } else {
          timer.cancel();
        }
      });
      return timer.cancel;
    }, [initialTtl]);

    useEffect(() {
      if (authState.otp != null && otpController.text.isEmpty) {
        otpController.text = authState.otp.toString();
      }
      return null;
    }, [authState.otp]);

    void onVerify() {
      if (otpController.text.length < 5) {
        AppNotificationOverlay.instance.show(
          message: 'auth.otp.enter_full'.tr(),
          type: .warning,
        );
        return;
      }

      final role = context.read<AuthBloc>().state.userRole;
      final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';
      final requestId = authState.requestId;

      if (requestId == null) {
        AppNotificationOverlay.instance.show(
          message: 'shared.error_occurred'.tr(),
          type: .error,
        );
        return;
      }

      context.read<AuthBloc>().add(
        AuthForgotPasswordVerifyRequested(
          roleString,
          VerifyRequest(
            requestId: requestId,
            code: int.parse(otpController.text),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppAssets.ishYoo, height: 24),
      ),
      body: BlocConsumer<AuthBloc, bloc_state.AuthState>(
        listener: (context, state) {
          if (state.status == bloc_state.AuthStatus.verified) {
            context.pushRoute(const ResetPasswordRoute());
          } else if (state.status == bloc_state.AuthStatus.failure) {
            AppNotificationOverlay.instance.show(
              message: state.errorMessage ?? 'auth.otp.invalid_code'.tr(),
              type: .error,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'auth.otp.subtitle',
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: context.textThemes.b1.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ).tr(args: [phoneNumber ?? '']),
                  ],
                ),
                const SizedBox(height: 32),
                Pinput(
                  controller: otpController,
                  length: 5,
                  focusedPinTheme: PinTheme(
                    width: 64,
                    height: 68,
                    decoration: BoxDecoration(
                      color: context.colors.bgPrimary,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: context.colors.brandDefault,
                      ),
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 64,
                    height: 68,
                    decoration: BoxDecoration(
                      color: context.colors.bgPrimary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Align(
                  child: TextButton(
                    onPressed: remainingSeconds.value == 0
                        ? () {
                            remainingSeconds.value = 60;
                            final role = context
                                .read<AuthBloc>()
                                .state
                                .userRole;
                            final roleString = role == UserRole.job_seeker
                                ? 'candidate'
                                : 'employer';
                            if (phoneNumber != null) {
                              context.read<AuthBloc>().add(
                                AuthForgotPasswordSmsRequested(
                                  roleString,
                                  SmsRequestPayload(
                                    phoneNumber: phoneNumber!,
                                    method: 'recovery_password',
                                  ),
                                ),
                              );
                            }
                          }
                        : null,
                    style: TextButton.styleFrom(
                      disabledForegroundColor: context.colors.textSecondary,
                    ),
                    child: Text(
                      remainingSeconds.value == 0
                          ? 'auth.otp.new_code'.tr()
                          : 'auth.otp.resend_in'.tr(args: ['00:${remainingSeconds.value.toString().padLeft(2, '0')}']),
                    ),
                  ),
                ),
                const Spacer(),
                AppButton(
                  onTap: onVerify,
                  isLoading: state.status == bloc_state.AuthStatus.loading,
                  label: 'auth.otp.verify_button'.tr(),
                ),
                const SizedBox(height: 12),
                const Flexible(flex: 0, child: SizedBox(height: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
