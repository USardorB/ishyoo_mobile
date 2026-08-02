import 'dart:io';

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
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/auth/presentation/widgets/phone_number_field_prefix.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class LoginPage extends HookWidget {
  final UserRole role;
  const LoginPage({
    super.key,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<AuthBloc>().add(AuthRoleChanged(role));
      return;
    }, [role]);

    final phoneController = useTextEditingController(text: '942351906');
    final passwordController = useTextEditingController(text: 'password');
    final isObscured = useState(true);

    Future<void> onLogin() async {
      if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
        AppNotificationOverlay.instance.show(
          message: 'auth.login.errors.general'.tr(),
          type: .warning,
        );
        return;
      }

      String deviceName =
          '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';

      final deviceId = const Uuid().v4();
      final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';

      final number = '+998${phoneController.text.replaceAll(' ', '')}';

      context.read<AuthBloc>().add(
        AuthLoginRequested(
          roleString,
          LoginRequest(
            phoneNumber: number,
            password: passwordController.text,
            deviceId: deviceId,
            deviceName: deviceName,
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
          if (state.status == AuthStatus.authenticated) {
            context.router.replaceAll([const MainLayoutRoute()]);
          } else if (state.status == AuthStatus.waitlisted) {
            context.router.replaceAll([const WaitlistedRoute()]);
          } else if (state.status == AuthStatus.failure) {
            AppNotificationOverlay.instance.show(
              message: state.errorMessage ?? 'auth.login.errors.general'.tr(),
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
                      "auth.login.title",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textThemes.h5,
                    ).tr(),
                    const SizedBox(height: 12),
                    Text(
                      'auth.login.subtitle',
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
                  autofillHints: const [AutofillHints.telephoneNumberNational],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  prefixIcon: const PhoneNumberFieldPrefix(),
                  label: 'auth.login.phoneLabel'.tr(),
                ),
                const SizedBox(height: 12),
                AppInputField(
                  obscureText: isObscured.value,
                  hintText: '********',
                  autofillHints: const [AutofillHints.password],
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  label: 'auth.login.passwordLabel'.tr(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      isObscured.value = !isObscured.value;
                    },
                    isSelected: isObscured.value,
                    selectedIcon: const Icon(Icons.visibility_off),
                    icon: const Icon(Icons.visibility),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.router.push(const ForgotPasswordRoute());
                    },
                    child: Text(
                      'auth.login.buttons.forgotPassword',
                      style: context.textThemes.b1,
                    ).tr(),
                  ),
                ),
                const Spacer(),
                const SizedBox(height: 16),
                AppButton(
                  onTap: onLogin,
                  isLoading: state.status == AuthStatus.loading,
                  label: 'auth.login.buttons.login'.tr(),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'auth.login.registrationPrompt.text',
                      textAlign: TextAlign.center,
                      style: context.textThemes.b1,
                    ).tr(),
                    TextButton(
                      onPressed: () {
                        context.router.push(
                          RegisterRoute(phoneNumber: phoneController.text),
                        );
                      },
                      child: Text(
                        'auth.login.registrationPrompt.link',
                        style: context.textThemes.b1,
                      ).tr(),
                    ),
                  ],
                ),
                Align(
                  child: TextButton(
                    onPressed: () =>
                        context.router.replaceAll([const MainLayoutRoute()]),
                    style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      foregroundColor: context.colors.textSecondary,
                    ),
                    child: Text(
                      "auth.login.buttons.skip",
                      style: context.textThemes.buttonMedium,
                    ).tr(),
                  ),
                ),
                const Flexible(flex: 0, child: SizedBox(height: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
