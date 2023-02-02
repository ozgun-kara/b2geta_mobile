class ShoppingSummaryDummyModel {
  int? id;
  String? imgUrl;
  String? companyName;
  bool? verification;
  String? location;
  String? rating;

  ShoppingSummaryDummyModel(
      {this.id,
      this.imgUrl,
      this.companyName,
      this.verification,
      this.location,
      this.rating});

  ShoppingSummaryDummyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgUrl = json['imgUrl'];
    companyName = json['companyName'];
    verification = json['verification'];
    location = json['location'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imgUrl'] = imgUrl;
    data['companyName'] = companyName;
    data['verification'] = verification;
    data['location'] = location;
    data['rating'] = rating;
    return data;
  }
}
