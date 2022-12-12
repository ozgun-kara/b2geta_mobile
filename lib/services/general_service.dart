import 'dart:convert';
import 'package:b2geta_mobile/models/dummy/language_dummy_model.dart';
import 'package:b2geta_mobile/models/dummy/product_dummy_model.dart';
import 'package:flutter/services.dart' as rootBundle;

class GeneralService {
  Future<List<LanguageDummyModel>> getLanguageList() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('database/general/language_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => LanguageDummyModel.fromJson(e)).toList();
  }

  Future<List<ProductDummyModel>> getProductList() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('database/general/product_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ProductDummyModel.fromJson(e)).toList();
  }
}
