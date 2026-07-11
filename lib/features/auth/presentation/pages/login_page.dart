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
import 'package:mobile/features/auth/presentation/controllers/auth_cubit.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/auth/presentation/widgets/phone_number_field_prefix.dart';

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
      context.read<AuthCubit>().changeUserRole(role);
      return;
    }, [role]);

    final phoneController = useTextEditingController(text: '');
    final passwordController = useTextEditingController();
    final isObscured = useState(true);
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          AppAssets.ishYoo,
          height: 24,
        ),
      ),
      body: SafeArea(
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
              onTap: () => context.router.replaceAll([const MainLayoutRoute()]),
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
                onPressed: () => context.router.replaceAll([const MainLayoutRoute()]),
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
      ),
    );
  }
}
