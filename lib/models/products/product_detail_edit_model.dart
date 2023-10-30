// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final productDetailEditModel = productDetailEditModelFromJson(jsonString);

import 'dart:convert';

ProductDetailEditModel productDetailEditModelFromJson(String str) =>
    ProductDetailEditModel.fromJson(json.decode(str));

String productDetailEditModelToJson(ProductDetailEditModel data) =>
    json.encode(data.toJson());

class ProductDetailEditModel {
  String? id;
  String? accountId;
  String? userId;
  ProductName? productName;
  ProductDescription? productDescription;
  ProductSummary? productSummary;
  Brand? brand;
  String? price;
  String? currency;
  String? status;
  int? width;
  int? height;
  int? length;
  int? weight;
  bool? saleRetail;
  bool? saleWhole;
  String? gtip;
  List<Category>? categories;
  List<String>? images;
  List<ImagesMeta>? imagesMeta;
  List<Price>? prices;
  Map<String, Feature>? features;

  ProductDetailEditModel({
    this.id,
    this.accountId,
    this.userId,
    this.productName,
    this.productDescription,
    this.productSummary,
    this.brand,
    this.price,
    this.currency,
    this.status,
    this.width,
    this.height,
    this.length,
    this.weight,
    this.saleRetail,
    this.saleWhole,
    this.gtip,
    this.categories,
    this.images,
    this.imagesMeta,
    this.prices,
    this.features,
  });

  factory ProductDetailEditModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailEditModel(
        id: json["id"],
        accountId: json["account_id"],
        userId: json["user_id"],
        productName: json["product_name"] == null
            ? null
            : ProductName.fromJson(json["product_name"]),
        productDescription: json["product_description"] == null
            ? null
            : ProductDescription.fromJson(json["product_description"]),
        productSummary: json["product_summary"] == null
            ? null
            : ProductSummary.fromJson(json["product_summary"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        price: json["price"],
        currency: json["currency"],
        status: json["status"],
        width: json["width"],
        height: json["height"],
        length: json["length"],
        weight: json["weight"],
        saleRetail: json["sale_retail"],
        saleWhole: json["sale_whole"],
        gtip: json["gtip"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        imagesMeta: json["images_meta"] == null
            ? []
            : List<ImagesMeta>.from(
                json["images_meta"]!.map((x) => ImagesMeta.fromJson(x))),
        prices: json["prices"] == null
            ? []
            : List<Price>.from(json["prices"]!.map((x) => Price.fromJson(x))),
        features: Map.from(json["features"]!)
            .map((k, v) => MapEntry<String, Feature>(k, Feature.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "account_id": accountId,
        "user_id": userId,
        "product_name": productName?.toJson(),
        "product_description": productDescription?.toJson(),
        "product_summary": productSummary?.toJson(),
        "brand": brand?.toJson(),
        "price": price,
        "currency": currency,
        "status": status,
        "width": width,
        "height": height,
        "length": length,
        "weight": weight,
        "sale_retail": saleRetail,
        "sale_whole": saleWhole,
        "gtip": gtip,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "images_meta": imagesMeta == null
            ? []
            : List<dynamic>.from(imagesMeta!.map((x) => x.toJson())),
        "prices": prices == null
            ? []
            : List<dynamic>.from(prices!.map((x) => x.toJson())),
        "features": Map.from(features!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Brand {
  String? id;
  String? name;

  Brand({
    this.id,
    this.name,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Category {
  String? id;
  String? productId;
  String? categoryId;
  String? categoryName;

  Category({
    this.id,
    this.productId,
    this.categoryId,
    this.categoryName,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        productId: json["product_id"],
        categoryId: json["category_id"],
        categoryName: json["category_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "category_id": categoryId,
        "category_name": categoryName,
      };
}

class Feature {
  String? id;
  String? fieldType;
  String? label;
  String? value;
  Map<String, String>? values;
  String? required;
  String? markedToBuy;
  String? filterable;
  String? measureGroup;
  String? status;

  Feature({
    this.id,
    this.fieldType,
    this.label,
    this.value,
    this.values,
    this.required,
    this.markedToBuy,
    this.filterable,
    this.measureGroup,
    this.status,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        fieldType: json["field_type"],
        label: json["label"],
        value: json["value"],
        values: Map.from(json["values"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        required: json["required"],
        markedToBuy: json["marked_to_buy"],
        filterable: json["filterable"],
        measureGroup: json["measure_group"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "field_type": fieldType,
        "label": label,
        "value": value,
        "values":
            Map.from(values!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "required": required,
        "marked_to_buy": markedToBuy,
        "filterable": filterable,
        "measure_group": measureGroup,
        "status": status,
      };
}

class ImagesMeta {
  String? id;
  String? url;
  String? productId;

  ImagesMeta({
    this.id,
    this.url,
    this.productId,
  });

  factory ImagesMeta.fromJson(Map<String, dynamic> json) => ImagesMeta(
        id: json["id"],
        url: json["url"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "product_id": productId,
      };
}

class Price {
  String? id;
  String? productId;
  String? country;
  String? type;
  String? quantity;
  String? currency;
  double? price;

  Price({
    this.id,
    this.productId,
    this.country,
    this.type,
    this.quantity,
    this.currency,
    this.price,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'country': country,
      'type': type,
      'quantity': quantity,
      'currency': currency,
      'price': price,
    };
  }

  factory Price.fromJson(Map<String, dynamic> map) {
    return Price(
      id: map['id'] != null ? map['id'] as String : null,
      productId: map['productId'] != null ? map['productId'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      quantity: map['quantity'] != null ? map['quantity'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      price: map['price'] != null ? map['price'].toDouble() as double : null,
    );
  }
}

class ProductName {
  String? tr;
  String? en;
  String? de;

  ProductName({
    this.tr,
    this.en,
    this.de,
  });

  factory ProductName.fromJson(Map<String, dynamic> json) => ProductName(
        tr: json["tr"],
        en: json["en"],
        de: json["de"],
      );

  Map<String, dynamic> toJson() => {
        "tr": tr,
        "en": en,
        "de": de,
      };
}

class ProductDescription {
  String? tr;
  String? en;
  String? de;

  ProductDescription({
    this.tr,
    this.en,
    this.de,
  });

  factory ProductDescription.fromJson(Map<String, dynamic> json) =>
      ProductDescription(
        tr: json["tr"],
        en: json["en"],
        de: json["de"],
      );

  Map<String, dynamic> toJson() => {
        "tr": tr,
        "en": en,
        "de": de,
      };
}

class ProductSummary {
  String? tr;
  String? en;
  String? de;

  ProductSummary({
    this.tr,
    this.en,
    this.de,
  });

  factory ProductSummary.fromJson(Map<String, dynamic> json) => ProductSummary(
        tr: json["tr"],
        en: json["en"],
        de: json["de"],
      );

  Map<String, dynamic> toJson() => {
        "tr": tr,
        "en": en,
        "de": de,
      };
}
