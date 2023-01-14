import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  int _tabIndex = 0;
  get tabIndex => _tabIndex;

  void updateTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }
}
