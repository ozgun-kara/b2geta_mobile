import 'dart:io';
import 'package:b2geta_mobile/locator.dart';
import 'package:b2geta_mobile/models/categories/category_featureas_model.dart';
import 'package:b2geta_mobile/models/categories/category_model.dart';
import 'package:b2geta_mobile/models/general/brand_model.dart';
import 'package:b2geta_mobile/models/general/city_model.dart';
import 'package:b2geta_mobile/models/general/district_model.dart';
import 'package:b2geta_mobile/services/categories/categories_services.dart';
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

  // MY PRODUCTS SUBPAGE
  List<CategoryModel> categoryList = [];
  List<CategoryModel> subCategoryList = [];
  List<CategoryModel> deepCategoryList = [];
  List<CategoryFeatureasModel> categoryFeatureasList = [];
  List<CategoryFeatureasModelFeatureValues> selectedFetureasList = [];
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedDeepCategory;
  bool visibilitySubCategory = false;
  bool visibilityDeepCategory = false;
  bool visibilitycategoryFeatureasList = false;
  List<BrandModel> brandList = [];
  String? selectedBrand;
  List<String> statusList = [];
  String? selectedStatus;
  List<String> currencyList = [];
  String? selectedCurrency;
  List<File>? imageFilesList = [];

  fetchCategoryList() async {
    categoryList =
        await locator<CategoriesServices>().categoriesCall(queryParameters: {
      // "parent_id": "862"
    });
    notifyListeners();
  }

  fetchSubCategoryList({required String parentId}) async {
    subCategoryList = await locator<CategoriesServices>()
        .subCategoriesCall(parentId: parentId);
    notifyListeners();
  }

  fetchDeepCategoryList({required String parentId}) async {
    deepCategoryList = await locator<CategoriesServices>()
        .subCategoriesCall(parentId: parentId);
    notifyListeners();
  }

  fetchCategoryFeatureasList({required String categoryId}) async {
    categoryFeatureasList = await locator<CategoriesServices>()
        .categoryFeaturesCall(categoryId: categoryId);
    notifyListeners();
  }

  void updateSelectedFetureas(
      {required CategoryFeatureasModelFeatureValues selectedFetureasModel,
      required bool isSelected}) async {
    if (isSelected) {
      selectedFetureasList.add(selectedFetureasModel);
      notifyListeners();
    } else {
      selectedFetureasList.remove(selectedFetureasModel);
      notifyListeners();
    }
  }

  void updateSelectedCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  void updateSelectedSubCategory(String value) {
    selectedSubCategory = value;
    notifyListeners();
  }

  void updateSelectedDeepCategory(String value) {
    selectedDeepCategory = value;
    notifyListeners();
  }

  void updateVisibilitySubCategory(bool value) {
    visibilitySubCategory = value;
    notifyListeners();
  }

  void updateVisibilityDeepCategory(bool value) {
    visibilityDeepCategory = value;
    notifyListeners();
  }

  void updateVisibilityCategoryFeatureas(bool value) {
    visibilitycategoryFeatureasList = value;
    notifyListeners();
  }

  fetchBrandList() async {
    brandList = await locator<GeneralService>().brandsCall();
    notifyListeners();
  }

  void updateSelectedBrand(String value) {
    selectedBrand = value;
    notifyListeners();
  }

  void updateSelectedStatus(String value) {
    selectedStatus = value;
    notifyListeners();
  }

  void updateSelectedCurrency(String value) {
    selectedCurrency = value;
    notifyListeners();
  }

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
