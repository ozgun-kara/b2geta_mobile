
class OrderDetailsModel {

  String? id;
  String? status;
  String? orderDate;
  String? totalPrice;
  String? tax;
  String? discount;
  String? shippingPrice;
  OrderDetailsModelAddresses? addresses;
  OrderDetailsModelSeller? seller;
  OrderDetailsModelBuyer? buyer;

  OrderDetailsModel({
    this.id,
    this.status,
    this.orderDate,
    this.totalPrice,
    this.tax,
    this.discount,
    this.shippingPrice,
    this.addresses,
    this.seller,
    this.buyer,
  });
  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    status = json['status']?.toString();
    orderDate = json['order_date']?.toString();
    totalPrice = json['total_price']?.toString();
    tax = json['tax']?.toString();
    discount = json['discount']?.toString();
    shippingPrice = json['shipping_price']?.toString();
    addresses = (json['addresses'] != null)
        ? OrderDetailsModelAddresses.fromJson(json['addresses'])
        : null;
    seller = (json['seller'] != null)
        ? OrderDetailsModelSeller.fromJson(json['seller'])
        : null;
    buyer = (json['buyer'] != null)
        ? OrderDetailsModelBuyer.fromJson(json['buyer'])
        : null;
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
    if (addresses != null) {
      data['addresses'] = addresses!.toJson();
    }
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    if (buyer != null) {
      data['buyer'] = buyer!.toJson();
    }
    return data;
  }
}

class OrderDetailsModelBuyer {
/*
{
  "id": "57",
  "type": "personal",
  "name": "Mehmet Can",
  "photo": ""
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
  "id": "17",
  "type": "company",
  "name": "Firma Adim",
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

class OrderDetailsModelAddresses {

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

class OrderDetailsModelAddressesBillingDistrict {
/*
{
  "id": "12",
  "name": "Abu Dhabi Municipality"
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

class OrderDetailsModelAddressesBillingCity {
/*
{
  "id": "12",
  "name": "Petnjica Municipality"
} 
*/

  String? id;
  String? name;

  OrderDetailsModelAddressesBillingCity({
    this.id,
    this.name,
  });
  OrderDetailsModelAddressesBillingCity.fromJson(Map<String, dynamic> json) {
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
  "zoneName": "Asia/Dubai",
  "gmtOffset": 14400,
  "gmtOffsetName": "UTC+04:00",
  "abbreviation": "GST",
  "tzName": "Gulf Standard Time"
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
  "id": "231",
  "name": "United Arab Emirates",
  "code": "AE",
  "phonecode": "971",
  "currency": "AED",
  "currency_name": "United Arab Emirates dirham",
  "currency_symbol": "إ.د",
  "timezones": [
    {
      "zoneName": "Asia/Dubai",
      "gmtOffset": 14400,
      "gmtOffsetName": "UTC+04:00",
      "abbreviation": "GST",
      "tzName": "Gulf Standard Time"
    }
  ],
  "flag": "🇦🇪"
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
  "id": "283",
  "type": "invoice",
  "fullname": "Mehmet Can",
  "phone": "+905437153366",
  "email": "mehmet@mehmetcan.com.tr",
  "address": "test 4",
  "country": {
    "id": "231",
    "name": "United Arab Emirates",
    "code": "AE",
    "phonecode": "971",
    "currency": "AED",
    "currency_name": "United Arab Emirates dirham",
    "currency_symbol": "إ.د",
    "timezones": [
      {
        "zoneName": "Asia/Dubai",
        "gmtOffset": 14400,
        "gmtOffsetName": "UTC+04:00",
        "abbreviation": "GST",
        "tzName": "Gulf Standard Time"
      }
    ],
    "flag": "🇦🇪"
  },
  "city": {
    "id": "12",
    "name": "Petnjica Municipality"
  },
  "district": {
    "id": "12",
    "name": "Abu Dhabi Municipality"
  },
  "postal_code": "11111"
} 
*/

  String? id;
  String? type;
  String? fullname;
  String? phone;
  String? email;
  String? address;
  OrderDetailsModelAddressesBillingCountry? country;
  OrderDetailsModelAddressesBillingCity? city;
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
    city = (json['city'] != null)
        ? OrderDetailsModelAddressesBillingCity.fromJson(json['city'])
        : null;
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
    if (city != null) {
      data['city'] = city!.toJson();
    }
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
  "id": "1",
  "name": "Andorra la Vella"
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

class OrderDetailsModelAddressesShippingCity {
/*
{
  "id": "1",
  "name": "Southern Nations, Nationalities, and Peoples' Region"
} 
*/

