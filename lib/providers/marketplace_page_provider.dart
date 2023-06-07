import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:flutter/material.dart';

class MarketPlacePageProvider with ChangeNotifier {
  // MARKETPLACE PAGE

  List<ProductModel> productList = [];
  final int _limit = 25;
  int _offset = 0;
  int _page = 0;

  bool _isMoreData = false;
  get isMoreData => _isMoreData;

  void onRefresh() {
    _offset = 0;
    _page = 0;
    _isMoreData = false;
    productList.clear();
    getProducts();
  }

  Future getProducts() async {
    await locator<ProductsServices>()
        .allProductsListAndSearchCall(queryParameters: {
      "offset": _offset.toString(),
      "limit": _limit.toString(),
    }).then((products) {
      List<ProductModel> tempList = [];
      for (var product in products) {
        tempList.add(product);
      }
      if (tempList.isEmpty) {
        _isMoreData = false;
      } else {
        _isMoreData = true;
      }
      _page++;

      _offset = _page * _limit;
      addProductToProductList(tempList);
    });

    notifyListeners();
  }

  void addProductToProductList(List<ProductModel> products) {
    productList.addAll(products);

    notifyListeners();
  }

  bool filterSwitch = true;

  void updateFilterSwitch(bool value) {
    filterSwitch = value;
    notifyListeners();
  }

  ////////////////////////////////////////////////

  // PRODUCT DETAIL SUBPAGE

  int productImageIndex = 0;
  int productCountIndex = 0;
  int productDimensionIndex = 0;
  int productColorIndex = 0;
  int productDetailTab = 0;
  bool ratingCheckBox1 = true;
  bool ratingCheckBox2 = false;
  bool ratingCheckBox3 = false;
  bool ratingCheckBox4 = false;
  bool ratingCheckBox5 = false;
  int productCommentsTab = 0;

  void updateProductImageIndex(int value) {
    productImageIndex = value;
    notifyListeners();
  }

  void updateProductCountIndex(int value) {
    productCountIndex = value;
    notifyListeners();
  }

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
