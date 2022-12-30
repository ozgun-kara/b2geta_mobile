import 'package:flutter/material.dart';

class HomepageProvider with ChangeNotifier {
  bool checkBox = true;

  void updateCheckBox(bool value) {
    checkBox = value;
    notifyListeners();
  }
}
