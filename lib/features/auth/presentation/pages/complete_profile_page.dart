import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
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

    final isCompany = context.read<AuthBloc>().state.userRole == UserRole.employer;

    Future<void> onRegister() async {
      if (firstNameController.text.isEmpty || passwordController.text.isEmpty) {
        AppNotificationOverlay.instance.show(
          message: 'Iltimos barcha majburiy maydonlarni to\'ldiring',
          type: .warning,
        );
        return;
      }

      final deviceInfo = DeviceInfoPlugin();
      String deviceName = 'Unknown';
      try {
        if (Platform.isAndroid) {
          final info = await deviceInfo.androidInfo;
          deviceName = info.model;
        } else if (Platform.isIOS) {
          final info = await deviceInfo.iosInfo;
          deviceName = info.name;
        }
      } catch (_) {}

      final deviceId = const Uuid().v4();
      final role = context.read<AuthBloc>().state.userRole;
      final roleString = role == UserRole.job_seeker ? 'candidate' : 'employer';
      
      final authState = context.read<AuthBloc>().state;
      final requestId = authState.requestId;

      if (requestId == null) {
        AppNotificationOverlay.instance.show(
          message: 'Xatolik yuz berdi. Iltimos qaytadan urinib ko\'ring.',
          type: .error,
        );
        return;
      }

      final formattedNumber = phoneNumber != null ? '+998${phoneNumber!.replaceAll(' ', '')}' : null;

      context.read<AuthBloc>().add(
            AuthRegisterRequested(
              roleString,
              RegisterRequest(
                requestId: requestId,
                name: '${firstNameController.text} ${lastNameController.text}'.trim(),
                password: passwordController.text,
                deviceId: deviceId,
                deviceName: deviceName,
                companyName: isCompany ? companyNameController.text : null,
                phoneNumber: isCompany ? formattedNumber : null,
                isWaitlistedUser: false,
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Text(
                        "Shaxsiy ma’lumotlar",
                        textAlign: .center,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: context.textThemes.h5,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Shaxsiy ma’lumotlarni kiriting Foydalanuvchining ismi, familiyasi va tkompaniya nomi",
                        textAlign: .center,
                        maxLines: 3,
                        overflow: .ellipsis,
                        style: context.textThemes.b1.copyWith(
                          color: context.colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  AppInputField(
                    hintText: "Ismingizni kiriting",
                    autofillHints: [AutofillHints.name],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: firstNameController,
                  ),
                  SizedBox(height: 12),
                  AppInputField(
                    hintText: "Familiyangizni kiriting",
                    autofillHints: [AutofillHints.familyName],
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    controller: lastNameController,
                  ),
                  if (isCompany) ...[
                    SizedBox(height: 12),
                    AppInputField(
                      hintText: "Kompaniya nomi",
                      autofillHints: [AutofillHints.organizationName],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: companyNameController,
                    ),
                  ] else ...[
                    SizedBox(height: 12),
                    AppInputField(
                      hintText: "Tug’ilgan sana (YYYY.OO.KK)",
                      textInputAction: TextInputAction.next,
                      readOnly: true,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          initialDate: DateTime.tryParse(birthDateController.text),
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
                  SizedBox(height: 12),
                  AppInputField(
                    obscureText: isObscured.value,
                    hintText: "Yangi parol o'rnating",
                    autofillHints: [AutofillHints.newPassword],
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    suffixIcon: IconButton(
                      onPressed: () {
                        isObscured.value = !isObscured.value;
                      },
                      isSelected: isObscured.value,
                      selectedIcon: Icon(Icons.visibility_off),
                      icon: Icon(Icons.visibility),
                    ),
                  ),
                  SizedBox(height: 32),
                  AppButton(
                    onTap: onRegister,
                    isLoading: state.status == bloc_state.AuthStatus.loading,
                    label: 'Davom etish',
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
