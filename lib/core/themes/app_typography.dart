import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;

  final TextStyle s1;
  final TextStyle s2;
  final TextStyle s3;

  final TextStyle b1;
  final TextStyle b2;
  final TextStyle b3;

  final TextStyle c1;
  final TextStyle c2;
  final TextStyle c3;

  final TextStyle buttonGiant;
  final TextStyle buttonLarge;
  final TextStyle buttonMedium;
  final TextStyle buttonSmall;
  final TextStyle buttonRegular;
  final TextStyle buttonTiny;

  const AppTypography({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.b1,
    required this.b2,
    required this.b3,
    required this.c1,
    required this.c2,
    required this.c3,
    required this.buttonGiant,
    required this.buttonLarge,
    required this.buttonMedium,
    required this.buttonSmall,
    required this.buttonRegular,
    required this.buttonTiny,
  });

  factory AppTypography.euidCircularA() {
    TextStyle style(
      double size,
      FontWeight weight, {
      String? debugLabel,
    }) {
      return GoogleFonts.inter(
        fontSize: size,
        height: 1.12,
        letterSpacing: 0,
        fontWeight: weight,
      );
    }

    return AppTypography(
      h1: style(48, FontWeight.w600),
      h2: style(40, FontWeight.w600),
      h3: style(32, FontWeight.w600),
      h4: style(28, FontWeight.w500),
      h5: style(24, FontWeight.w500),

      s1: style(20, FontWeight.w500),
      s2: style(18, FontWeight.w500),
      s3: style(16, FontWeight.w500),

      b1: style(16, FontWeight.w400),
      b2: style(14, FontWeight.w400),
      b3: style(14, FontWeight.w500),

      c1: style(12, FontWeight.w400),
      c2: style(12, FontWeight.w500),
      c3: style(10, FontWeight.w500),

      buttonGiant: style(18, FontWeight.w400),
      buttonLarge: style(16, FontWeight.w400),
      buttonMedium: style(14, FontWeight.w400),
      buttonSmall: style(12, FontWeight.w400),
      buttonRegular: style(10, FontWeight.w400),
      buttonTiny: style(10, FontWeight.w400),
    );
  }

  @override
  AppTypography copyWith({
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? s1,
    TextStyle? s2,
    TextStyle? s3,
    TextStyle? b1,
    TextStyle? b2,
    TextStyle? b3,
    TextStyle? c1,
    TextStyle? c2,
    TextStyle? c3,
    TextStyle? buttonGiant,
    TextStyle? buttonLarge,
    TextStyle? buttonMedium,
    TextStyle? buttonSmall,
    TextStyle? buttonRegular,
    TextStyle? buttonTiny,
  }) {
    return AppTypography(
      h1: h1 ?? this.h1,
      h2: h2 ?? this.h2,
      h3: h3 ?? this.h3,
      h4: h4 ?? this.h4,
      h5: h5 ?? this.h5,
      s1: s1 ?? this.s1,
      s2: s2 ?? this.s2,
      s3: s3 ?? this.s3,
      b1: b1 ?? this.b1,
      b2: b2 ?? this.b2,
      b3: b3 ?? this.b3,
      c1: c1 ?? this.c1,
      c2: c2 ?? this.c2,
      c3: c3 ?? this.c3,
      buttonGiant: buttonGiant ?? this.buttonGiant,
      buttonLarge: buttonLarge ?? this.buttonLarge,
      buttonMedium: buttonMedium ?? this.buttonMedium,
      buttonSmall: buttonSmall ?? this.buttonSmall,
      buttonRegular: buttonRegular ?? this.buttonRegular,
      buttonTiny: buttonTiny ?? this.buttonTiny,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;

    return AppTypography(
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h4: TextStyle.lerp(h4, other.h4, t)!,
      h5: TextStyle.lerp(h5, other.h5, t)!,
      s1: TextStyle.lerp(s1, other.s1, t)!,
      s2: TextStyle.lerp(s2, other.s2, t)!,
      s3: TextStyle.lerp(s3, other.s3, t)!,
      b1: TextStyle.lerp(b1, other.b1, t)!,
      b2: TextStyle.lerp(b2, other.b2, t)!,
      b3: TextStyle.lerp(b3, other.b3, t)!,
      c1: TextStyle.lerp(c1, other.c1, t)!,
      c2: TextStyle.lerp(c2, other.c2, t)!,
      c3: TextStyle.lerp(c3, other.c3, t)!,
      buttonGiant: TextStyle.lerp(buttonGiant, other.buttonGiant, t)!,
      buttonLarge: TextStyle.lerp(buttonLarge, other.buttonLarge, t)!,
      buttonMedium: TextStyle.lerp(buttonMedium, other.buttonMedium, t)!,
      buttonSmall: TextStyle.lerp(buttonSmall, other.buttonSmall, t)!,
      buttonRegular: TextStyle.lerp(buttonRegular, other.buttonRegular, t)!,
      buttonTiny: TextStyle.lerp(buttonTiny, other.buttonTiny, t)!,
    );
  }
}
