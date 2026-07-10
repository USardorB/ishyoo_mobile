import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';

class AppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? label;
  final bool enabled;
  final VoidCallback? onTap;
  final List<String> autofillHints;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;

  const AppInputField({
    super.key,
    this.controller,
    this.validator,
    this.minLines,
    this.maxLines = 1,
    this.hintText,
    this.enabled = true,
    this.onTap,
    this.readOnly = false,
    this.autofillHints = const [],
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.phone,
    this.prefixIcon,
    this.label,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        if (label != null) ...[
          Text(
            label!,
            textAlign: .start,
            style: context.textThemes.s3,
          ),
          SizedBox(height: 8),
        ],
        TextFormField(
          minLines: minLines,
          maxLines: maxLines,
          readOnly: readOnly,
          style: context.textThemes.buttonLarge,
          autofillHints: autofillHints,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          enabled: enabled,
          onTap: onTap,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            errorStyle: context.textThemes.b1,
            hintText: hintText,
            hintStyle: context.textThemes.buttonLarge.copyWith(
              color: context.colors.textSecondary,
            ),

            border: OutlineInputBorder(
              borderRadius: .circular(12),
              borderSide: BorderSide(color: context.colors.bgPrimary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: .circular(12),
              borderSide: BorderSide(color: context.colors.bgPrimary),
            ),
            filled: true,
            fillColor: context.colors.bgPrimary,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
