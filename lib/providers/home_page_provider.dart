import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  int _tabIndex = 0;
  get tabIndex => _tabIndex;

  int uploadState = 0; // 0,1,2,3

  void updateTabIndex(int value) {
    _tabIndex = value;
    notifyListeners();
  }

  void updateUploadState(int value) {
    uploadState = value;
    notifyListeners();
  }
}
