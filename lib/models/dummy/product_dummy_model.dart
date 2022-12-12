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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['imgUrl'] = this.imgUrl;
    data['title'] = this.title;
    data['price'] = this.price;
    data['subTitle'] = this.subTitle;
    data['province'] = this.province;
    data['company'] = company;
    data['totalRate'] = this.totalRate;
    return data;
  }
}
