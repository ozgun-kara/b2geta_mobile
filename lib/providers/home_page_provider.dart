import 'package:flutter/material.dart';

class HomePageProvider with ChangeNotifier {
  bool checkBox = true;

  void updateCheckBox(bool value) {
    checkBox = value;
    notifyListeners();
  }
}
