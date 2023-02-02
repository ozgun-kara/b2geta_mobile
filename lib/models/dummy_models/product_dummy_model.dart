class ProductDummyModel {
  int? id;
  String? imgUrl;
  String? title;
  String? price;
  String? subTitle;
  String? province;
  String? company;
  String? totalRate;

  ProductDummyModel(
      {this.id,
      this.imgUrl,
      this.title,
      this.price,
      this.subTitle,
      this.province,
      this.company,
      this.totalRate});

  ProductDummyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    title = json['title'];
    price = json['price'];
    subTitle = json['subTitle'];
    province = json['province'];
    company = json['company'];
    totalRate = json['totalRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imgUrl'] = imgUrl;
    data['title'] = title;
    data['price'] = price;
    data['subTitle'] = subTitle;
    data['province'] = province;
    data['company'] = company;
    data['totalRate'] = totalRate;
    return data;
  }
}
