import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/themes/app_colors.dart';

enum ButtonWidthType {
  shrink,
  expand,
}

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool enabled;
  final String? label;
  final IconData? icon;
  final Color? color;
  final TextStyle? labelStyle;
  final Color? foregroundColor;
  final ButtonWidthType widthType;
  const AppButton({
    this.widthType = ButtonWidthType.expand,
    this.foregroundColor,
    this.labelStyle,
    super.key,
    required this.onTap,
    this.label,
    this.enabled = true,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    assert(label != null || icon != null, 'Label or icon is required');
    final color = this.color ?? appLightColors.brandDefault;

    final textColor = color.computeLuminance() > 0.5
        ? context.colors.midnightImmutable
        : context.colors.brightImmutable;

    return Column(
      crossAxisAlignment: widthType == .expand ? .stretch : .center,
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
          child: Row(
            mainAxisSize: .min,
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            spacing: 4,
            children: [
              if (icon != null) Icon(icon, color: foregroundColor ?? textColor),
              if (label != null)
                Flexible(
                  child: Text(
                    label!,
                    style: (labelStyle ?? context.textThemes.buttonLarge)
                        .copyWith(color: foregroundColor ?? textColor),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
