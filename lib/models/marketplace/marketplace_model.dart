class MarketPlaceModelPopularProductsDataAccount {
/*
{
  "id": "2",
  "type": "company",
  "username": "user_2",
  "name": "FIBYTE INTERNET SOLUTIONS",
  "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
  "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
} 
*/

  String? id;
  String? type;
  String? username;
  String? name;
  String? photo;
  String? cover;

  MarketPlaceModelPopularProductsDataAccount({
    this.id,
    this.type,
    this.username,
    this.name,
    this.photo,
    this.cover,
  });
  MarketPlaceModelPopularProductsDataAccount.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    username = json['username']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
    cover = json['cover']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['username'] = username;
    data['name'] = name;
    data['photo'] = photo;
    data['cover'] = cover;
    return data;
  }
}

class MarketPlaceModelPopularProductsDataImage {
/*
{
  "id": 0,
  "url": "",
  "product_id": "11"
} 
*/

  String? id;
  String? url;
  String? productId;

  MarketPlaceModelPopularProductsDataImage({
    this.id,
    this.url,
    this.productId,
  });
  MarketPlaceModelPopularProductsDataImage.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    url = json['url']?.toString();
    productId = json['product_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['product_id'] = productId;
    return data;
  }
}

class MarketPlaceModelPopularProductsData {
/*
{
  "id": "11",
  "product_type": "",
  "account_id": "2",
  "name": "New Balance Shoes",
  "summary": "New Balance 550",
  "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
  "brand": "1",
  "price": "5000.00",
  "currency": "TRY",
  "image": {
    "id": 0,
    "url": "",
    "product_id": "11"
  },
  "account": {
    "id": "2",
    "type": "company",
    "username": "user_2",
    "name": "FIBYTE INTERNET SOLUTIONS",
    "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
    "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
  }
} 
*/

  String? id;
  String? productType;
  String? accountId;
  String? name;
  String? summary;
  String? description;
  String? brand;
  String? price;
  String? currency;
  MarketPlaceModelPopularProductsDataImage? image;
  MarketPlaceModelPopularProductsDataAccount? account;

  MarketPlaceModelPopularProductsData({
    this.id,
    this.productType,
    this.accountId,
    this.name,
    this.summary,
    this.description,
    this.brand,
    this.price,
    this.currency,
    this.image,
    this.account,
  });
  MarketPlaceModelPopularProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    productType = json['product_type']?.toString();
    accountId = json['account_id']?.toString();
    name = json['name']?.toString();
    summary = json['summary']?.toString();
    description = json['description']?.toString();
    brand = json['brand']?.toString();
    price = json['price']?.toString();
    currency = json['currency']?.toString();
    image = (json['image'] != null)
        ? MarketPlaceModelPopularProductsDataImage.fromJson(json['image'])
        : null;
    account = (json['account'] != null)
        ? MarketPlaceModelPopularProductsDataAccount.fromJson(json['account'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['account_id'] = accountId;
    data['name'] = name;
    data['summary'] = summary;
    data['description'] = description;
    data['brand'] = brand;
    data['price'] = price;
    data['currency'] = currency;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (account != null) {
      data['account'] = account!.toJson();
    }
    return data;
  }
}

class MarketPlaceModelPopularProducts {
/*
{
  "data": [
    {
      "id": "11",
      "product_type": "",
      "account_id": "2",
      "name": "New Balance Shoes",
      "summary": "New Balance 550",
      "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
      "brand": "1",
      "price": "5000.00",
      "currency": "TRY",
      "image": {
        "id": 0,
        "url": "",
        "product_id": "11"
      },
      "account": {
        "id": "2",
        "type": "company",
        "username": "user_2",
        "name": "FIBYTE INTERNET SOLUTIONS",
        "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
        "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
      }
    }
  ],
  "count": "148"
} 
*/

  List<MarketPlaceModelPopularProductsData?>? data;
  String? count;

  MarketPlaceModelPopularProducts({
    this.data,
    this.count,
  });
  MarketPlaceModelPopularProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <MarketPlaceModelPopularProductsData>[];
      v.forEach((v) {
        arr0.add(MarketPlaceModelPopularProductsData.fromJson(v));
      });
      data = arr0;
    }
    count = json['count']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['data'] = arr0;
    }
    data['count'] = count;
    return data;
  }
}

