import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color brandDefault;
  final Color brandProgress;
  final Color brandLight;
  final Color brandDark;

  final Color midnightMutable;
  final Color midnightImmutable;

  final Color brightMutable;
  final Color brightImmutable;

  final Color bgPrimary;
  final Color bgSecondary;
  final Color bgTertiary;
  final Color bgCard;

  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textDisabled;

  final Color linePrimary;
  final Color lineSecondary;

  final Color danger;
  final Color dangerLight;
  final Color dangerDark;

  final Color warning;
  final Color warningLight;
  final Color warningDark;

  final Color success;
  final Color successLight;
  final Color successDark;

  final Color info;
  final Color infoLight;
  final Color infoDark;

  const AppColors({
    required this.brandDefault,
    required this.brandProgress,
    required this.brandLight,
    required this.brandDark,
    required this.midnightMutable,
    required this.midnightImmutable,
    required this.brightMutable,
    required this.brightImmutable,
    required this.bgPrimary,
    required this.bgSecondary,
    required this.bgTertiary,
    required this.bgCard,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textDisabled,
    required this.linePrimary,
    required this.lineSecondary,
    required this.danger,
    required this.dangerLight,
    required this.dangerDark,
    required this.warning,
    required this.warningLight,
    required this.warningDark,
    required this.success,
    required this.successLight,
    required this.successDark,
    required this.info,
    required this.infoLight,
    required this.infoDark,
  });

  @override
  AppColors copyWith() => this;

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    Color lerpColor(Color a, Color b) => Color.lerp(a, b, t)!;

    return AppColors(
      brandDefault: lerpColor(brandDefault, other.brandDefault),
      brandProgress: lerpColor(brandProgress, other.brandProgress),
      brandLight: lerpColor(brandLight, other.brandLight),
      brandDark: lerpColor(brandDark, other.brandDark),

      midnightMutable: lerpColor(midnightMutable, other.midnightMutable),
      midnightImmutable: lerpColor(midnightImmutable, other.midnightImmutable),

      brightMutable: lerpColor(brightMutable, other.brightMutable),
      brightImmutable: lerpColor(brightImmutable, other.brightImmutable),

      bgPrimary: lerpColor(bgPrimary, other.bgPrimary),
      bgSecondary: lerpColor(bgSecondary, other.bgSecondary),
      bgTertiary: lerpColor(bgTertiary, other.bgTertiary),
      bgCard: lerpColor(bgCard, other.bgCard),

      textPrimary: lerpColor(textPrimary, other.textPrimary),
      textSecondary: lerpColor(textSecondary, other.textSecondary),
      textMuted: lerpColor(textMuted, other.textMuted),
      textDisabled: lerpColor(textDisabled, other.textDisabled),

      linePrimary: lerpColor(linePrimary, other.linePrimary),
      lineSecondary: lerpColor(lineSecondary, other.lineSecondary),

      danger: lerpColor(danger, other.danger),
      dangerLight: lerpColor(dangerLight, other.dangerLight),
      dangerDark: lerpColor(dangerDark, other.dangerDark),

      warning: lerpColor(warning, other.warning),
      warningLight: lerpColor(warningLight, other.warningLight),
      warningDark: lerpColor(warningDark, other.warningDark),

      success: lerpColor(success, other.success),
      successLight: lerpColor(successLight, other.successLight),
      successDark: lerpColor(successDark, other.successDark),

      info: lerpColor(info, other.info),
      infoLight: lerpColor(infoLight, other.infoLight),
      infoDark: lerpColor(infoDark, other.infoDark),
    );
  }
}

const appLightColors = AppColors(
  brandDefault: Color(0xFFCFED0D),
  brandProgress: Color(0xFFCFED0D),
  brandLight: Color(0xFFFBFFDD),
  brandDark: Color(0xFF3F4800),

  midnightMutable: Color(0xFF000000),
  midnightImmutable: Color(0xFF000000),

  brightMutable: Color(0xFFFFFFFF),
  brightImmutable: Color(0xFFFFFFFF),

  bgPrimary: Color(0xFFF6F6F6),
  bgSecondary: Color(0xFFEAEAEA),
  bgTertiary: Color(0xFFDCDCDC),
  bgCard: Color(0xFFF6F6F6),

  textPrimary: Color(0xFF1E1E1E),
  textSecondary: Color(0xFFA0A0A0),
  textMuted: Color(0xFF5B5B5B),
  textDisabled: Color(0xFFB9B9B9),

  linePrimary: Color(0xFFB9B9B9),
  lineSecondary: Color(0xFFD0D0D0),

  danger: Color(0xFFFF4040),
  dangerLight: Color(0xFFFFECEC),
  dangerDark: Color(0xFF772835),

  warning: Color(0xFFFFCA00),
  warningLight: Color(0xFFFFFCEE),
  warningDark: Color(0xFF755F11),

  success: Color(0xFF58D315),
  successLight: Color(0xFFF1F9F4),
  successDark: Color(0xFF1C5000),

  info: Color(0xFF0D93F2),
  infoLight: Color(0xFFE4F7FF),
  infoDark: Color(0xFF005069),
);

const appDarkColors = AppColors(
  brandDefault: Color(0xFFCFED0D),
  brandProgress: Color(0xFF3F4800),
  brandLight: Color(0xFF3F4800),
  brandDark: Color(0xFFFBFFDD),

  midnightMutable: Color(0xFFFFFFFF),
  midnightImmutable: Color(0xFF000000),

  brightMutable: Color(0xFF161616),
  brightImmutable: Color(0xFFFFFFFF),

  bgPrimary: Color(0xFF1E1E1E),
  bgSecondary: Color(0xFF282828),
  bgTertiary: Color(0xFF333333),
  bgCard: Color(0xFF0E0E0E),

  textPrimary: Color(0xFFFFFFFF),
  textSecondary: Color(0xFFA0A0A0),
  textMuted: Color(0xFFE1E1E1),
  textDisabled: Color(0xFFA0A0A0),

  linePrimary: Color(0xFF252525),
  lineSecondary: Color(0xFF333333),

  danger: Color(0xFFFF4040),
  dangerLight: Color(0xFF772835),
  dangerDark: Color(0xFFFECEEC),

  warning: Color(0xFFFFCA00),
  warningLight: Color(0xFF755F11),
  warningDark: Color(0xFFFFFCEE),

  success: Color(0xFF58D315),
  successLight: Color(0xFF1C5000),
  successDark: Color(0xFFF1F9F4),

  info: Color(0xFF0D93F2),
  infoLight: Color(0xFF005069),
  infoDark: Color(0xFFE4F7FF),
);
