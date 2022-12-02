import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool themeSwitch = false;

  late ThemeData _selectedTheme;

  ThemeData light = ThemeData.light().copyWith(primaryColor: Colors.green);

  ThemeData dark = ThemeData.dark().copyWith(primaryColor: Colors.black);

  ThemeProvider({required bool isDarkMode}) {
    if (isDarkMode) {
      _selectedTheme = dark;
    } else {
      _selectedTheme = light;
    }
  }

  ThemeData get getTheme => _selectedTheme;

  void swapTheme() {
    _selectedTheme = _selectedTheme == dark ? light : dark;

    themeSwitch = !themeSwitch;

    notifyListeners();
  }

  void updateThemeSwitch(bool value) {
    themeSwitch = value;

    notifyListeners();
  }
}
