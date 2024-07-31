import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final String _themeKey = 'theme';
  final Map<String, ThemeMode> _themeData = {
    ThemeMode.dark.toString(): ThemeMode.dark,
    ThemeMode.light.toString(): ThemeMode.light,
    ThemeMode.system.toString(): ThemeMode.system
  };
  final String _languageKey = 'languageCode';
  final String _countryKey = 'countryCode';

  setThemeMode(ThemeMode mode) {
    _prefs.then((prefs) {
      prefs.setString(_themeKey, mode.toString());
    });
  }

  Future<ThemeMode> getThemeMode() {
    return _prefs.then((prefs) => (_themeData[prefs.getString(_themeKey)]) ?? ThemeMode.system);
  }

  setLocale(Locale locale) {
    _prefs.then((prefs) {
      prefs.setString(_languageKey, locale.languageCode);
      prefs.setString(_countryKey, locale.countryCode ?? 'US');
    });
  }

  Future<Locale> getLocale() {
    return _prefs.then((prefs) => Locale(prefs.getString(_languageKey) ?? 'en', prefs.getString(_countryKey)));
  }
}
