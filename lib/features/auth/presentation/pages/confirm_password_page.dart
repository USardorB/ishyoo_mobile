import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/core/consts/app_assets.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/shared/widgets/app_button.dart';
import 'package:mobile/features/auth/presentation/widgets/app_input_field.dart';
import 'package:mobile/features/auth/presentation/widgets/password_requirements.dart';

@RoutePage()
class ConfirmPasswordPage extends HookWidget {
  const ConfirmPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController(text: '');
    final passwordConfirmController = useTextEditingController();
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
                  "Ro'yxatdan o'tish",
                  textAlign: .center,
                  maxLines: 1,
                  overflow: .ellipsis,
                  style: context.textThemes.h5,
                ),
                SizedBox(height: 12),
                Text(
                  "Accountingiz uchun xafsiz bo'lgan, xech qayerda takrorlanmagan, parol o'ylab toping",
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
              hintText: "Parol o‘ylab toping",
              autofillHints: [AutofillHints.newPassword],
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
              suffixIcon: IconButton(
                onPressed: () => isObscured.value = !isObscured.value,
                isSelected: isObscured.value,
                selectedIcon: Icon(Icons.visibility_off),
                icon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 12),
            AppInputField(
              obscureText: isObscured.value,
              hintText: "Parolni tasdiqlang",
              autofillHints: [AutofillHints.newPassword],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordConfirmController,
              suffixIcon: IconButton(
                onPressed: () => isObscured.value = !isObscured.value,
                isSelected: isObscured.value,
                selectedIcon: Icon(Icons.visibility_off),
                icon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 16),
            Text("Parolga qo‘yiladigan talablar:"),
            SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: passwordController,
              builder: (_, value, _) => PasswordRequirements(
                password: value.text,
              ),
            ),
            Spacer(),
            AppButton(
              onTap: () {},
              label: 'Davom etish',
            ),
            Flexible(flex: 0, child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}