class MarketPlaceModelNewProductsDataAccount {
/*
{
  "id": "2",
  "type": "company",
  "username": "user_2",
  "name": "FIBYTE INTERNET SOLUTIONS",
  "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
  "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
} 
*/

  String? id;
  String? type;
  String? username;
  String? name;
  String? photo;
  String? cover;

  MarketPlaceModelNewProductsDataAccount({
    this.id,
    this.type,
    this.username,
    this.name,
    this.photo,
    this.cover,
  });
  MarketPlaceModelNewProductsDataAccount.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    username = json['username']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
    cover = json['cover']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['username'] = username;
    data['name'] = name;
    data['photo'] = photo;
    data['cover'] = cover;
    return data;
  }
}

class MarketPlaceModelNewProductsDataImage {
/*
{
  "id": 0,
  "url": "",
  "product_id": "11"
} 
*/

  String? id;
  String? url;
  String? productId;

  MarketPlaceModelNewProductsDataImage({
    this.id,
    this.url,
    this.productId,
  });
  MarketPlaceModelNewProductsDataImage.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    url = json['url']?.toString();
    productId = json['product_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['product_id'] = productId;
    return data;
  }
}

class MarketPlaceModelNewProductsData {
/*
{
  "id": "11",
  "product_type": "",
  "account_id": "2",
  "name": "New Balance Shoes",
  "summary": "New Balance 550",
  "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
  "brand": "1",
  "price": "5000.00",
  "currency": "TRY",
  "image": {
    "id": 0,
    "url": "",
    "product_id": "11"
  },
  "account": {
    "id": "2",
    "type": "company",
    "username": "user_2",
    "name": "FIBYTE INTERNET SOLUTIONS",
    "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
    "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
  }
} 
*/

  String? id;
  String? productType;
  String? accountId;
  String? name;
  String? summary;
  String? description;
  String? brand;
  String? price;
  String? currency;
  MarketPlaceModelNewProductsDataImage? image;
  MarketPlaceModelNewProductsDataAccount? account;

  MarketPlaceModelNewProductsData({
    this.id,
    this.productType,
    this.accountId,
    this.name,
    this.summary,
    this.description,
    this.brand,
    this.price,
    this.currency,
    this.image,
    this.account,
  });
  MarketPlaceModelNewProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    productType = json['product_type']?.toString();
    accountId = json['account_id']?.toString();
    name = json['name']?.toString();
    summary = json['summary']?.toString();
    description = json['description']?.toString();
    brand = json['brand']?.toString();
    price = json['price']?.toString();
    currency = json['currency']?.toString();
    image = (json['image'] != null)
        ? MarketPlaceModelNewProductsDataImage.fromJson(json['image'])
        : null;
    account = (json['account'] != null)
        ? MarketPlaceModelNewProductsDataAccount.fromJson(json['account'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['account_id'] = accountId;
    data['name'] = name;
    data['summary'] = summary;
    data['description'] = description;
    data['brand'] = brand;
    data['price'] = price;
    data['currency'] = currency;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (account != null) {
      data['account'] = account!.toJson();
    }
    return data;
  }
}

class MarketPlaceModelNewProducts {
/*
{
  "data": [
    {
      "id": "11",
      "product_type": "",
      "account_id": "2",
      "name": "New Balance Shoes",
      "summary": "New Balance 550",
      "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
      "brand": "1",
      "price": "5000.00",
      "currency": "TRY",
      "image": {
        "id": 0,
        "url": "",
        "product_id": "11"
      },
      "account": {
        "id": "2",
        "type": "company",
        "username": "user_2",
        "name": "FIBYTE INTERNET SOLUTIONS",
        "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
        "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
      }
    }
  ],
  "count": "148"
} 
*/

  List<MarketPlaceModelNewProductsData?>? data;
  String? count;

  MarketPlaceModelNewProducts({
    this.data,
    this.count,
  });
  MarketPlaceModelNewProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <MarketPlaceModelNewProductsData>[];
      v.forEach((v) {
        arr0.add(MarketPlaceModelNewProductsData.fromJson(v));
      });
      data = arr0;
    }
    count = json['count']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['data'] = arr0;
    }
    data['count'] = count;
    return data;
  }
}

