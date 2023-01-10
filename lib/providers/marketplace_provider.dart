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

  int productDimensionIndex = 0;
  int productColorIndex = 0;
  int productDetailTab = 0;
  bool ratingCheckBox1 = true;
  bool ratingCheckBox2 = false;
  bool ratingCheckBox3 = false;
  bool ratingCheckBox4 = false;
  bool ratingCheckBox5 = false;
  int productCommentsTab = 0;

  void updateProductDimensionIndex(int value) {
    productDimensionIndex = value;
    notifyListeners();
  }

  void updateProductColorIndex(int value) {
    productColorIndex = value;
    notifyListeners();
  }

  void updateProductDetailTab(int value) {
    productDetailTab = value;
    notifyListeners();
  }

  void updateRatingCheckBox(int checkBoxNumber) {
    if (checkBoxNumber == 1) {
      ratingCheckBox1 = !ratingCheckBox1;
    } else if (checkBoxNumber == 2) {
      ratingCheckBox2 = !ratingCheckBox2;
    } else if (checkBoxNumber == 3) {
      ratingCheckBox3 = !ratingCheckBox3;
    } else if (checkBoxNumber == 4) {
      ratingCheckBox4 = !ratingCheckBox4;
    } else {
      ratingCheckBox5 = !ratingCheckBox5;
    }
    notifyListeners();
  }

  void updateProductCommentsTab(int value) {
    productCommentsTab = value;
    notifyListeners();
  }
}
