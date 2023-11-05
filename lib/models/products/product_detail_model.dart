// ignore_for_file: public_member_api_docs, sort_constructors_first
///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class ProductDetailModelCategories {
/*
{
  "id": "85",
  "product_id": "64",
  "category_id": "712",
  "category_name": "Kapı"
}
*/

  String? id;
  String? productId;
  String? categoryId;
  String? categoryName;

  ProductDetailModelCategories({
    this.id,
    this.productId,
    this.categoryId,
    this.categoryName,
  });
  ProductDetailModelCategories.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    productId = json['product_id']?.toString();
    categoryId = json['category_id']?.toString();
    categoryName = json['category_name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    return data;
  }
}

class ProductDetailModelBrand {
/*
{
  "id": "1",
  "name": "My Band"
}
*/

  String? id;
  String? name;

  ProductDetailModelBrand({
    this.id,
    this.name,
  });
  ProductDetailModelBrand.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
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
      id: map['id'] != null ? map['id'].toString() : null,
      productId: map['productId'] != null ? map['productId'].toString() : null,
      country: map['country'] != null ? map['country'].toString() : null,
      type: map['type'] != null ? map['type'].toString() : null,
      quantity: map['quantity'] != null ? map['quantity'].toString() : null,
      currency: map['currency'] != null ? map['currency'].toString() : null,
      price: map['price'] != null
          ? map['price'] is int
              ? map['price'].toDouble()
              : map['price'] is double
                  ? map['price']
                  : map['price'] is String
                      ? double.parse(map['price'])
                      : null
          : null,
    );
  }

  @override
  String toString() {
    return 'Price(id: $id, productId: $productId, country: $country, type: $type, quantity: $quantity, currency: $currency, price: $price)';
  }
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

class ProductDetailModel {
/*
{
  "id": "64",
  "account_id": "5",
  "user_id": "5",
  "product_name": "2",
  "product_description": "2",
  "product_summary": "2",
  "brand": {
    "id": "1",
    "name": "My Band"
  },
  "price": "222.00",
  "currency": "TRY",
  "status": "1",
  "categories": [
    {
      "id": "85",
      "product_id": "64",
      "category_id": "712",
      "category_name": "Kapı"
    }
  ],
  "images": [
    "https://api.businessucces.com/uploads/products/2023/03/21032023115627-1679396187.jpg"
  ]
}
*/

  String? id;
  String? accountId;
  String? userId;
  String? productName;
  String? productDescription;
  String? productSummary;
  ProductDetailModelBrand? brand;
  String? price;
  String? currency;
  String? status;
  double? width;
  double? height;
  double? length;
  double? weight;
  bool? saleRetail;
  bool? saleWhole;
  List<ProductDetailModelCategories?>? categories;
  List<String>? images;
  List<ImagesMeta>? imagesMeta;
  List<Price>? prices;
  Map<String, Feature>? features;

  ProductDetailModel({
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
    this.categories,
    this.images,
    this.imagesMeta,
    this.prices,
    this.features,
  });
  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    accountId = json['account_id']?.toString();
    userId = json['user_id']?.toString();
    productName = json['product_name']?.toString();
    productDescription = json['product_description']?.toString();
    productSummary = json['product_summary']?.toString();
    brand = (json['brand'] != false)
        ? ProductDetailModelBrand.fromJson(json['brand'])
        : null;
    price = json['price']?.toString();
    currency = json['currency']?.toString();
    status = json['status']?.toString();
    width = json["width"].toDouble();
    height = json["height"].toDouble();
    length = json["length"].toDouble();
    weight = json["weight"].toDouble();
    saleRetail = json["sale_retail"];
    saleWhole = json["sale_whole"];
    if (json['categories'] != null) {
      final v = json['categories'];
      final arr0 = <ProductDetailModelCategories>[];
      v.forEach((v) {
        arr0.add(ProductDetailModelCategories.fromJson(v));
      });
      categories = arr0;
    }
    if (json['images'] != null) {
      final v = json['images'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      images = arr0;
    }
    imagesMeta = json["images_meta"] == null
        ? []
        : List<ImagesMeta>.from(
            json["images_meta"]!.map((x) => ImagesMeta.fromJson(x)));
    prices = json["prices"] == null
        ? []
        : List<Price>.from(json["prices"]!.map((x) => Price.fromJson(x)));
    features = json["features"] is List<dynamic>
        ? null
        : Map.from(json["features"])
            .map((k, v) => MapEntry<String, Feature>(k, Feature.fromJson(v)));
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['account_id'] = accountId;
    data['user_id'] = userId;
    data['product_name'] = productName;
    data['product_description'] = productDescription;
    data['product_summary'] = productSummary;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['price'] = price;
    data['currency'] = currency;
    data['status'] = status;
    if (categories != null) {
      final v = categories;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['categories'] = arr0;
    }
    if (images != null) {
      final v = images;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v);
      }
      data['images'] = arr0;
    }
    return data;
  }

  @override
  String toString() {
    return 'ProductDetailModel(id: $id, accountId: $accountId, userId: $userId, productName: $productName, productDescription: $productDescription, productSummary: $productSummary, price: $price, currency: $currency, status: $status, categories: $categories, images: $images)';
  }
}
