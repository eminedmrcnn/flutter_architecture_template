import 'package:flutter/material.dart';
import 'package:flutter_onboard/core/init/theme/app_theme.dart';
import 'package:flutter_onboard/core/init/theme/light/text_theme_light.dart';
import 'package:flutter_onboard/core/init/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme{
  static AppThemeLight? _instance;
  static AppThemeLight? get instance {
    if (_instance == null) {
      _instance = AppThemeLight._init();
    }
    return _instance;
  }

  AppThemeLight._init();

  // ThemeData get theme => redTheme;
  ThemeData get theme => ThemeData (
        // colorScheme: _appColorsScheme(),
        textTheme: TextTheme(
          // headline1: TextThemeLight.instance!.headline1,
          headline1: textThemeLight!.headline1,
        ),
      );

  ColorScheme _appColorsScheme() {
    return ColorScheme(
          primary: Colors.red,
          primaryVariant: Colors.green,
          secondary: Colors.grey,
          secondaryVariant: Colors.cyan,
          surface: Colors.blue,
          background: Colors.lightGreen,
          error: Colors.yellow,
          onPrimary: Colors.black12,
          onSecondary: Colors.white10,
          onSurface: Colors.redAccent,
          onBackground: Colors.deepPurple,
          onError: Colors.red.shade100,
          brightness: Brightness.light);
  }
}
