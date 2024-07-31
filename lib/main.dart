import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:template01/storage/app_storage.dart';
import 'package:template01/utils/app_constants.dart';
import 'package:template01/utils/locales/app_translation.dart';
import 'package:template01/utils/themes/my_dark_theme.dart';
import 'package:template01/utils/themes/my_light_theme.dart';
import 'package:template01/view/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppStorage myStorage = AppStorage();
  ThemeMode themeMode = await myStorage.getThemeMode();
  Locale locale = await myStorage.getLocale();
  runApp(MyApp(
    themeMode: themeMode,locale: locale,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.themeMode , required this.locale});

  final ThemeMode themeMode;
  final Locale? locale;
  final AppTranslation appTranslation = AppTranslation();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      themeMode: themeMode,
      theme: myLightTheme,
      darkTheme: myDarkTheme,
      translations: appTranslation,
      translationsKeys: appTranslation.keys,
      locale: locale ,
      home: const HomeScreen(),
    );
  }
}
