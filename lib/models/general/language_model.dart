class LanguageModel {
  String? languageCode;
  String? languageName;
  String? defaultt;

  LanguageModel({this.languageCode, this.languageName, this.defaultt});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    languageCode = json['language_code'];
    languageName = json['language_name'];
    defaultt = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['language_code'] = languageCode;
    data['language_name'] = languageName;
    data['default'] = defaultt;
    return data;
  }
}
