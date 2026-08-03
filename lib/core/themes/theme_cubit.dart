import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences _prefs;
  static const String _themeKey = 'user_theme_mode';

  ThemeCubit(this._prefs) : super(_loadInitialTheme(_prefs));

  static ThemeMode _loadInitialTheme(SharedPreferences prefs) {
    final savedTheme = prefs.getString(_themeKey);
    if (savedTheme == 'light') return ThemeMode.light;
    if (savedTheme == 'dark') return ThemeMode.dark;
    if (savedTheme == 'system') return ThemeMode.system;
    return ThemeMode.dark;
  }

  void changeTheme(ThemeMode mode) {
    emit(mode);
    switch (mode) {
      case ThemeMode.light:
        _prefs.setString(_themeKey, 'light');
        break;
      case ThemeMode.dark:
        _prefs.setString(_themeKey, 'dark');
        break;
      case ThemeMode.system:
        _prefs.setString(_themeKey, 'system');
        break;
    }
  }
}
