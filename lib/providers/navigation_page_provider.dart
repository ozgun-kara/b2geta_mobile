import 'package:b2geta_mobile/views/basket/basket_page.dart';
import 'package:b2geta_mobile/views/explore/explore_page.dart';
import 'package:b2geta_mobile/views/homepage/home_page.dart';
import 'package:b2geta_mobile/views/marketplace/marketplace_page.dart';
import 'package:b2geta_mobile/views/my_account/my_account_page.dart';
import 'package:flutter/material.dart';

class NavigationPageProvider with ChangeNotifier {
  int currentTabIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const MarketPlacePageCopy(),
    const BasketPage(),
    const ExplorePage(),
    const MyAccountPage(),
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