class MarketPlaceModelMostDemandProductsDataAccount {
/*
{
  "id": "128",
  "type": "company",
  "username": "user_128",
  "name": "Azraa Giyim",
  "photo": "https://api.businessucces.com/uploads/logos/2023/04/03042023154106-1680525666.png",
  "cover": ""
} 
*/

  String? id;
  String? type;
  String? username;
  String? name;
  String? photo;
  String? cover;

  MarketPlaceModelMostDemandProductsDataAccount({
    this.id,
    this.type,
    this.username,
    this.name,
    this.photo,
    this.cover,
  });
  MarketPlaceModelMostDemandProductsDataAccount.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    username = json['username']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
    cover = json['cover']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['username'] = username;
    data['name'] = name;
    data['photo'] = photo;
    data['cover'] = cover;
    return data;
  }
}

class MarketPlaceModelMostDemandProductsDataImage {
/*
{
  "id": "31",
  "url": "https://api.businessucces.com/uploads/products/2023/04/03042023155354-1680526434.jpg",
  "product_id": "98"
} 
*/

  String? id;
  String? url;
  String? productId;

  MarketPlaceModelMostDemandProductsDataImage({
    this.id,
    this.url,
    this.productId,
  });
  MarketPlaceModelMostDemandProductsDataImage.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    url = json['url']?.toString();
    productId = json['product_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['product_id'] = productId;
    return data;
  }
}

class MarketPlaceModelMostDemandProductsData {
/*
{
  "id": "98",
  "product_type": "",
  "account_id": "128",
  "name": "Kürklü Kaban",
  "summary": "Kürklü Kaban",
  "description": "<figure class=\"table\"><table><tbody><tr><td>Kaşmir Ve Yün Karışımlı Kaban, Sıcak Bej Tonda, Bornozdan İlham Alan Klasik Bir Silüettir. Yassı Bir Şekil İçin Belden Perçinleme Ve Diz Ortasına İnme, Çıkarılabilir Kürk Süslemeli Manşetler Ve Yaka İle Süslenmiş Ve İmzamız Olan Kabartmalı Düğmelerle Süslenmiştir. Çok Yönlü Silüet, Kabanları Tercih Ettiğiniz Klasik Ve Spor Ayakkabı, Etek Ve Pantolonlarla Kombinlemenizi Sağlar. Malzeme: %55 İşlenmemiş Yün, %35 Angora, %10 Kaşmir Döşeme: %100 Kürkü Çıkarılabilir Manşetler Ve Yaka Geniş Yaka Kanatlı Cepler Kendinden Kemerli Tasarım Kabartmalı Düğmeler Çıkarılabilir Kemer, Kemer Köprüleri, Kendinden Bağlanan Kemer Bakım Talimatları: Uzman Temizliği</td></tr></tbody></table></figure>",
  "brand": "1",
  "price": "9899.34",
  "currency": "TRY",
  "image": {
    "id": "31",
    "url": "https://api.businessucces.com/uploads/products/2023/04/03042023155354-1680526434.jpg",
    "product_id": "98"
  },
  "account": {
    "id": "128",
    "type": "company",
    "username": "user_128",
    "name": "Azraa Giyim",
    "photo": "https://api.businessucces.com/uploads/logos/2023/04/03042023154106-1680525666.png",
    "cover": ""
  }
} 
*/

  String? id;
  String? productType;
  String? accountId;
  String? name;
  String? summary;
  String? description;
  String? brand;
  String? price;
  String? currency;
  MarketPlaceModelMostDemandProductsDataImage? image;
  MarketPlaceModelMostDemandProductsDataAccount? account;

