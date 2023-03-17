import 'dart:io';

import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/general/city_model.dart';
import 'package:b2geta_mobile/models/general/district_model.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:flutter/material.dart';
import 'package:b2geta_mobile/models/general/country_model.dart';

class MenuPageProvider with ChangeNotifier {
  // MY ADDRESSES SUBPAGE
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

  fetchCityList(String countryCode) async {
    cityList.clear();
    districtList.clear();
    cityList = await locator<GeneralService>().citiesCall(country: countryCode);
    notifyListeners();
  }

  void updateSelectedCity(String value) {
    selectedCity = value;
    notifyListeners();
  }

  fetchDistrictList(String cityId) async {
    districtList = await locator<GeneralService>().townListCall(city: cityId);
    notifyListeners();
  }

  void updateSelectedDistrict(String value) {
    selectedDistrict = value;
    notifyListeners();
  }

  // MY PRODUCTS SUBPAGE
  List<File>? imageFilesList = [];

  void updateSelectedImageFilesList(List<File> imgFilesList) {
    imageFilesList!.addAll(imgFilesList);
    notifyListeners();
  }

  void deleteSelectedImage(File image) {
    imageFilesList!.remove(image);
    notifyListeners();
  }

  void clearSelectedImageFilesList() {
    imageFilesList!.clear();
    notifyListeners();
  }
}
