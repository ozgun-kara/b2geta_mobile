import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool themeSwitch = false;

  Color? pageBackgroundColor1;
  Color? pageBackgroundColor2;

  void updateThemeSwitch(bool value) {
    themeSwitch = value;

    if (value == false) {
      pageBackgroundColor1 = const Color(0xFFFFFFFF);
      pageBackgroundColor2 = const Color(0xFFFBFCFF);

    } else {
      pageBackgroundColor1 = const Color(0xFF21233A);
      pageBackgroundColor2 = const Color(0xFF21233A);
    }

    notifyListeners();
  }
}
