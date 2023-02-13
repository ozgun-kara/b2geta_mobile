import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:flutter/material.dart';
import 'package:b2geta_mobile/models/general_models/country_model.dart';

class MenuPageProvider with ChangeNotifier {
  List<CountryModel> dropdownItems1 = [];
  String? dropdownSelectedValue1;
  List<CountryModel> dropdownItems2 = [];
  String? dropdownSelectedValue2;
  List<CountryModel> dropdownItems3 = [];
  String? dropdownSelectedValue3;

  fetchDropdownList1() async {
    dropdownItems1 = await locator<GeneralService>().countriesCall();
    notifyListeners();
  }

  void updateDropdownSelectedValue1(String value) {
    dropdownSelectedValue1 = value;
    notifyListeners();
  }

  fetchDropdownList2() async {
    dropdownItems1 = await locator<GeneralService>().countriesCall();
    notifyListeners();
  }

  void updateDropdownSelectedValue2(String value) {
    dropdownSelectedValue2 = value;
    notifyListeners();
  }

  fetchDropdown1List3() async {
    dropdownItems3 = await locator<GeneralService>().countriesCall();
    notifyListeners();
  }

  void updateDropdownSelectedValue3(String value) {
    dropdownSelectedValue3 = value;
    notifyListeners();
  }
}
