import 'package:flutter/material.dart';
import 'package:mobile/core/enums/password_requirement_type.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class PasswordRequirements extends StatelessWidget {
  final String password;
  const PasswordRequirements({
    super.key,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: PasswordRequirementType.values
          .map(
            (type) => _buildRequirement(
              context,
              text: type.text,
              isMet: _isRequirementMet(type),
            ),
          )
          .toList(),
    );
  }

  bool _isRequirementMet(PasswordRequirementType type) {
    switch (type) {
      case PasswordRequirementType.minLength:
        return password.length >= 8;
      case PasswordRequirementType.hasCapitalLetter:
        return password.contains(RegExp(r'[A-Z]'));
      case PasswordRequirementType.hasNumber:
        return password.contains(RegExp(r'[0-9]'));
    }
  }

  Widget _buildRequirement(
    BuildContext context, {
    required String text,
    required bool isMet,
  }) {
    final color = isMet ? context.colors.success : context.colors.danger;
    return Row(
      children: [
        CircleAvatar(
          radius: 9,
          foregroundColor: color,
          backgroundColor: context.colors.bgSecondary,
          child: Icon(
            isMet ? Icons.check : Icons.close,
            size: 16,
          ),
        ),
        const SizedBox(width: 8),
        Text(text, style: context.textThemes.c1.copyWith(color: color)),
      ],
    );
  }
}
