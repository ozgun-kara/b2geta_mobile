import 'package:b2geta_mobile/services/theme_service.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  final darkTheme = ThemeData(
      // primarySwatch: Colors.grey,
      // primaryColor: Colors.black,
      // brightness: Brightness.dark,
      // backgroundColor: const Color(0xFF212121),
      // dividerColor: Colors.black12,
      );

  final lightTheme = ThemeData(
      // primarySwatch: Colors.grey,
      // primaryColor: Colors.white,
      // brightness: Brightness.light,
      // backgroundColor: const Color(0xFFE5E5E5),
      // dividerColor: Colors.white54,
      );

  var themeMode;

  ThemeData? _themeData;
  ThemeData? getTheme() => _themeData;

  ThemeProvider() {
    ThemeService.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      // var themeMode = value ?? 'light';

      themeMode = value ?? 'light';
      if (themeMode == 'light') {
        print('setting light theme');
        themeMode = 'light';
        _themeData = lightTheme;
      } else {
        print('setting dark theme');

        themeMode = 'dark';
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    themeMode = 'dark';
    ThemeService.saveData('themeMode', 'dark');

    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    themeMode = 'light';
    ThemeService.saveData('themeMode', 'light');
    notifyListeners();
  }
}