  String? id;
  String? name;

  OrderDetailsModelAddressesShippingCity({
    this.id,
    this.name,
  });
  OrderDetailsModelAddressesShippingCity.fromJson(Map<String, dynamic> json) {
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
  "zoneName": "Europe/Andorra",
  "gmtOffset": 3600,
  "gmtOffsetName": "UTC+01:00",
  "abbreviation": "CET",
  "tzName": "Central European Time"
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
  "id": "6",
  "name": "Andorra",
  "code": "AD",
  "phonecode": "376",
  "currency": "EUR",
  "currency_name": "Euro",
  "currency_symbol": "€",
  "timezones": [
    {
      "zoneName": "Europe/Andorra",
      "gmtOffset": 3600,
      "gmtOffsetName": "UTC+01:00",
      "abbreviation": "CET",
      "tzName": "Central European Time"
    }
  ],
  "flag": "🇦🇩"
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
  "id": "284",
  "type": "delivery",
  "fullname": "Mehmet Can",
  "phone": "+905437153366",
  "email": "mehmet@mehmetcan.com.tr",
  "address": "test",
  "country": {
    "id": "6",
    "name": "Andorra",
    "code": "AD",
    "phonecode": "376",
    "currency": "EUR",
    "currency_name": "Euro",
    "currency_symbol": "€",
    "timezones": [
      {
        "zoneName": "Europe/Andorra",
        "gmtOffset": 3600,
        "gmtOffsetName": "UTC+01:00",
        "abbreviation": "CET",
        "tzName": "Central European Time"
      }
    ],
    "flag": "🇦🇩"
  },
  "city": {
    "id": "1",
    "name": "Southern Nations, Nationalities, and Peoples' Region"
  },
  "district": {
    "id": "1",
    "name": "Andorra la Vella"
  },
  "postal_code": "34345"
} 
*/

  String? id;
  String? type;
  String? fullname;
  String? phone;
  String? email;
  String? address;
  OrderDetailsModelAddressesShippingCountry? country;
  OrderDetailsModelAddressesShippingCity? city;
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
    city = (json['city'] != null)
        ? OrderDetailsModelAddressesShippingCity.fromJson(json['city'])
        : null;
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
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    data['postal_code'] = postalCode;
    return data;
  }
}


/*
{
  "id": "101277171",
  "status": "cancelled",
  "order_date": "2022-12-29 00:09:53",
  "total_price": "0.00",
  "tax": "0.00",
  "discount": "0.00",
  "shipping_price": "0.00",
  "addresses": {
    "shipping": {
      "id": "284",
      "type": "delivery",
      "fullname": "Mehmet Can",
      "phone": "+905437153366",
      "email": "mehmet@mehmetcan.com.tr",
      "address": "test",
      "country": {
        "id": "6",
        "name": "Andorra",
        "code": "AD",
        "phonecode": "376",
        "currency": "EUR",
        "currency_name": "Euro",
        "currency_symbol": "€",
        "timezones": [
          {
            "zoneName": "Europe/Andorra",
            "gmtOffset": 3600,
            "gmtOffsetName": "UTC+01:00",
            "abbreviation": "CET",
            "tzName": "Central European Time"
          }
        ],
        "flag": "🇦🇩"
      },
      "city": {
        "id": "1",
        "name": "Southern Nations, Nationalities, and Peoples' Region"
      },
      "district": {
        "id": "1",
        "name": "Andorra la Vella"
      },
      "postal_code": "34345"
    },
    "billing": {
      "id": "283",
      "type": "invoice",
      "fullname": "Mehmet Can",
      "phone": "+905437153366",
      "email": "mehmet@mehmetcan.com.tr",
      "address": "test 4",
      "country": {
        "id": "231",
        "name": "United Arab Emirates",
        "code": "AE",
        "phonecode": "971",
        "currency": "AED",
        "currency_name": "United Arab Emirates dirham",
        "currency_symbol": "إ.د",
        "timezones": [
          {
            "zoneName": "Asia/Dubai",
            "gmtOffset": 14400,
            "gmtOffsetName": "UTC+04:00",
            "abbreviation": "GST",
            "tzName": "Gulf Standard Time"
          }
        ],
        "flag": "🇦🇪"
      },
      "city": {
        "id": "12",
        "name": "Petnjica Municipality"
      },
      "district": {
        "id": "12",
        "name": "Abu Dhabi Municipality"
      },
      "postal_code": "11111"
    }
  },
  "seller": {
    "id": "17",
    "type": "company",
    "name": "Firma Adim",
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