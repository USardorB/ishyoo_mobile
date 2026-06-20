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
      textAlign: .center,
      text: TextSpan(
        style: context.textThemes.b2.copyWith(
          color: context.colors.textSecondary,
        ),
        children: [
          TextSpan(text: 'Davom etish tugmasini bosish bilan siz '),
          TextSpan(
            text: 'Maxfiylik siyosatiga',
            style: TextStyle().copyWith(decoration: .underline),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: ' va '),
          TextSpan(
            text: 'Foydalanish shartlariga',
            style: TextStyle().copyWith(decoration: .underline),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: ' rozilik berasiz.'),
        ],
      ),
    );
  }
}