  MarketPlaceModelMostDemandProductsData({
    this.id,
    this.productType,
    this.accountId,
    this.name,
    this.summary,
    this.description,
    this.brand,
    this.price,
    this.currency,
    this.image,
    this.account,
  });
  MarketPlaceModelMostDemandProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    productType = json['product_type']?.toString();
    accountId = json['account_id']?.toString();
    name = json['name']?.toString();
    summary = json['summary']?.toString();
    description = json['description']?.toString();
    brand = json['brand']?.toString();
    price = json['price']?.toString();
    currency = json['currency']?.toString();
    image = (json['image'] != null)
        ? MarketPlaceModelMostDemandProductsDataImage.fromJson(json['image'])
        : null;
    account = (json['account'] != null)
        ? MarketPlaceModelMostDemandProductsDataAccount.fromJson(
            json['account'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['account_id'] = accountId;
    data['name'] = name;
    data['summary'] = summary;
    data['description'] = description;
    data['brand'] = brand;
    data['price'] = price;
    data['currency'] = currency;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (account != null) {
      data['account'] = account!.toJson();
    }
    return data;
  }
}

class MarketPlaceModelMostDemandProducts {
/*
{
  "data": [
    {
      "id": "98",
      "product_type": "",
      "account_id": "128",
      "name": "Kürklü Kaban",
      "summary": "Kürklü Kaban",
      "description": "<figure class=\"table\"><table><tbody><tr><td>Kaşmir Ve Yün Karışımlı Kaban, Sıcak Bej Tonda, Bornozdan İlham Alan Klasik Bir Silüettir. Yassı Bir Şekil İçin Belden Perçinleme Ve Diz Ortasına İnme, Çıkarılabilir Kürk Süslemeli Manşetler Ve Yaka İle Süslenmiş Ve İmzamız Olan Kabartmalı Düğmelerle Süslenmiştir. Çok Yönlü Silüet, Kabanları Tercih Ettiğiniz Klasik Ve Spor Ayakkabı, Etek Ve Pantolonlarla Kombinlemenizi Sağlar. Malzeme: %55 İşlenmemiş Yün, %35 Angora, %10 Kaşmir Döşeme: %100 Kürkü Çıkarılabilir Manşetler Ve Yaka Geniş Yaka Kanatlı Cepler Kendinden Kemerli Tasarım Kabartmalı Düğmeler Çıkarılabilir Kemer, Kemer Köprüleri, Kendinden Bağlanan Kemer Bakım Talimatları: Uzman Temizliği</td></tr></tbody></table></figure>",
      "brand": "1",
      "price": "9899.34",
      "currency": "TRY",
      "image": {
        "id": "31",
        "url": "https://api.businessucces.com/uploads/products/2023/04/03042023155354-1680526434.jpg",
        "product_id": "98"
      },
      "account": {
        "id": "128",
        "type": "company",
        "username": "user_128",
        "name": "Azraa Giyim",
        "photo": "https://api.businessucces.com/uploads/logos/2023/04/03042023154106-1680525666.png",
        "cover": ""
      }
    }
  ],
  "count": "148"
} 
*/

  List<MarketPlaceModelMostDemandProductsData?>? data;
  String? count;

  MarketPlaceModelMostDemandProducts({
    this.data,
    this.count,
  });
  MarketPlaceModelMostDemandProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <MarketPlaceModelMostDemandProductsData>[];
      v.forEach((v) {
        arr0.add(MarketPlaceModelMostDemandProductsData.fromJson(v));
      });
      data = arr0;
    }
    count = json['count']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['data'] = arr0;
    }
    data['count'] = count;
    return data;
  }
}

class MarketPlaceModelCompletedOrdersSeller {
/*
{
  "id": "2",
  "type": "company",
  "username": "user_2",
  "name": "FIBYTE INTERNET SOLUTIONS",
  "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
  "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
} 
*/

  String? id;
  String? type;
  String? username;
  String? name;
  String? photo;
  String? cover;

  MarketPlaceModelCompletedOrdersSeller({
    this.id,
    this.type,
    this.username,
    this.name,
    this.photo,
    this.cover,
  });
  MarketPlaceModelCompletedOrdersSeller.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    username = json['username']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
    cover = json['cover']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['username'] = username;
    data['name'] = name;
    data['photo'] = photo;
    data['cover'] = cover;
    return data;
  }
}

class MarketPlaceModelCompletedOrdersComment {
/*
{
  "id": 1,
  "comment": "Hızlı ve güvenli bir alışveriş oldu. Paketleme güzeldi, bir kaç kez müşteri temsilcileri ile de görüştüm, gayet nazik ve açıklayıcı yönlendirmelerde bulundular. Memnun oldum tavsiye ederim."
} 
*/

  int? id;
  String? comment;

  MarketPlaceModelCompletedOrdersComment({
    this.id,
    this.comment,
  });
  MarketPlaceModelCompletedOrdersComment.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    comment = json['comment']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['comment'] = comment;
    return data;
  }
}

