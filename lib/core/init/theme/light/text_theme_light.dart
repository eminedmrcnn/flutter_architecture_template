

import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight? get instance {
    if (_instance == null) {
      _instance = TextThemeLight._init();
    }
  }

  TextThemeLight._init();

  final TextStyle headline1 = TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );
}
