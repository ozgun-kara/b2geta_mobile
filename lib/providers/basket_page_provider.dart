import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/basket/basket_model.dart';
import 'package:b2geta_mobile/services/basket/basket_services.dart';
import 'package:flutter/material.dart';

class BasketPageProvider with ChangeNotifier {
  List<BasketModel> basketList = [];

  Future<void> getAllBasket() async {
    await locator<BasketServices>().getAllCall().then((list) {
      basketList = list;
    });

    notifyListeners();
  }
}
