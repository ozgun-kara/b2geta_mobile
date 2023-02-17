
class OrderModel {
  String? id;
  String? status;
  String? orderDate;
  String? totalPrice;
  String? tax;
  String? discount;
  String? shippingPrice;
  OrderSeller? seller;
  OrderBuyer? buyer;

  OrderModel({
    this.id,
    this.status,
    this.orderDate,
    this.totalPrice,
    this.tax,
    this.discount,
    this.shippingPrice,
    this.seller,
    this.buyer,
  });
  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    status = json['status']?.toString();
    orderDate = json['order_date']?.toString();
    totalPrice = json['total_price']?.toString();
    tax = json['tax']?.toString();
    discount = json['discount']?.toString();
    shippingPrice = json['shipping_price']?.toString();
    seller =
        (json['seller'] != null) ? OrderSeller.fromJson(json['seller']) : null;
    buyer = (json['buyer'] != null) ? OrderBuyer.fromJson(json['buyer']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['order_date'] = orderDate;
    data['total_price'] = totalPrice;
    data['tax'] = tax;
    data['discount'] = discount;
    data['shipping_price'] = shippingPrice;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (buyer != null) {
      data['buyer'] = buyer!.toJson();
    }
    return data;
  }
}

class OrderBuyer {
  String? id;
  String? type;
  String? name;
  String? photo;

  OrderBuyer({
    this.id,
    this.type,
    this.name,
    this.photo,
  });
  OrderBuyer.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}

class OrderSeller {

  String? id;
  String? type;
  String? name;
  String? photo;

  OrderSeller({
    this.id,
    this.type,
    this.name,
    this.photo,
  });
  OrderSeller.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}



/*
{
  "id": "101277252",
  "status": "new",
  "order_date": "2023-02-08 00:20:35",
  "total_price": "0.00",
  "tax": "0.00",
  "discount": "0.00",
  "shipping_price": "0.00",
  "seller": {
    "id": "56",
    "type": "personal",
    "name": "Mehmet Can",
    "photo": ""
  },
  "buyer": {
    "id": "57",
    "type": "personal",
    "name": "Mehmet Can",
    "photo": ""
  }
} 
*/
