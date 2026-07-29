import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class PrivacyPolicyNotice extends StatelessWidget {
  const PrivacyPolicyNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.textThemes.b2.copyWith(
          color: context.colors.textSecondary,
        ),
        children: [
          TextSpan(text: 'auth.privacy_notice.text1'.tr()),
          TextSpan(
            text: 'auth.privacy_notice.privacy_policy'.tr(),
            style: const TextStyle().copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: 'auth.privacy_notice.and'.tr()),
          TextSpan(
            text: 'auth.privacy_notice.terms'.tr(),
            style: const TextStyle().copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: 'auth.privacy_notice.text2'.tr()),
        ],
      ),
    );
  }
}
