///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class OrderDetailsModelProducts {
/*
{
  "id": "3364",
  "name": "Deneme Ürünü",
  "quantity": "4",
  "price": "100.00",
  "currency": "TRY",
  "total_price": "400.00",
  "discount": "0.00",
  "cost": "0.00",
  "tax": "0.00",
  "usd_price": "100.000000",
  "image": ""
} 
*/

  String? id;
  String? name;
  String? quantity;
  String? price;
  String? currency;
  String? totalPrice;
  String? discount;
  String? cost;
  String? tax;
  String? usdPrice;
  String? image;

  OrderDetailsModelProducts({
    this.id,
    this.name,
    this.quantity,
    this.price,
    this.currency,
    this.totalPrice,
    this.discount,
    this.cost,
    this.tax,
    this.usdPrice,
    this.image,
  });
  OrderDetailsModelProducts.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    quantity = json['quantity']?.toString();
    price = json['price']?.toString();
    currency = json['currency']?.toString();
    totalPrice = json['total_price']?.toString();
    discount = json['discount']?.toString();
    cost = json['cost']?.toString();
    tax = json['tax']?.toString();
    usdPrice = json['usd_price']?.toString();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['currency'] = currency;
    data['total_price'] = totalPrice;
    data['discount'] = discount;
    data['cost'] = cost;
    data['tax'] = tax;
    data['usd_price'] = usdPrice;
    data['image'] = image;
    return data;
  }
}

class OrderDetailsModelBuyer {
/*
{
  "id": "57",
  "type": "personal",
  "name": "Mehmet Can",
  "photo": "https://api.businessucces.com/uploads/profile/2023/03/03032023112546-1677839146.jpg"
} 
*/

  String? id;
  String? type;
  String? name;
  String? photo;

