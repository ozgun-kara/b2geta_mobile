import 'package:b2geta_mobile/models/product_model.dart';

/*
{
  "id": "639",
  "user_id": "57",
  "product_id": "3440",
  "quantity": "5",
  "create_date": "2023-01-06 04:12:11",
  "product": {
    "id": "3440",
    "account_id": "56",
    "user_id": "57",
    "product_name": "ürün",
    "product_description": "ürün",
    "product_summary": "ürün",
    "brand": "1",
    "price": "100.00",
    "currency": "USD",
    "status": "1",
    "image": null
  }
} 
*/

class BasketModel {
  String? id;
  String? userId;
  String? productId;
  String? quantity;
  String? createDate;
  ProductModel? product;

  BasketModel({
    this.id,
    this.userId,
    this.productId,
    this.quantity,
    this.createDate,
    this.product,
  });
  BasketModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    userId = json['user_id']?.toString();
    productId = json['product_id']?.toString();
    quantity = json['quantity']?.toString();
    createDate = json['create_date']?.toString();
    product = (json['product'] != null) ? ProductModel.fromJson(json['product']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['create_date'] = createDate;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
