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
  BasketProductModel? product;

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
    product = (json['product'] != null)
        ? BasketProductModel.fromJson(json['product'])
        : null;
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

/*
{
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

*/

class BasketProductModel {
  String? id;
  String? accountId;
  String? userId;
  String? productName;
  String? productDescription;
  String? productSummary;
  String? brand;
  String? price;
  String? currency;
  String? status;
  String? image;

  BasketProductModel({
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
    this.image,
  });
  BasketProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    accountId = json['account_id']?.toString();
    userId = json['user_id']?.toString();
    productName = json['product_name']?.toString();
    productDescription = json['product_description']?.toString();
    productSummary = json['product_summary']?.toString();
    brand = json['brand']?.toString();
    price = json['price']?.toString();
    currency = json['currency']?.toString();
    status = json['status']?.toString();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['account_id'] = accountId;
    data['user_id'] = userId;
    data['product_name'] = productName;
    data['product_description'] = productDescription;
    data['product_summary'] = productSummary;
    data['brand'] = brand;
    data['price'] = price;
    data['currency'] = currency;
    data['status'] = status;
    data['image'] = image;
    return data;
  }
}