  OrderDetailsModelBuyer({
    this.id,
    this.type,
    this.name,
    this.photo,
  });
  OrderDetailsModelBuyer.fromJson(Map<String, dynamic> json) {
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

class OrderDetailsModelSeller {
/*
{
  "id": "56",
  "type": "personal",
  "name": "Mehmet Can",
  "photo": ""
} 
*/

  String? id;
  String? type;
  String? name;
  String? photo;

  OrderDetailsModelSeller({
    this.id,
    this.type,
    this.name,
    this.photo,
  });
  OrderDetailsModelSeller.fromJson(Map<String, dynamic> json) {
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

class OrderDetailsModelAddressesBillingDistrict {
/*
{
  "id": "108963",
  "name": "Şişli"
} 
*/

  String? id;
  String? name;

  OrderDetailsModelAddressesBillingDistrict({
    this.id,
    this.name,
  });
  OrderDetailsModelAddressesBillingDistrict.fromJson(
      Map<String, dynamic> json) {
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

class OrderDetailsModelAddressesBillingCountryTimezones {
/*
{
  "zoneName": "Europe/Istanbul",
  "gmtOffset": 10800,
  "gmtOffsetName": "UTC+03:00",
  "abbreviation": "EET",
  "tzName": "Eastern European Time"
} 
*/

  String? zoneName;
  int? gmtOffset;
  String? gmtOffsetName;
  String? abbreviation;
  String? tzName;

  OrderDetailsModelAddressesBillingCountryTimezones({
    this.zoneName,
    this.gmtOffset,
    this.gmtOffsetName,
    this.abbreviation,
    this.tzName,
  });
  OrderDetailsModelAddressesBillingCountryTimezones.fromJson(
      Map<String, dynamic> json) {
    zoneName = json['zoneName']?.toString();
    gmtOffset = json['gmtOffset']?.toInt();
    gmtOffsetName = json['gmtOffsetName']?.toString();
    abbreviation = json['abbreviation']?.toString();
    tzName = json['tzName']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['zoneName'] = zoneName;
    data['gmtOffset'] = gmtOffset;
    data['gmtOffsetName'] = gmtOffsetName;
    data['abbreviation'] = abbreviation;
    data['tzName'] = tzName;
    return data;
  }
}

class OrderDetailsModelAddressesBillingCountry {
/*
{
  "id": "225",
  "name": "Turkey",
  "code": "TR",
  "phonecode": "90",
  "currency": "TRY",
  "currency_name": "Turkish lira",
  "currency_symbol": "₺",
  "timezones": [
    {
      "zoneName": "Europe/Istanbul",
      "gmtOffset": 10800,
      "gmtOffsetName": "UTC+03:00",
      "abbreviation": "EET",
      "tzName": "Eastern European Time"
    }
  ],
  "flag": "🇹🇷"
} 
*/

  String? id;
  String? name;
  String? code;
  String? phonecode;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  List<OrderDetailsModelAddressesBillingCountryTimezones?>? timezones;
  String? flag;

  OrderDetailsModelAddressesBillingCountry({
    this.id,
    this.name,
    this.code,
    this.phonecode,
    this.currency,
    this.currencyName,
    this.currencySymbol,
    this.timezones,
    this.flag,
  });
  OrderDetailsModelAddressesBillingCountry.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    code = json['code']?.toString();
    phonecode = json['phonecode']?.toString();
    currency = json['currency']?.toString();
    currencyName = json['currency_name']?.toString();
    currencySymbol = json['currency_symbol']?.toString();
    if (json['timezones'] != null) {
      final v = json['timezones'];
      final arr0 = <OrderDetailsModelAddressesBillingCountryTimezones>[];
      v.forEach((v) {
        arr0.add(OrderDetailsModelAddressesBillingCountryTimezones.fromJson(v));
      });
      timezones = arr0;
    }
    flag = json['flag']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['phonecode'] = phonecode;
    data['currency'] = currency;
    data['currency_name'] = currencyName;
    data['currency_symbol'] = currencySymbol;
    if (timezones != null) {
      final v = timezones;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['timezones'] = arr0;
    }
    data['flag'] = flag;
    return data;
  }
}

class OrderDetailsModelAddressesBilling {
/*
{
  "id": "507",
  "type": "invoice",
  "fullname": "Mehmet Can",
  "phone": "+905437153366",
  "email": "mehmet@mehmetcan.com.tr",
  "address": "Kuştepe Mah. Tan Sokak",
  "country": {
    "id": "225",
    "name": "Turkey",
    "code": "TR",
    "phonecode": "90",
    "currency": "TRY",
    "currency_name": "Turkish lira",
    "currency_symbol": "₺",
    "timezones": [
      {
        "zoneName": "Europe/Istanbul",
        "gmtOffset": 10800,
        "gmtOffsetName": "UTC+03:00",
        "abbreviation": "EET",
        "tzName": "Eastern European Time"
      }
    ],
    "flag": "🇹🇷"
  },
  "city": false,
  "district": {
    "id": "108963",
    "name": "Şişli"
  },
  "postal_code": "34000"
} 
*/

  String? id;
  String? type;
  String? fullname;
  String? phone;
  String? email;
  String? address;
  OrderDetailsModelAddressesBillingCountry? country;
  bool? city;
  OrderDetailsModelAddressesBillingDistrict? district;
  String? postalCode;

  OrderDetailsModelAddressesBilling({
    this.id,
    this.type,
    this.fullname,
    this.phone,
    this.email,
    this.address,
    this.country,
    this.city,
    this.district,
    this.postalCode,
  });
  OrderDetailsModelAddressesBilling.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    fullname = json['fullname']?.toString();
    phone = json['phone']?.toString();
    email = json['email']?.toString();
    address = json['address']?.toString();
    country = (json['country'] != null)
        ? OrderDetailsModelAddressesBillingCountry.fromJson(json['country'])
        : null;
    city = json['city'];
    district = (json['district'] != null)
        ? OrderDetailsModelAddressesBillingDistrict.fromJson(json['district'])
        : null;
    postalCode = json['postal_code']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    data['city'] = city;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    data['postal_code'] = postalCode;
    return data;
  }
}

class OrderDetailsModelAddressesShippingDistrict {
/*
{
  "id": "108963",
  "name": "Şişli"
} 
*/

  String? id;
  String? name;

  OrderDetailsModelAddressesShippingDistrict({
    this.id,
    this.name,
  });
  OrderDetailsModelAddressesShippingDistrict.fromJson(
      Map<String, dynamic> json) {
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

class OrderDetailsModelAddressesShippingCountryTimezones {
/*
{
  "zoneName": "Europe/Istanbul",
  "gmtOffset": 10800,
  "gmtOffsetName": "UTC+03:00",
  "abbreviation": "EET",
  "tzName": "Eastern European Time"
} 
*/

  String? zoneName;
  int? gmtOffset;
  String? gmtOffsetName;
  String? abbreviation;
  String? tzName;

  OrderDetailsModelAddressesShippingCountryTimezones({
    this.zoneName,
    this.gmtOffset,
    this.gmtOffsetName,
    this.abbreviation,
    this.tzName,
  });
  OrderDetailsModelAddressesShippingCountryTimezones.fromJson(
      Map<String, dynamic> json) {
    zoneName = json['zoneName']?.toString();
    gmtOffset = json['gmtOffset']?.toInt();
    gmtOffsetName = json['gmtOffsetName']?.toString();
    abbreviation = json['abbreviation']?.toString();
    tzName = json['tzName']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['zoneName'] = zoneName;
    data['gmtOffset'] = gmtOffset;
    data['gmtOffsetName'] = gmtOffsetName;
    data['abbreviation'] = abbreviation;
    data['tzName'] = tzName;
    return data;
  }
}

class OrderDetailsModelAddressesShippingCountry {
/*
{
  "id": "225",
  "name": "Turkey",
  "code": "TR",
  "phonecode": "90",
  "currency": "TRY",
  "currency_name": "Turkish lira",
  "currency_symbol": "₺",
  "timezones": [
    {
      "zoneName": "Europe/Istanbul",
      "gmtOffset": 10800,
      "gmtOffsetName": "UTC+03:00",
      "abbreviation": "EET",
      "tzName": "Eastern European Time"
    }
  ],
  "flag": "🇹🇷"
} 
*/

  String? id;
  String? name;
  String? code;
  String? phonecode;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  List<OrderDetailsModelAddressesShippingCountryTimezones?>? timezones;
  String? flag;

  OrderDetailsModelAddressesShippingCountry({
    this.id,
    this.name,
    this.code,
    this.phonecode,
    this.currency,
    this.currencyName,
    this.currencySymbol,
    this.timezones,
    this.flag,
  });
  OrderDetailsModelAddressesShippingCountry.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    code = json['code']?.toString();
    phonecode = json['phonecode']?.toString();
    currency = json['currency']?.toString();
    currencyName = json['currency_name']?.toString();
    currencySymbol = json['currency_symbol']?.toString();
    if (json['timezones'] != null) {
      final v = json['timezones'];
      final arr0 = <OrderDetailsModelAddressesShippingCountryTimezones>[];
      v.forEach((v) {
        arr0.add(
            OrderDetailsModelAddressesShippingCountryTimezones.fromJson(v));
      });
      timezones = arr0;
    }
    flag = json['flag']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['phonecode'] = phonecode;
    data['currency'] = currency;
    data['currency_name'] = currencyName;
    data['currency_symbol'] = currencySymbol;
    if (timezones != null) {
      final v = timezones;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['timezones'] = arr0;
    }
    data['flag'] = flag;
    return data;
  }
}

class OrderDetailsModelAddressesShipping {
/*
{
  "id": "508",
  "type": "delivery",
  "fullname": "Mehmet Can",
  "phone": "+905437153366",
  "email": "mehmet@mehmetcan.com.tr",
  "address": "Kuştepe Mah. Tan Sokak",
  "country": {
    "id": "225",
    "name": "Turkey",
    "code": "TR",
    "phonecode": "90",
    "currency": "TRY",
    "currency_name": "Turkish lira",
    "currency_symbol": "₺",
    "timezones": [
      {
        "zoneName": "Europe/Istanbul",
        "gmtOffset": 10800,
        "gmtOffsetName": "UTC+03:00",
        "abbreviation": "EET",
        "tzName": "Eastern European Time"
      }
    ],
    "flag": "🇹🇷"
  },
  "city": false,
  "district": {
    "id": "108963",
    "name": "Şişli"
  },
  "postal_code": "34000"
} 
*/

  String? id;
  String? type;
  String? fullname;
  String? phone;
  String? email;
  String? address;
  OrderDetailsModelAddressesShippingCountry? country;
  bool? city;
  OrderDetailsModelAddressesShippingDistrict? district;
  String? postalCode;

  OrderDetailsModelAddressesShipping({
    this.id,
    this.type,
    this.fullname,
    this.phone,
    this.email,
    this.address,
    this.country,
    this.city,
    this.district,
    this.postalCode,
  });
  OrderDetailsModelAddressesShipping.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    fullname = json['fullname']?.toString();
    phone = json['phone']?.toString();
    email = json['email']?.toString();
    address = json['address']?.toString();
    country = (json['country'] != null)
        ? OrderDetailsModelAddressesShippingCountry.fromJson(json['country'])
        : null;
    city = json['city'];
    district = (json['district'] != null)
        ? OrderDetailsModelAddressesShippingDistrict.fromJson(json['district'])
        : null;
    postalCode = json['postal_code']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    data['city'] = city;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    data['postal_code'] = postalCode;
    return data;
  }
}

class OrderDetailsModelAddresses {
/*
{
  "shipping": {
    "id": "508",
    "type": "delivery",
    "fullname": "Mehmet Can",
    "phone": "+905437153366",
    "email": "mehmet@mehmetcan.com.tr",
    "address": "Kuştepe Mah. Tan Sokak",
    "country": {
      "id": "225",
      "name": "Turkey",
      "code": "TR",
      "phonecode": "90",
      "currency": "TRY",
      "currency_name": "Turkish lira",
      "currency_symbol": "₺",
      "timezones": [
        {
          "zoneName": "Europe/Istanbul",
          "gmtOffset": 10800,
          "gmtOffsetName": "UTC+03:00",
          "abbreviation": "EET",
          "tzName": "Eastern European Time"
        }
      ],
      "flag": "🇹🇷"
    },
    "city": false,
    "district": {
      "id": "108963",
      "name": "Şişli"
    },
    "postal_code": "34000"
  },
  "billing": {
    "id": "507",
    "type": "invoice",
    "fullname": "Mehmet Can",
    "phone": "+905437153366",
    "email": "mehmet@mehmetcan.com.tr",
    "address": "Kuştepe Mah. Tan Sokak",
    "country": {
      "id": "225",
      "name": "Turkey",
      "code": "TR",
      "phonecode": "90",
      "currency": "TRY",
      "currency_name": "Turkish lira",
      "currency_symbol": "₺",
      "timezones": [
        {
          "zoneName": "Europe/Istanbul",
          "gmtOffset": 10800,
          "gmtOffsetName": "UTC+03:00",
          "abbreviation": "EET",
          "tzName": "Eastern European Time"
        }
      ],
      "flag": "🇹🇷"
    },
    "city": false,
    "district": {
      "id": "108963",
      "name": "Şişli"
    },
    "postal_code": "34000"
  }
} 
*/

  OrderDetailsModelAddressesShipping? shipping;
  OrderDetailsModelAddressesBilling? billing;

  OrderDetailsModelAddresses({
    this.shipping,
    this.billing,
  });
  OrderDetailsModelAddresses.fromJson(Map<String, dynamic> json) {
    shipping = (json['shipping'] != null)
        ? OrderDetailsModelAddressesShipping.fromJson(json['shipping'])
        : null;
    billing = (json['billing'] != null)
        ? OrderDetailsModelAddressesBilling.fromJson(json['billing'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (shipping != null) {
      data['shipping'] = shipping!.toJson();
    }
    if (billing != null) {
      data['billing'] = billing!.toJson();
    }
    return data;
  }
}

class OrderDetailsModel {
/*
{
  "id": "101277283",
  "status": "new",
  "order_date": "2023-03-09 03:03:49",
  "total_price": "0.00",
  "tax": "0.00",
  "discount": "0.00",
  "shipping_price": "0.00",
  "addresses": {
    "shipping": {
      "id": "508",
      "type": "delivery",
      "fullname": "Mehmet Can",
      "phone": "+905437153366",
      "email": "mehmet@mehmetcan.com.tr",
      "address": "Kuştepe Mah. Tan Sokak",
      "country": {
        "id": "225",
        "name": "Turkey",
        "code": "TR",
        "phonecode": "90",
        "currency": "TRY",
        "currency_name": "Turkish lira",
        "currency_symbol": "₺",
        "timezones": [
          {
            "zoneName": "Europe/Istanbul",
            "gmtOffset": 10800,
            "gmtOffsetName": "UTC+03:00",
            "abbreviation": "EET",
            "tzName": "Eastern European Time"
          }
        ],
        "flag": "🇹🇷"
      },
      "city": false,
      "district": {
        "id": "108963",
        "name": "Şişli"
      },
      "postal_code": "34000"
    },
    "billing": {
      "id": "507",
      "type": "invoice",
      "fullname": "Mehmet Can",
      "phone": "+905437153366",
      "email": "mehmet@mehmetcan.com.tr",
      "address": "Kuştepe Mah. Tan Sokak",
      "country": {
        "id": "225",
        "name": "Turkey",
        "code": "TR",
        "phonecode": "90",
        "currency": "TRY",
        "currency_name": "Turkish lira",
        "currency_symbol": "₺",
        "timezones": [
          {
            "zoneName": "Europe/Istanbul",
            "gmtOffset": 10800,
            "gmtOffsetName": "UTC+03:00",
            "abbreviation": "EET",
            "tzName": "Eastern European Time"
          }
        ],
        "flag": "🇹🇷"
      },
      "city": false,
      "district": {
        "id": "108963",
        "name": "Şişli"
      },
      "postal_code": "34000"
    }
  },
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
    "photo": "https://api.businessucces.com/uploads/profile/2023/03/03032023112546-1677839146.jpg"
  },
  "products": [
    {
      "id": "3364",
      "name": "Deneme Ürünü",
      "quantity": "4",
      "price": "100.00",
      "currency": "TRY",
      "total_price": "400.00",
      "discount": "0.00",
      "cost": "0.00",
      "tax": "0.00",
      "usd_price": "100.000000",
      "image": ""
    }
  ]
} 
*/

  String? id;
  String? status;
  bool? paymentStatus;
  String? orderDate;
  String? totalPrice;
  String? tax;
  String? discount;
  String? shippingPrice;
  Invoice? invoice;
  String? cargoTrackingUrl;
  String? cargoTrackingNo;
  OrderDetailsModelAddresses? addresses;
  OrderDetailsModelSeller? seller;
  OrderDetailsModelBuyer? buyer;
  List<OrderDetailsModelProducts?>? products;

  OrderDetailsModel({
    this.id,
    this.status,
    this.paymentStatus,
    this.orderDate,
    this.totalPrice,
    this.tax,
    this.discount,
    this.shippingPrice,
    this.invoice,
    this.cargoTrackingUrl,
    this.cargoTrackingNo,
    this.addresses,
    this.seller,
    this.buyer,
    this.products,
  });
  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    status = json['status']?.toString();
    paymentStatus = json['payment_status'];
    orderDate = json['order_date']?.toString();
    totalPrice = json['total_price']?.toString();
    tax = json['tax']?.toString();
    discount = json['discount']?.toString();
    shippingPrice = json['shipping_price']?.toString();
    invoice =
        (json['invoice'] != null) ? Invoice.fromJson(json['invoice']) : null;
    cargoTrackingUrl = json['cargo_tracking_url']?.toString();
    cargoTrackingNo = json['cargo_tracking_no']?.toString();

    addresses = (json['addresses'] != null)
        ? OrderDetailsModelAddresses.fromJson(json['addresses'])
        : null;
    seller = (json['seller'] != null)
        ? OrderDetailsModelSeller.fromJson(json['seller'])
        : null;
    buyer = (json['buyer'] != null)
        ? OrderDetailsModelBuyer.fromJson(json['buyer'])
        : null;
    if (json['products'] != null) {
      final v = json['products'];
      final arr0 = <OrderDetailsModelProducts>[];
      v.forEach((v) {
        arr0.add(OrderDetailsModelProducts.fromJson(v));
      });
      products = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['payment_status'] = paymentStatus;
    data['order_date'] = orderDate;
    data['total_price'] = totalPrice;
    data['tax'] = tax;
    data['discount'] = discount;
    data['shipping_price'] = shippingPrice;
    if (addresses != null) {
      data['addresses'] = addresses!.toJson();
    }
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (buyer != null) {
      data['buyer'] = buyer!.toJson();
    }
    if (products != null) {
      final v = products;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['products'] = arr0;
    }
    return data;
  }
}

class Invoice {
/*
{
  "invoice_no": "A1234",
  "invoice_date": "2023-11-09",
  "invoice_url": "https://www.google.com/dosya.pdf"
} 
*/

  String? invoiceNo;
  String? invoiceDate;
  String? invoiceUrl;

  Invoice({
    this.invoiceNo,
    this.invoiceDate,
    this.invoiceUrl,
  });
  Invoice.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['invoice_no']?.toString();
    invoiceDate = json['invoice_date']?.toString();
    invoiceUrl = json['invoice_url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['invoice_no'] = invoiceNo;
    data['invoice_date'] = invoiceDate;
    data['invoice_url'] = invoiceUrl;
    return data;
  }
}
