import 'package:flutter/material.dart';

class MarketPlaceProvider with ChangeNotifier {
  bool filterSwitch = true;
  int productDetailTab = 0;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }

  void updateProductDetailTab(int value) {
    productDetailTab = value;
    notifyListeners();
  }
}
