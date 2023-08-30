import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/marketplace/marketplace_model.dart';
import 'package:b2geta_mobile/models/products/product_model.dart';
import 'package:b2geta_mobile/services/marketplace/marketplace_services.dart';
import 'package:b2geta_mobile/services/products/products_services.dart';
import 'package:flutter/material.dart';

class MarketPlacePageProvider with ChangeNotifier {
  final List<ProductModel> _productList = [];
  bool _isLoadMore = false;
  bool _isFinished = false;

  List<ProductModel> get productList => _productList;

  bool get isLoadMore => _isLoadMore;
  bool get isFinished => _isFinished;

  void updateIsLoadMore(bool value) {
    _isLoadMore = value;
    notifyListeners();
  }

  Future getProducts(
      {bool isRefresh = false,
      required Map<String, String> queryParameters}) async {
    if (isRefresh) {
      _productList.clear();
    }
    await locator<ProductsServices>()
        .allProductsListAndSearchCall(queryParameters: queryParameters)
        .then((products) {
      if (products.isNotEmpty) {
        for (var product in products) {
          _productList.add(product);
        }
      } else {
        _isFinished = true;
      }
    });

    notifyListeners();
  }

  // MARKETPLACE PAGE
  MarketPlaceModel? marketPlaceModel;

  Future getMarketPlaceData() async {
    await locator<MarketplaceServices>().getData().then((marketplaceModel) {
      if (marketplaceModel != null) {
        marketPlaceModel = marketplaceModel;
      }
    });

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