class MarketPlaceModelCompletedOrdersUser {
/*
{
  "id": "1",
  "type": "personal",
  "username": "user_1",
  "name": "Mehmet Can",
  "photo": "https://api.businessucces.com/uploads/profile/2023/03/20032023122543-1679311543.jpg",
  "cover": ""
} 
*/

  String? id;
  String? type;
  String? username;
  String? name;
  String? photo;
  String? cover;

  MarketPlaceModelCompletedOrdersUser({
    this.id,
    this.type,
    this.username,
    this.name,
    this.photo,
    this.cover,
  });
  MarketPlaceModelCompletedOrdersUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    username = json['username']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
    cover = json['cover']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['username'] = username;
    data['name'] = name;
    data['photo'] = photo;
    data['cover'] = cover;
    return data;
  }
}

class MarketPlaceModelCompletedOrders {
/*
{
  "id": 1,
  "user": {
    "id": "1",
    "type": "personal",
    "username": "user_1",
    "name": "Mehmet Can",
    "photo": "https://api.businessucces.com/uploads/profile/2023/03/20032023122543-1679311543.jpg",
    "cover": ""
  },
  "comment": {
    "id": 1,
    "comment": "Hızlı ve güvenli bir alışveriş oldu. Paketleme güzeldi, bir kaç kez müşteri temsilcileri ile de görüştüm, gayet nazik ve açıklayıcı yönlendirmelerde bulundular. Memnun oldum tavsiye ederim."
  },
  "seller": {
    "id": "2",
    "type": "company",
    "username": "user_2",
    "name": "FIBYTE INTERNET SOLUTIONS",
    "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
    "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
  }
} 
*/

  int? id;
  MarketPlaceModelCompletedOrdersUser? user;
  MarketPlaceModelCompletedOrdersComment? comment;
  MarketPlaceModelCompletedOrdersSeller? seller;

  MarketPlaceModelCompletedOrders({
    this.id,
    this.user,
    this.comment,
    this.seller,
  });
  MarketPlaceModelCompletedOrders.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    user = (json['user'] != null)
        ? MarketPlaceModelCompletedOrdersUser.fromJson(json['user'])
        : null;
    comment = (json['comment'] != null)
        ? MarketPlaceModelCompletedOrdersComment.fromJson(json['comment'])
        : null;
    seller = (json['seller'] != null)
        ? MarketPlaceModelCompletedOrdersSeller.fromJson(json['seller'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (comment != null) {
      data['comment'] = comment!.toJson();
    }
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    return data;
  }
}

class MarketPlaceModelSliders {
/*
{
  "id": "1",
  "title": "Out clients can always expect safe",
  "content": "PortLine Limousine and Car Service specialized in high quality transportation. Our clients can always expect safe, dependable and affordable luxury.",
  "image": "https://api.businessucces.com/sliders/slider1x.png",
  "url": "https://papi.kerkenes.com/content/123"
} 
*/

  String? id;
  String? title;
  String? content;
  String? image;
  String? url;

  MarketPlaceModelSliders({
    this.id,
    this.title,
    this.content,
    this.image,
    this.url,
  });
  MarketPlaceModelSliders.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title']?.toString();
    content = json['content']?.toString();
    image = json['image']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}

class MarketPlaceModelCategoriesProductsDataAccount {
/*
{
  "id": "2",
  "type": "company",
  "username": "user_2",
  "name": "FIBYTE INTERNET SOLUTIONS",
  "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
  "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
} 
*/

  String? id;
  String? type;
  String? username;
  String? name;
  String? photo;
  String? cover;

  MarketPlaceModelCategoriesProductsDataAccount({
    this.id,
    this.type,
    this.username,
    this.name,
    this.photo,
    this.cover,
  });
  MarketPlaceModelCategoriesProductsDataAccount.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    username = json['username']?.toString();
    name = json['name']?.toString();
    photo = json['photo']?.toString();
    cover = json['cover']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['username'] = username;
    data['name'] = name;
    data['photo'] = photo;
    data['cover'] = cover;
    return data;
  }
}

class MarketPlaceModelCategoriesProductsDataImage {
/*
{
  "id": 0,
  "url": "",
  "product_id": "11"
} 
*/

  String? id;
  String? url;
  String? productId;

