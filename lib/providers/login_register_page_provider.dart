import 'package:b2geta_mobile/services/login_register/country_service.dart';
import 'package:flutter/material.dart';

class LoginRegisterPageProvider with ChangeNotifier {
  // LOGIN PAGE
  bool loginSwitch = false;

  // REGISTER PAGE
  List<String> dropdownItems = [];
  String? dropdownSelectedValue;
  bool registerSwitch = false;

////////////////////////////////////////////////

  // LOGIN PAGE
  void updateLoginSwitch(bool value) {
    loginSwitch = value;
    notifyListeners();
  }

  // REGISTER PAGE
  fetch() async {
    dropdownItems = await CountryService().getCountryList();
    notifyListeners();
  }

  void updateDropdownSelectedValue(String value) {
    dropdownSelectedValue = value;
    notifyListeners();
  }

  void updateRegisterSwitch(bool value) {
    registerSwitch = value;
    notifyListeners();
  }
}
