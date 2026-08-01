import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
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
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "auth.confirm_password.title",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textThemes.h5,
                ).tr(),
                const SizedBox(height: 12),
                Text(
                  "auth.confirm_password.subtitle",
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
              hintText: "auth.confirm_password.password_hint".tr(),
              autofillHints: const [AutofillHints.newPassword],
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordController,
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
              hintText: "auth.confirm_password.confirm_hint".tr(),
              autofillHints: const [AutofillHints.newPassword],
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              controller: passwordConfirmController,
              suffixIcon: IconButton(
                onPressed: () => isObscured.value = !isObscured.value,
                isSelected: isObscured.value,
                selectedIcon: const Icon(Icons.visibility_off),
                icon: const Icon(Icons.visibility),
              ),
            ),
            const SizedBox(height: 16),
            const Text("auth.confirm_password.requirements_title").tr(),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: passwordController,
              builder: (_, value, _) => PasswordRequirements(
                password: value.text,
              ),
            ),
            const Spacer(),
            AppButton(
              onTap: () {},
              label: 'shared.continue'.tr(),
            ),
            const Flexible(flex: 0, child: SizedBox(height: 12)),
          ],
        ),
      ),
    );
  }
}
