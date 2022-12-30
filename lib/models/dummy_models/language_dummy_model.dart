class LanguageDummyModel {
  int? id;
  String? language;

  LanguageDummyModel({this.id, this.language});

  LanguageDummyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['language'] = language;
    return data;
  }
}
