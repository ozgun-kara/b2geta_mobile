import 'package:flutter/material.dart';

class LoginRegisterPageProvider with ChangeNotifier {
  // LOGIN PAGE
  bool loginSwitch = false;

  // REGISTER PAGE
  bool registerSwitch = false;

  void updateLoginSwitch(bool value) {
    loginSwitch = value;
    notifyListeners();
  }

  void updateRegisterSwitch(bool value) {
    registerSwitch = value;
    notifyListeners();
  }
}
