// To parse this JSON data, do
//
//     final languagesModel = languagesModelFromMap(jsonString);

import 'dart:convert';

class LanguagesModel {
  LanguagesModel({
    this.status,
    this.responseCode,
    this.responseText,
    this.errors,
    this.accessToken,
    this.data,
  });

  bool? status;
  int? responseCode;
  String? responseText;
  List<dynamic>? errors;
  dynamic? accessToken;
  List<LanguagesDataModel>? data;

  factory LanguagesModel.fromJson(String str) =>
      LanguagesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LanguagesModel.fromMap(Map<String, dynamic> json) => LanguagesModel(
        status: json["status"],
        responseCode: json["responseCode"],
        responseText: json["responseText"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        accessToken: json["access_token"],
        data: List<LanguagesDataModel>.from(
            json["data"].map((x) => LanguagesDataModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "responseCode": responseCode,
        "responseText": responseText,
        "errors": List<dynamic>.from(errors!.map((x) => x)),
        "access_token": accessToken,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class LanguagesDataModel {
  LanguagesDataModel({
    this.languageCode,
    this.languageName,
    this.datumDefault,
  });

  String? languageCode;
  String? languageName;
  String? datumDefault;

  factory LanguagesDataModel.fromJson(String str) =>
      LanguagesDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LanguagesDataModel.fromMap(Map<String, dynamic> json) =>
      LanguagesDataModel(
        languageCode: json["language_code"],
        languageName: json["language_name"],
        datumDefault: json["default"],
      );

  Map<String, dynamic> toMap() => {
        "language_code": languageCode,
        "language_name": languageName,
        "default": datumDefault,
      };
}
