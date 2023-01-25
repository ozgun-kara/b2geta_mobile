import 'dart:convert';
import 'package:b2geta_mobile/models/dummy_models/company_address_dummy_model.dart';
import 'package:b2geta_mobile/models/dummy_models/company_order_dummy_model.dart';
import 'package:b2geta_mobile/models/dummy_models/customer_comment_dummy_model.dart';
import 'package:b2geta_mobile/models/dummy_models/language_dummy_model.dart';
import 'package:b2geta_mobile/models/dummy_models/product_dummy_model.dart';
import 'package:b2geta_mobile/models/dummy_models/shopping_summary_dummy_model.dart';
import 'package:flutter/services.dart' as rootBundle;

class DummyService {
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

  Future<List<ShoppingSummaryDummyModel>> getShoppingSummaryList() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('database/general/shopping_summary_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ShoppingSummaryDummyModel.fromJson(e)).toList();
  }

  Future<List<CustomerCommentDummyModel>> getCustomerCommentsList() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('database/general/customer_comments_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => CustomerCommentDummyModel.fromJson(e)).toList();
  }

  Future<List<CompanyOrderDummyModel>> getCompanyOrdersList() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('database/general/company_orders_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => CompanyOrderDummyModel.fromJson(e)).toList();
  }

  Future<List<CompanyAddressDummyModel>> getCompanyAddressList() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('database/general/company_address_list.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => CompanyAddressDummyModel.fromJson(e)).toList();
  }
}
