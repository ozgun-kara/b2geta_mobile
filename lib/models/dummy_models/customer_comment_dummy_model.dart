class CustomerCommentDummyModel {
  int? id;
  String? name;
  String? rating;
  String? date;
  String? flagImgUrl;
  String? country;
  String? comment;
  List<Null>? images;

  CustomerCommentDummyModel(
      {this.id,
        this.name,
        this.rating,
        this.date,
        this.flagImgUrl,
        this.country,
        this.comment,
        this.images});

  CustomerCommentDummyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    date = json['date'];
    flagImgUrl = json['flagImgUrl'];
    country = json['country'];
    comment = json['comment'];
    if (json['images'] != null) {
      images = <Null>[];
      json['images'].forEach((v) {
        // images!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['date'] = this.date;
    data['flagImgUrl'] = this.flagImgUrl;
    data['country'] = this.country;
    data['comment'] = this.comment;
    if (this.images != null) {
      // data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}