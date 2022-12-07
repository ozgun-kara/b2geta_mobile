import 'package:flutter/material.dart';

class MarketPlacePageProvider with ChangeNotifier {
  bool filterSwitch = true;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }
}
