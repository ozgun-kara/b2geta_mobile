import 'package:flutter/material.dart';

class LoginRegisterPageProvider with ChangeNotifier {
  bool loginPasswordVisible = false;
  bool loginCheckBox = false;

  bool registerSwitch = false;

  bool resetPasswordVisible1 = false;
  bool resetPasswordVisible2 = false;

  void updateLoginPasswordVisible() {
    loginPasswordVisible = !loginPasswordVisible;
    notifyListeners();
  }

  void updateLoginCheckBox(bool value) {
    loginCheckBox = value;
    notifyListeners();
  }

  void updateregisterSwitch(bool value) {
    registerSwitch = value;
    notifyListeners();
  }

  void updateResetPasswordVisible1() {
    resetPasswordVisible1 = !resetPasswordVisible1;
    notifyListeners();
  }

  void updateResetPasswordVisible2() {
    resetPasswordVisible2 = !resetPasswordVisible2;
    notifyListeners();
  }
}
