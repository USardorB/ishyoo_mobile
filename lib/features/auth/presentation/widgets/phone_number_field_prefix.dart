import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class PhoneNumberFieldPrefix extends StatelessWidget {
  const PhoneNumberFieldPrefix({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      margin: const .symmetric(horizontal: 8, vertical: 6),
      padding: const .symmetric(horizontal: 16, vertical: 9),
      constraints: const BoxConstraints(maxWidth: 80),
      decoration: BoxDecoration(
        color: context.colors.bgSecondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '+998',
        style: context.textThemes.buttonLarge,
      ),
    );
  }
}
