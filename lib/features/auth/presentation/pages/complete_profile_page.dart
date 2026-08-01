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
import 'package:mobile/features/auth/presentation/bloc/auth_state.dart'
    as bloc_state;
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/auth/presentation/widgets/waitlist_location_dialog.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class CompleteProfilePage extends HookWidget {
  final String? phoneNumber;

  const CompleteProfilePage({
    super.key,
    this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    final firstNameController = useTextEditingController(text: '');
    final lastNameController = useTextEditingController();
    final companyNameController = useTextEditingController();
    final birthDateController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isObscured = useState(true);

    final isCompany =
        context.read<AuthBloc>().state.userRole == UserRole.employer;

    Future<void> onRegister() async {
      if (firstNameController.text.isEmpty || passwordController.text.isEmpty) {
        AppNotificationOverlay.instance.show(
          message: 'auth.complete_profile.fill_all'.tr(),
          type: .warning,
        );
        return;
      }

      String deviceName =
          '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';

      final deviceId = const Uuid().v4();
      final role = context.read<AuthBloc>().state.userRole;
      final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';

      final authState = context.read<AuthBloc>().state;
      final requestId = authState.requestId;

      if (requestId == null) {
        AppNotificationOverlay.instance.show(
          message: 'shared.error_occurred'.tr(),
          type: .error,
        );
        return;
      }

      final formattedNumber = phoneNumber != null
          ? '+998${phoneNumber!.replaceAll(' ', '')}'
          : null;

      final isFromNamangan = await WaitlistLocationDialog.show(context);
      if (isFromNamangan == null) return; // User dismissed the sheet

      if (!context.mounted) return;
      context.read<AuthBloc>().add(
        AuthRegisterRequested(
          roleString,
          RegisterRequest(
            requestId: requestId,
            name: '${firstNameController.text} ${lastNameController.text}'
                .trim(),
            password: passwordController.text,
            deviceId: deviceId,
            deviceName: deviceName,
            companyName: isCompany ? companyNameController.text : null,
            phoneNumber: isCompany ? formattedNumber : null,
            isWaitlistedUser: !isFromNamangan,
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
          if (state.status == bloc_state.AuthStatus.authenticated) {
            context.router.replaceAll([const MainLayoutRoute()]);
          } else if (state.status == bloc_state.AuthStatus.waitlisted) {
            context.router.replaceAll([const WaitlistedRoute()]);
          } else if (state.status == bloc_state.AuthStatus.failure) {
            AppNotificationOverlay.instance.show(
              message: state.errorMessage ?? 'shared.error_occurred'.tr(),
              type: .error,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "auth.complete_profile.title",
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textThemes.h5,
                      ).tr(),
                      const SizedBox(height: 12),
                      Text(
                        "auth.complete_profile.subtitle",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.textThemes.b1.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ).tr(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AppInputField(
                    hintText: "auth.complete_profile.first_name_hint".tr(),
                    autofillHints: const [AutofillHints.name],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: firstNameController,
                  ),
                  const SizedBox(height: 12),
                  AppInputField(
                    hintText: "auth.complete_profile.last_name_hint".tr(),
                    autofillHints: const [AutofillHints.familyName],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: lastNameController,
                  ),
                  if (isCompany) ...[
                    const SizedBox(height: 12),
                    AppInputField(
                      hintText: "auth.complete_profile.company_name_hint".tr(),
                      autofillHints: const [AutofillHints.organizationName],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: companyNameController,
                    ),
                  ] else ...[
                    const SizedBox(height: 12),
                    AppInputField(
                      hintText: "auth.complete_profile.birth_date_hint".tr(),
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          initialDate: DateTime.tryParse(
                            birthDateController.text,
                          ),
                          currentDate: DateTime.now(),
                        );
                        if (date == null) return;
                        birthDateController.value = TextEditingValue(
                          text: DateFormat('yyyy.MM.dd').format(date),
                        );
                      },
                      controller: birthDateController,
                    ),
                  ],
                  const SizedBox(height: 12),
                  AppInputField(
                    obscureText: isObscured.value,
                    hintText: "auth.complete_profile.new_password_hint".tr(),
                    autofillHints: const [AutofillHints.newPassword],
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        isObscured.value = !isObscured.value;
                      },
                      isSelected: isObscured.value,
                      selectedIcon: const Icon(Icons.visibility_off),
                      icon: const Icon(Icons.visibility),
                    ),
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                    onTap: onRegister,
                    isLoading: state.status == bloc_state.AuthStatus.loading,
                    label: 'shared.continue'.tr(),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