  MarketPlaceModelCategoriesProductsDataImage({
    this.id,
    this.url,
    this.productId,
  });
  MarketPlaceModelCategoriesProductsDataImage.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toString();
    url = json['url']?.toString();
    productId = json['product_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['product_id'] = productId;
    return data;
  }
}

class MarketPlaceModelCategoriesProductsData {
/*
{
  "id": "11",
  "product_type": "",
  "account_id": "2",
  "name": "New Balance Shoes",
  "summary": "New Balance 550",
  "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
  "brand": "1",
  "price": "5000.00",
  "currency": "TRY",
  "image": {
    "id": 0,
    "url": "",
    "product_id": "11"
  },
  "account": {
    "id": "2",
    "type": "company",
    "username": "user_2",
    "name": "FIBYTE INTERNET SOLUTIONS",
    "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
    "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
  }
} 
*/

  String? id;
  String? productType;
  String? accountId;
  String? name;
  String? summary;
  String? description;
  String? brand;
  String? price;
  String? currency;
  MarketPlaceModelCategoriesProductsDataImage? image;
  MarketPlaceModelCategoriesProductsDataAccount? account;

  MarketPlaceModelCategoriesProductsData({
    this.id,
    this.productType,
    this.accountId,
    this.name,
    this.summary,
    this.description,
    this.brand,
    this.price,
    this.currency,
    this.image,
    this.account,
  });
  MarketPlaceModelCategoriesProductsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    productType = json['product_type']?.toString();
    accountId = json['account_id']?.toString();
    name = json['name']?.toString();
    summary = json['summary']?.toString();
    description = json['description']?.toString();
    brand = json['brand']?.toString();
    price = json['price']?.toString();
    currency = json['currency']?.toString();
    image = (json['image'] != null)
        ? MarketPlaceModelCategoriesProductsDataImage.fromJson(json['image'])
        : null;
    account = (json['account'] != null)
        ? MarketPlaceModelCategoriesProductsDataAccount.fromJson(
            json['account'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['account_id'] = accountId;
    data['name'] = name;
    data['summary'] = summary;
    data['description'] = description;
    data['brand'] = brand;
    data['price'] = price;
    data['currency'] = currency;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    if (account != null) {
      data['account'] = account!.toJson();
    }
    return data;
  }
}

class MarketPlaceModelCategoriesProducts {
/*
{
  "data": [
    {
      "id": "11",
      "product_type": "",
      "account_id": "2",
      "name": "New Balance Shoes",
      "summary": "New Balance 550",
      "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
      "brand": "1",
      "price": "5000.00",
      "currency": "TRY",
      "image": {
        "id": 0,
        "url": "",
        "product_id": "11"
      },
      "account": {
        "id": "2",
        "type": "company",
        "username": "user_2",
        "name": "FIBYTE INTERNET SOLUTIONS",
        "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
        "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
      }
    }
  ],
  "count": "148"
} 
*/

  List<MarketPlaceModelCategoriesProductsData?>? data;
  String? count;

  MarketPlaceModelCategoriesProducts({
    this.data,
    this.count,
  });
  MarketPlaceModelCategoriesProducts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <MarketPlaceModelCategoriesProductsData>[];
      v.forEach((v) {
        arr0.add(MarketPlaceModelCategoriesProductsData.fromJson(v));
      });
      data = arr0;
    }
    count = json['count']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['data'] = arr0;
    }
    data['count'] = count;
    return data;
  }
}

class MarketPlaceModelCategories {
/*
{
  "id": "707",
  "parent_id": "0",
  "category_name": "İNŞAAT",
  "category_slug": "building",
  "sort": "1",
  "products": {
    "data": [
      {
        "id": "11",
        "product_type": "",
        "account_id": "2",
        "name": "New Balance Shoes",
        "summary": "New Balance 550",
        "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
        "brand": "1",
        "price": "5000.00",
        "currency": "TRY",
        "image": {
          "id": 0,
          "url": "",
          "product_id": "11"
        },
        "account": {
          "id": "2",
          "type": "company",
          "username": "user_2",
          "name": "FIBYTE INTERNET SOLUTIONS",
          "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
          "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
        }
      }
    ],
    "count": "148"
  }
} 
*/

  String? id;
  String? parentId;
  String? categoryName;
  String? categorySlug;
  String? sort;
  MarketPlaceModelCategoriesProducts? products;

