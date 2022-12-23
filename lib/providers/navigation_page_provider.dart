import 'package:b2geta_mobile/views/homepage/home_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/marketplace/marketplace_page.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/product_detail_subpage.dart';
import 'package:b2geta_mobile/views/test_pages/categories_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/company_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/messages_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/orhers_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/products_test_page.dart';
import 'package:flutter/material.dart';

class NavigationPageProvider with ChangeNotifier {
  int currentTabIndex = 0;

  final List pages = [
    // CompanyTestPage(),
    OthersTestPage(),
    // MessagesTestPage(),
    // CategoriesTestPage(),
    // ProductsTestPage(),


    // HomePage(),
    MarketplacePage(),
    RegisterPage(),
    ProductDetailSubpage(),
  ];

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }
}
