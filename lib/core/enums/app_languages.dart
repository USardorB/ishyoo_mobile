import 'package:flutter/material.dart';

enum AppLanguages {
  uzLat(
    code: 'uz_LAT',
    locale: Locale('uz', 'LAT'),
    title: "O'zbek",
    subtitle: "Lotin yozuvida",
  ),
  uzKr(
    code: 'uz_KR',
    locale: Locale('uz', 'KR'),
    title: "Ўзбекча",
    subtitle: "Кирилл ёзувида",
  ),
  ru(
    code: 'ru',
    locale: Locale('ru'),
    title: "Русский",
    subtitle: "На русском",
  ),
  en(
    code: 'en',
    locale: Locale('en'),
    title: "English",
    subtitle: "In English",
  );

  final String code;
  final Locale locale;
  final String title;
  final String subtitle;

  const AppLanguages({
    required this.code,
    required this.locale,
    required this.title,
    required this.subtitle,
  });

  static AppLanguages fromLocale(Locale locale) {
    if (locale.languageCode == 'uz') {
      final country = locale.countryCode?.toUpperCase();
      final script = locale.scriptCode?.toUpperCase();
      if (country == 'KR' || country == 'CYRL' || script == 'KR' || script == 'CYRL') {
        return AppLanguages.uzKr;
      }
      return AppLanguages.uzLat;
    }
    if (locale.languageCode == 'ru') return AppLanguages.ru;
    return AppLanguages.en;
  }
}