  MarketPlaceModelCategories({
    this.id,
    this.parentId,
    this.categoryName,
    this.categorySlug,
    this.sort,
    this.products,
  });
  MarketPlaceModelCategories.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    parentId = json['parent_id']?.toString();
    categoryName = json['category_name']?.toString();
    categorySlug = json['category_slug']?.toString();
    sort = json['sort']?.toString();
    products = (json['products'] != null)
        ? MarketPlaceModelCategoriesProducts.fromJson(json['products'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['category_name'] = categoryName;
    data['category_slug'] = categorySlug;
    data['sort'] = sort;
    if (products != null) {
      data['products'] = products!.toJson();
    }
    return data;
  }
}

class MarketPlaceModel {
/*
{
  "categories": [
    {
      "id": "707",
      "parent_id": "0",
      "category_name": "İNŞAAT",
      "category_slug": "building",
      "sort": "1",
      "products": {
        "data": [
          {
            "id": "11",
            "product_type": "",
            "account_id": "2",
            "name": "New Balance Shoes",
            "summary": "New Balance 550",
            "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
            "brand": "1",
            "price": "5000.00",
            "currency": "TRY",
            "image": {
              "id": 0,
              "url": "",
              "product_id": "11"
            },
            "account": {
              "id": "2",
              "type": "company",
              "username": "user_2",
              "name": "FIBYTE INTERNET SOLUTIONS",
              "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
              "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
            }
          }
        ],
        "count": "148"
      }
    }
  ],
  "sliders": [
    {
      "id": "1",
      "title": "Out clients can always expect safe",
      "content": "PortLine Limousine and Car Service specialized in high quality transportation. Our clients can always expect safe, dependable and affordable luxury.",
      "image": "https://api.businessucces.com/sliders/slider1x.png",
      "url": "https://papi.kerkenes.com/content/123"
    }
  ],
  "completed_orders": [
    {
      "id": 1,
      "user": {
        "id": "1",
        "type": "personal",
        "username": "user_1",
        "name": "Mehmet Can",
        "photo": "https://api.businessucces.com/uploads/profile/2023/03/20032023122543-1679311543.jpg",
        "cover": ""
      },
      "comment": {
        "id": 1,
        "comment": "Hızlı ve güvenli bir alışveriş oldu. Paketleme güzeldi, bir kaç kez müşteri temsilcileri ile de görüştüm, gayet nazik ve açıklayıcı yönlendirmelerde bulundular. Memnun oldum tavsiye ederim."
      },
      "seller": {
        "id": "2",
        "type": "company",
        "username": "user_2",
        "name": "FIBYTE INTERNET SOLUTIONS",
        "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
        "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
      }
    }
  ],
  "most_demand_products": {
    "data": [
      {
        "id": "98",
        "product_type": "",
        "account_id": "128",
        "name": "Kürklü Kaban",
        "summary": "Kürklü Kaban",
        "description": "<figure class=\"table\"><table><tbody><tr><td>Kaşmir Ve Yün Karışımlı Kaban, Sıcak Bej Tonda, Bornozdan İlham Alan Klasik Bir Silüettir. Yassı Bir Şekil İçin Belden Perçinleme Ve Diz Ortasına İnme, Çıkarılabilir Kürk Süslemeli Manşetler Ve Yaka İle Süslenmiş Ve İmzamız Olan Kabartmalı Düğmelerle Süslenmiştir. Çok Yönlü Silüet, Kabanları Tercih Ettiğiniz Klasik Ve Spor Ayakkabı, Etek Ve Pantolonlarla Kombinlemenizi Sağlar. Malzeme: %55 İşlenmemiş Yün, %35 Angora, %10 Kaşmir Döşeme: %100 Kürkü Çıkarılabilir Manşetler Ve Yaka Geniş Yaka Kanatlı Cepler Kendinden Kemerli Tasarım Kabartmalı Düğmeler Çıkarılabilir Kemer, Kemer Köprüleri, Kendinden Bağlanan Kemer Bakım Talimatları: Uzman Temizliği</td></tr></tbody></table></figure>",
        "brand": "1",
        "price": "9899.34",
        "currency": "TRY",
        "image": {
          "id": "31",
          "url": "https://api.businessucces.com/uploads/products/2023/04/03042023155354-1680526434.jpg",
          "product_id": "98"
        },
        "account": {
          "id": "128",
          "type": "company",
          "username": "user_128",
          "name": "Azraa Giyim",
          "photo": "https://api.businessucces.com/uploads/logos/2023/04/03042023154106-1680525666.png",
          "cover": ""
        }
      }
    ],
    "count": "148"
  },
  "new_products": {
    "data": [
      {
        "id": "11",
        "product_type": "",
        "account_id": "2",
        "name": "New Balance Shoes",
        "summary": "New Balance 550",
        "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
        "brand": "1",
        "price": "5000.00",
        "currency": "TRY",
        "image": {
          "id": 0,
          "url": "",
          "product_id": "11"
        },
        "account": {
          "id": "2",
          "type": "company",
          "username": "user_2",
          "name": "FIBYTE INTERNET SOLUTIONS",
          "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
          "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
        }
      }
    ],
    "count": "148"
  },
  "popular_products": {
    "data": [
      {
        "id": "11",
        "product_type": "",
        "account_id": "2",
        "name": "New Balance Shoes",
        "summary": "New Balance 550",
        "description": "<h3>testtt</h3><p>&nbsp;</p><p><strong>Merhaba Deneme&nbsp;</strong></p>",
        "brand": "1",
        "price": "5000.00",
        "currency": "TRY",
        "image": {
          "id": 0,
          "url": "",
          "product_id": "11"
        },
        "account": {
          "id": "2",
          "type": "company",
          "username": "user_2",
          "name": "FIBYTE INTERNET SOLUTIONS",
          "photo": "https://api.businessucces.com/uploads/logos/2023/03/11032023000237-1678489357.png",
          "cover": "https://api.businessucces.com/uploads/company_covers/2023/03/11032023000435-1678489475.png"
        }
      }
    ],
    "count": "148"
  }
} 
*/

