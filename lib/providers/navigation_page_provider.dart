import 'package:b2geta_mobile/views/language_selection_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:flutter/material.dart';

class NavigationPageProvider with ChangeNotifier {
  int currentTabIndex = 0;

  final List pages = [
    RegisterPage(),
    LanguageSelectionPage(),
    Container(),
    Container(),
  ];

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }
}
