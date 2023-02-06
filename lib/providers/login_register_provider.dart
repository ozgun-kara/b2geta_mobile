import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/general_models/country_model.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:flutter/material.dart';

class LoginRegisterProvider with ChangeNotifier {
  // LOGIN PAGE
  bool loginPasswordVisible = false;
  bool loginSwitch = false;

  void updateLoginPasswordVisible() {
    loginPasswordVisible = !loginPasswordVisible;
    notifyListeners();
  }

  void updateLoginSwitch(bool value) {
    loginSwitch = value;
    notifyListeners();
  }

////////////////////////////////////////////////

  // REGISTER PAGE
  bool registerPasswordVisible = false;
  List<CountryModel> dropdownItems = [];
  String? dropdownSelectedValue;
  bool registerSwitch = false;

  void updateRegisterPasswordVisible() {
    registerPasswordVisible = !registerPasswordVisible;
    notifyListeners();
  }

  fetchDropdownList() async {
    dropdownItems = await locator<GeneralService>().countriesCall();
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
