import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/basket_model.dart';
import 'package:b2geta_mobile/services/basket/basket_services.dart';
import 'package:flutter/material.dart';

class BasketPageProvider with ChangeNotifier {
  List<BasketModel> basketList = [];
  List<int> quantityList = [];

  void setQuantityListLength() async {
    // basketList = await BasketServices().getAllCall();

    basketList = await locator<BasketServices>().getAllCall();

    for (var i = 0; i < basketList.length; i++) {
      quantityList.add(int.parse(basketList[i].quantity.toString()));
    }

    notifyListeners();
  }

  void increaseItemCount(int index) {
    quantityList[index]++;
    notifyListeners();
  }

  void decreaseItemCount(int index) {
    if (quantityList[index] > 1) {
      quantityList[index]--;
    }
    notifyListeners();
  }

  void deleteItemCount(int index) {
    quantityList.removeAt(index);
    notifyListeners();
  }
}
