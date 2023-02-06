import 'package:b2geta_mobile/views/basket/basket_page.dart';
import 'package:b2geta_mobile/views/homepage/home_page.dart';
import 'package:b2geta_mobile/views/marketplace/marketplace_page.dart';
import 'package:b2geta_mobile/views/profile/company/company_profile_page.dart';
import 'package:flutter/material.dart';

class NavigationPageProvider with ChangeNotifier {
  int currentTabIndex = 0;

  final List<Widget> pages = [
    // MemberTestPage(),
    const HomePage(),
    //ProductsTestPage(),
    // BasketTestPage(),
    // CompanyTestPage(),
    // FollowServicesTestPage(),
    // MessagesTestPage(),
    // CategoriesTestPage(),
    // OthersTestPage(),

    // HomePage(),
    const MarketplacePage(),
    const BasketPage(),
    const CompanyProfilPage()
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
