import 'package:b2geta_mobile/views/homepage/home_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/marketplace/marketplace_page.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/product_detail_subpage.dart';
import 'package:flutter/material.dart';

class NavigationPageProvider with ChangeNotifier {
  int currentTabIndex = 0;

  final List pages = [
    HomePage(),
    MarketplacePage(),
    RegisterPage(),
    ProductDetailSubpage(),
  ];

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }
}
