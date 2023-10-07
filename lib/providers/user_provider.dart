import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/general/city_model.dart';
import 'package:b2geta_mobile/models/general/country_model.dart';
import 'package:b2geta_mobile/models/general/district_model.dart';
import 'package:b2geta_mobile/models/user/user_model.dart';
import 'package:b2geta_mobile/services/general_service.dart';
import 'package:b2geta_mobile/services/member/member_services.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel();
  UserModel get getUser => _user;

  updateUserModel(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<void> getProfile() async {
    await locator<MemberServices>().getProfileCall().then((value) {
      if (value != null) {
        updateUserModel(value);
      }
    });
    notifyListeners();
  }

  List<CountryModel> countryList = [];
  String? selectedCountry;
  List<CityModel> cityList = [];
  String? selectedCity;
  List<DistrictModel> districtList = [];
  String? selectedDistrict;

  Future<void> fetchCountryList() async {
    countryList = await locator<GeneralService>().countriesCall();
    notifyListeners();
  }

  void updateSelectedCountry(String value) {
    selectedCountry = value;
    notifyListeners();
  }

  Future<void> fetchCityList(String countryCode) async {
    cityList.clear();
    districtList.clear();
    cityList = await locator<GeneralService>().citiesCall(country: countryCode);
    notifyListeners();
  }

  void updateSelectedCity(String value) {
    selectedCity = value;
    notifyListeners();
  }

   Future<void> fetchDistrictList(String cityId) async {
    districtList = await locator<GeneralService>().townListCall(city: cityId);
    notifyListeners();
  }

  void updateSelectedDistrict(String value) {
    selectedDistrict = value;
    notifyListeners();
  }
}
