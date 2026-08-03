import 'package:flutter/material.dart';
import 'package:mobile/core/themes/app_colors.dart';
import 'package:mobile/core/themes/app_typography.dart';

extension AppThemeExtension on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
  AppTypography get textThemes => Theme.of(this).extension<AppTypography>()!;
}
