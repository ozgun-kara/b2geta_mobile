import 'package:flutter/material.dart';

class CompanyProfilePageProvider with ChangeNotifier {
  int currentTabIndex = 4;

  final List pages = [];

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }

  bool filterSwitch = true;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }
}
