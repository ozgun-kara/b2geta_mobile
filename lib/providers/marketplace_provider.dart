import 'package:flutter/material.dart';

class MarketPlaceProvider with ChangeNotifier {
  // MARKETPLACE PAGE
  bool filterSwitch = true;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }

  ////////////////////////////////////////////////

  // PRODUCT DETAIL SUBPAGE
  int productDetailTab = 0;
  bool ratingCheckBox1 = true;
  bool ratingCheckBox2 = false;
  bool ratingCheckBox3 = false;
  bool ratingCheckBox4 = false;
  bool ratingCheckBox5 = false;

  void updateProductDetailTab(int value) {
    productDetailTab = value;
    notifyListeners();
  }

  void updateRatingCheckBox1() {
    ratingCheckBox1 = !ratingCheckBox1;
    notifyListeners();
  }
}
