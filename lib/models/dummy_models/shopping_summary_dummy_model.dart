class ShoppingSummaryDummyModel {
  int? id;
  String? imgUrl;
  String? companyName;
  String? location;
  String? rating;

  ShoppingSummaryDummyModel(
      {this.id, this.imgUrl, this.companyName, this.location, this.rating});

  ShoppingSummaryDummyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    companyName = json['companyName'];
    location = json['location'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['imgUrl'] = imgUrl;
    data['companyName'] = companyName;
    data['location'] = location;
    data['rating'] = rating;
    return data;
  }
}
