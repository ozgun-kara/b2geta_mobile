import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool themeSwitch = false;

  Color? pageBackgroundColor;

  void updateThemeSwitch(bool value) {
    themeSwitch = value;

    if (value == false) {
      pageBackgroundColor = const Color(0xFFFFFFFF);
    } else {
      pageBackgroundColor = const Color(0xFF21233A);
    }

    notifyListeners();
  }
}
