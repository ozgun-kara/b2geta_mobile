import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool themeSwitch = false;

  void updateThemeSwitch(bool value) {
    themeSwitch = value;

    notifyListeners();
  }
}
