import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/general_models/city_model.dart';
import 'package:b2geta_mobile/models/general_models/district_model.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:flutter/material.dart';
import 'package:b2geta_mobile/models/general_models/country_model.dart';

class MenuPageProvider with ChangeNotifier {
  // ADD & UPDATE ADDRESSES SUBPAGE
  List<CountryModel> countryList = [];
  String? selectedCountry;
  List<CityModel> cityList = [];
  String? selectedCity;
  List<DistrictModel> districtList = [];
  String? selectedDistrict;

  fetchCountryList() async {
    countryList = await locator<GeneralService>().countriesCall();
    notifyListeners();
  }

  void updateSelectedCountry(String value) {
    selectedCountry = value;
    notifyListeners();
  }

  fetchCityList() async {
    cityList = await locator<GeneralService>().citiesCall(country: 'TR');
    notifyListeners();
  }

  void updateSelectedCity(String value) {
    selectedCity = value;
    notifyListeners();
  }

  fetchDistrictList() async {
    districtList = await locator<GeneralService>().townListCall(city: '2188');
    notifyListeners();
  }

  void updateSelectedDistrict(String value) {
    selectedDistrict = value;
    notifyListeners();
  }
}
