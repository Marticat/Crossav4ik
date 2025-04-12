import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode? mode) {
    if (mode != null) {
      _themeMode = mode;
      notifyListeners();
    }
  }
}