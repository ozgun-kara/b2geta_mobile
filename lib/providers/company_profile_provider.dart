import 'package:flutter/material.dart';

class CompanyProfileProvider with ChangeNotifier {
  int currentTabIndex = 4;

  final List pages = [];

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }
}
