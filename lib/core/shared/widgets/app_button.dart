import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/themes/app_colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool enabled;
  final String label;
  final Color? color;
  const AppButton({
    super.key,
    required this.onTap,
    required this.label,
    this.enabled = true,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? appLightColors.brandDefault;

    final textColor = color.computeLuminance() > 0.5
        ? context.colors.midnightImmutable
        : context.colors.brightImmutable;

    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      children: [
        FilledButton(
          style: FilledButton.styleFrom(
            elevation: 3,
            disabledBackgroundColor: color.withValues(alpha: .5),
            backgroundColor: color,
            padding: .all(14),
            shape: RoundedRectangleBorder(borderRadius: .circular(12)),
          ),
          onPressed: enabled ? onTap : null,
          child: Text(
            label,
            style: context.textThemes.buttonLarge.copyWith(color: textColor),
          ),
        ),
      ],
    );
  }
}