  List<MarketPlaceModelCategories?>? categories;
  List<MarketPlaceModelSliders?>? sliders;
  List<MarketPlaceModelCompletedOrders?>? completedOrders;
  MarketPlaceModelMostDemandProducts? mostDemandProducts;
  MarketPlaceModelNewProducts? newProducts;
  MarketPlaceModelPopularProducts? popularProducts;

  MarketPlaceModel({
    this.categories,
    this.sliders,
    this.completedOrders,
    this.mostDemandProducts,
    this.newProducts,
    this.popularProducts,
  });
  MarketPlaceModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      final v = json['categories'];
      final arr0 = <MarketPlaceModelCategories>[];
      v.forEach((v) {
        arr0.add(MarketPlaceModelCategories.fromJson(v));
      });
      categories = arr0;
    }
    if (json['sliders'] != null) {
      final v = json['sliders'];
      final arr0 = <MarketPlaceModelSliders>[];
      v.forEach((v) {
        arr0.add(MarketPlaceModelSliders.fromJson(v));
      });
      sliders = arr0;
    }
    if (json['completed_orders'] != null) {
      final v = json['completed_orders'];
      final arr0 = <MarketPlaceModelCompletedOrders>[];
      v.forEach((v) {
        arr0.add(MarketPlaceModelCompletedOrders.fromJson(v));
      });
      completedOrders = arr0;
    }
    mostDemandProducts = (json['most_demand_products'] != null)
        ? MarketPlaceModelMostDemandProducts.fromJson(
            json['most_demand_products'])
        : null;
    newProducts = (json['new_products'] != null)
        ? MarketPlaceModelNewProducts.fromJson(json['new_products'])
        : null;
    popularProducts = (json['popular_products'] != null)
        ? MarketPlaceModelPopularProducts.fromJson(json['popular_products'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (categories != null) {
      final v = categories;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['categories'] = arr0;
    }
    if (sliders != null) {
      final v = sliders;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['sliders'] = arr0;
    }
    if (completedOrders != null) {
      final v = completedOrders;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['completed_orders'] = arr0;
    }
    if (mostDemandProducts != null) {
      data['most_demand_products'] = mostDemandProducts!.toJson();
    }
    if (newProducts != null) {
      data['new_products'] = newProducts!.toJson();
    }
    if (popularProducts != null) {
      data['popular_products'] = popularProducts!.toJson();
    }
    return data;
  }
}
