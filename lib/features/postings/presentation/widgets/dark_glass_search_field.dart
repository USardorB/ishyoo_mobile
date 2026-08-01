import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/extensions/app_theme_extension.dart';
import 'package:mobile/core/routes/app_router.gr.dart';

class DarkGlassSearchField extends StatelessWidget {
  final Widget? prefixIcon;
  final String? hintText;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool autoFocus;

  const DarkGlassSearchField({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.onTap,
    this.controller,
    this.onSubmitted,
    this.onChanged,
    this.readOnly = false,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
                width: 1.5,
              ),
            ),
            child: SearchBarTheme(
              data: const SearchBarThemeData(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.transparent,
                ),
                elevation: WidgetStatePropertyAll(
                  0,
                ),
              ),
              child: SearchBar(
                controller: controller,
                onSubmitted: onSubmitted,
                onChanged: onChanged,
                autoFocus: autoFocus,
                hintText: hintText ?? "shared.search".tr(),
                hintStyle: WidgetStatePropertyAll(
                  context.textThemes.buttonLarge.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
                leading: prefixIcon,
                onTap: readOnly
                    ? null
                    : () {
                        if (onTap != null) {
                          onTap!();
                        } else if (context.routeData.name !=
                            TalentsSearchResultRoute.name) {
                          context.pushRoute(TalentsSearchResultRoute());
                        }
                      },
              ),
            ),
          ),
        ),
      ),
    );

    if (readOnly) {
      content = GestureDetector(
        onTap:
            onTap ??
            () {
              if (context.routeData.name != TalentsSearchResultRoute.name) {
                context.pushRoute(TalentsSearchResultRoute());
              }
            },
        child: AbsorbPointer(
          child: content,
        ),
      );
    }

    return content;
  }
}
