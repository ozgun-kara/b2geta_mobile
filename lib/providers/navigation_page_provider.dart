import 'package:b2geta_mobile/views/homepage/home_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/marketplace/marketplace_page.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/product_detail_subpage.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/shopping_summary_subpage.dart';
import 'package:b2geta_mobile/views/test_pages/basket_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/categories_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/company_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/follow_services_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/member_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/messages_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/orhers_test_page.dart';
import 'package:b2geta_mobile/views/test_pages/products_test_page.dart';
import 'package:flutter/material.dart';

class NavigationPageProvider with ChangeNotifier {
  int currentTabIndex = 0;

  final List pages = [
    // MemberTestPage(),
    ProductsTestPage(),
    // BasketTestPage(),
    // CompanyTestPage(),
    // FollowServicesTestPage(),
    // MessagesTestPage(),
    // CategoriesTestPage(),
    // OthersTestPage(),

    // HomePage(),
    MarketplacePage(),
    ShoppingSummarySubpage(),
    // ProductDetailSubpage(),
    Container(),
  ];

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }
}
