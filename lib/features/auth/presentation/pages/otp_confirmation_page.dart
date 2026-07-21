import 'dart:async';

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
import 'package:pinput/pinput.dart';

@RoutePage()
class OtpConfirmationPage extends HookWidget {
  final String? phoneNumber;
  const OtpConfirmationPage({
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
          message: 'Kodni to\'liq kiriting',
          type: .warning,
        );
        return;
      }

      final role = context.read<AuthBloc>().state.userRole;
      final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';
      final requestId = authState.requestId;

      if (requestId == null) {
        AppNotificationOverlay.instance.show(
          message: 'Request ID topilmadi. Qaytadan urinib ko\'ring.',
          type: .error,
        );
        return;
      }

      context.read<AuthBloc>().add(
            AuthVerifyRequested(
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
            context.pushRoute(CompleteProfileRoute(phoneNumber: phoneNumber));
          } else if (state.status == bloc_state.AuthStatus.failure) {
            AppNotificationOverlay.instance.show(
              message: state.errorMessage ?? 'Kod noto\'g\'ri',
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
                      'Tasdiqlash kodi $phoneNumber telefon raqamiga yuborildi',
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
                Pinput(
                  controller: otpController,
                  length: 5,
                  focusedPinTheme: PinTheme(
                    width: 64,
                    height: 68,
                    decoration: BoxDecoration(
                      color: context.colors.bgPrimary,
                      borderRadius: .circular(16),
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
                      borderRadius: .circular(16),
                    ),
                  ),
                ),
                Align(
                  child: TextButton(
                    onPressed: remainingSeconds.value == 0
                        ? () {
                            // TODO: Dispatch AuthSmsRequested again to resend code
                            remainingSeconds.value = 60;
                          }
                        : null,
                    style: TextButton.styleFrom(
                      disabledForegroundColor: context.colors.textSecondary,
                    ),
                    child: Text(
                      remainingSeconds.value == 0
                          ? 'Qayta yuborish'
                          : '00:${remainingSeconds.value.toString().padLeft(2, '0')}',
                    ),
                  ),
                ),
                Spacer(),
                AppButton(
                  onTap: onVerify,
                  isLoading: state.status == bloc_state.AuthStatus.loading,
                  label: 'Tasdiqlash',
                ),
                SizedBox(height: 12),
                Flexible(flex: 0, child: SizedBox(height: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
