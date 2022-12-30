import 'package:flutter/material.dart';

class MarketPlaceProvider with ChangeNotifier {
  bool filterSwitch = true;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }
}
