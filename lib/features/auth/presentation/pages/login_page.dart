import 'dart:io';

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

    final phoneController = useTextEditingController(text: '');
    final passwordController = useTextEditingController();
    final isObscured = useState(true);

    Future<void> onLogin() async {
      if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
        AppNotificationOverlay.instance.show(
          message: 'Iltimos telefon raqam va parolni kiriting',
          type: .warning,
        );
        return;
      }

      String deviceName = '${Platform.operatingSystem} ${Platform.operatingSystemVersion}';

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
                      'Hisob kirish uchun telefon raqam va parolni kiriting',
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
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  prefixIcon: PhoneNumberFieldPrefix(),
                  label: 'Telefon raqami',
                ),
                SizedBox(height: 12),
                AppInputField(
                  obscureText: isObscured.value,
                  hintText: '********',
                  autofillHints: [AutofillHints.password],
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  label: 'Parol',
                  suffixIcon: IconButton(
                    onPressed: () {
                      isObscured.value = !isObscured.value;
                    },
                    isSelected: isObscured.value,
                    selectedIcon: Icon(Icons.visibility_off),
                    icon: Icon(Icons.visibility),
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: .centerRight,
                  child: TextButton(
                    onPressed: () => AppNotificationOverlay.instance.show(
                      message: 'Will be implemented in the future releases!',
                      type: .warning,
                    ),
                    child: Text(
                      'Parolni unutdingizmi?',
                      style: context.textThemes.b1,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(height: 16),
                AppButton(
                  onTap: onLogin,
                  isLoading: state.status == AuthStatus.loading,
                  label: 'Kirish',
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Yangimisiz?',
                      textAlign: .center,
                      style: context.textThemes.b1,
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.push(
                          RegisterRoute(phoneNumber: phoneController.text),
                        );
                      },
                      child: Text(
                        'Ro\'yxatdan o\'ting',
                        style: context.textThemes.b1,
                      ),
                    ),
                  ],
                ),
                Align(
                  child: TextButton(
                    onPressed: () =>
                        context.router.replaceAll([const MainLayoutRoute()]),
                    style: TextButton.styleFrom(
                      tapTargetSize: .shrinkWrap,
                      visualDensity: .compact,
                      foregroundColor: context.colors.textSecondary,
                    ),
                    child: Text(
                      "O'tkazib yuborish",
                      style: context.textThemes.buttonMedium,
                    ),
                  ),
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
