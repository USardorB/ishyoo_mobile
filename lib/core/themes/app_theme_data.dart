import 'package:flutter/material.dart';
import 'package:mobile/core/themes/app_colors.dart';
import 'package:mobile/core/themes/app_typography.dart';

abstract final class AppThemeData {
  static ThemeData get light => ThemeData().copyWith(
    colorScheme: ColorScheme.light(
      primary: appLightColors.brandDefault,
      error: appDarkColors.danger,
    ),
    scaffoldBackgroundColor: appLightColors.brightMutable,
    appBarTheme: AppBarTheme(
      backgroundColor: appLightColors.brightMutable,
      surfaceTintColor: Colors.transparent,
    ),
    brightness: Brightness.light,
    extensions: <ThemeExtension<dynamic>>[
      appLightColors,
      AppTypography.euidCircularA(),
    ],
  );

  static ThemeData get dark => ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: appDarkColors.brandDefault,
      error: appDarkColors.danger,
    ),
    scaffoldBackgroundColor: appDarkColors.brightMutable,
    appBarTheme: AppBarTheme(
      backgroundColor: appDarkColors.brightMutable,
      surfaceTintColor: Colors.transparent,
    ),
    brightness: Brightness.dark,
    extensions: <ThemeExtension<dynamic>>[
      appDarkColors,
      AppTypography.euidCircularA(),
    ],
  );
}
