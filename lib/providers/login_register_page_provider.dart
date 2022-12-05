import 'package:flutter/material.dart';

class LoginRegisterPageProvider with ChangeNotifier {
  bool loginSwitch = false;
  bool registerSwitch = false;

  void updateloginSwitch(bool value) {
    loginSwitch = value;
    notifyListeners();
  }

  void updateregisterSwitch(bool value) {
    registerSwitch = value;
    notifyListeners();
  }
}
