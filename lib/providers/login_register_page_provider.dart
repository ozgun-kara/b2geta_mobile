import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/login_register/country_model.dart';
import 'package:b2geta_mobile/services/login_register/country_service.dart';
import 'package:flutter/material.dart';

class LoginRegisterPageProvider with ChangeNotifier {
  // LOGIN PAGE

  bool loginSwitch = false;

  void updateLoginSwitch(bool value) {
    loginSwitch = value;
    notifyListeners();
  }

////////////////////////////////////////////////

  // REGISTER PAGE

  List<CountryModel> dropdownItems = [];
  String? dropdownSelectedValue;
  bool registerSwitch = false;

  fetchDropdownList() async {
    dropdownItems = await locator.get<CountryService>().getCountryList();
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
