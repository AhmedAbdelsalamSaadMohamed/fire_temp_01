import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template01/storage/app_storage.dart';

class SettingsController extends GetxController {
  static SettingsController get to {
    try {
      return Get.find<SettingsController>();
    } catch (e) {
      return Get.put(SettingsController());
    }
  }

  Future<ThemeMode>? _themeMode;
  Future<Locale>? _locale;
  AppStorage myStorage = AppStorage();
  Future<Locale> get locale => _locale?? myStorage.getLocale();

  set locale(Future<Locale> value) {
    _locale = value;
    locale.then((value) {
      _changeLocale(value);
      myStorage.setLocale(value)
;    },);
  }



  Future<ThemeMode> get themeMode {
    return _themeMode ?? myStorage.getThemeMode();
  }

  set themeMode(Future<ThemeMode> mode) {
    _themeMode = mode;
    mode.then(
      (value) {
        _changeThemeMode(value);

        myStorage.setThemeMode(value);
      },
    );
  }

  _changeThemeMode(ThemeMode mode) {
    Get.changeThemeMode(mode);
    update();
  }

  _changeLocale(Locale locale) {
    Get.updateLocale(locale);
    update();
  }
}
