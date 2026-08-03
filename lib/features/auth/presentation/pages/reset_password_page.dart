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
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart'
    as bloc_state;
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/auth/presentation/widgets/password_requirements.dart';

@RoutePage()
class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController(text: '');
    final passwordConfirmController = useTextEditingController();
    final isObscured = useState(true);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    void onResetPassword() {
      if (!formKey.currentState!.validate()) return;

      final authState = context.read<AuthBloc>().state;
      final requestId = authState.requestId;

      if (requestId == null) {
        AppNotificationOverlay.instance.show(
          message: 'auth.resetPassword.errors.general'.tr(),
          type: AppNotificationType.error,
        );
        return;
      }

      final role = authState.userRole;
      final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';

      context.read<AuthBloc>().add(
        AuthForgotPasswordResetRequested(
          roleString,
          ResetPasswordRequest(
            requestId: requestId,
            password: passwordController.text,
          ),
        ),
      );
    }

    void showSuccessDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: context.colors.bgPrimary,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: context.colors.brandDefault,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'auth.resetPassword.successDialog.title',
                    style: context.textThemes.h5,
                    textAlign: TextAlign.center,
                  ).tr(),
                  const SizedBox(height: 8),
                  Text(
                    'auth.resetPassword.successDialog.subtitle',
                    style: context.textThemes.b1.copyWith(
                      color: context.colors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ).tr(),
                  const SizedBox(height: 24),
                  AppButton(
                    onTap: () {
                      Navigator.of(context).pop();
                      context.router.replaceAll([
                        LoginRoute(
                          role:
                              context.read<AuthBloc>().state.userRole ??
                              UserRole.job_seeker,
                        ),
                      ]);
                    },
                    label: 'auth.resetPassword.buttons.saveAndLogin'.tr(),
                  ),
                ],
              ),
            ),
          );
        },
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
          if (state.status == bloc_state.AuthStatus.passwordResetSuccess) {
            showSuccessDialog();
          } else if (state.status == bloc_state.AuthStatus.failure) {
            AppNotificationOverlay.instance.show(
              message:
                  state.errorMessage ??
                  'auth.resetPassword.errors.general'.tr(),
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
                        "auth.resetPassword.title",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textThemes.h5,
                      ).tr(),
                      const SizedBox(height: 12),
                      Text(
                        'auth.resetPassword.subtitle',
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
                    hintText: "auth.confirmPassword.passwordHint".tr(),
                    autofillHints: const [AutofillHints.newPassword],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: AppValidators.password,
                    suffixIcon: IconButton(
                      onPressed: () => isObscured.value = !isObscured.value,
                      isSelected: isObscured.value,
                      selectedIcon: const Icon(Icons.visibility_off),
                      icon: const Icon(Icons.visibility),
                    ),
                  ),
                  const SizedBox(height: 12),
                  AppInputField(
                    obscureText: isObscured.value,
                    hintText: "auth.confirmPassword.confirmHint".tr(),
                    autofillHints: const [AutofillHints.newPassword],
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordConfirmController,
                    validator: (val) {
                      if (val != passwordController.text) {
                        return 'shared.validation.passwordsMustMatch'.tr();
                      }
                      return AppValidators.password(val);
                    },
                    suffixIcon: IconButton(
                      onPressed: () => isObscured.value = !isObscured.value,
                      isSelected: isObscured.value,
                      selectedIcon: const Icon(Icons.visibility_off),
                      icon: const Icon(Icons.visibility),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("auth.confirmPassword.requirements.title").tr(),
                  const SizedBox(height: 8),
                  ValueListenableBuilder(
                    valueListenable: passwordController,
                    builder: (_, value, _) => PasswordRequirements(
                      password: value.text,
                    ),
                  ),
                  const Spacer(),
                  AppButton(
                    onTap: onResetPassword,
                    isLoading: state.status == bloc_state.AuthStatus.loading,
                    label: 'auth.resetPassword.buttons.saveAndLogin'.tr(),
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
