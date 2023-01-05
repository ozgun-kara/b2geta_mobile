class CustomerCommentDummyModel {
  CustomerCommentDummyModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.date,
    required this.flagImgUrl,
    required this.country,
    required this.comment,
    required this.images,
  });

  int id;
  String name;
  String rating;
  String date;
  String flagImgUrl;
  String country;
  String comment;
  List<String> images;

  factory CustomerCommentDummyModel.fromJson(Map<String, dynamic> json) =>
      CustomerCommentDummyModel(
        id: json["id"],
        name: json["name"],
        rating: json["rating"],
        date: json["date"],
        flagImgUrl: json["flagImgUrl"],
        country: json["country"],
        comment: json["comment"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rating": rating,
        "date": date,
        "flagImgUrl": flagImgUrl,
        "country": country,
        "comment": comment,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
