import 'package:flutter/material.dart';

class MarketPlacePageProvider with ChangeNotifier {
  bool filterSwitch = false;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }
}
