import 'package:b2geta_mobile/views/basket/basket_page.dart';
import 'package:b2geta_mobile/views/homepage/home_page.dart';
import 'package:b2geta_mobile/views/login_register/register_page.dart';
import 'package:b2geta_mobile/views/marketplace/marketplace_page.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/product_detail_subpage.dart';
import 'package:b2geta_mobile/views/marketplace/subpages/shopping_summary_subpage.dart';
import 'package:b2geta_mobile/views/profile/company/conpany_profile_page.dart';
import 'package:b2geta_mobile/views/profile/company/subpages/company_orders_subpages.dart';
import 'package:b2geta_mobile/views/profile/company/subpages/company_profile_menu_subpage.dart';
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
    HomePage(),
    //ProductsTestPage(),
    // BasketTestPage(),
    // CompanyTestPage(),
    // FollowServicesTestPage(),
    // MessagesTestPage(),
    // CategoriesTestPage(),
    // OthersTestPage(),

    // HomePage(),
    MarketplacePage(),
    BasketPage(),
    // ProductDetailSubpage(),
    // CompanyProfileMenuSubpage(),
    // CompanyOrdersSubpage(),
    CompanyProfilPage()
  ];

  bool searchState = false;

  void updateCurrentTabIndex(int value) {
    currentTabIndex = value;
    notifyListeners();
  }

  void updateSearchState() {
    searchState = !searchState;
    notifyListeners();
  }
}
