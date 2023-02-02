class SettingsModel {
  String? language;
  String? country;
  String? timezone;
  SettingsModel({
    this.language,
    this.country,
    this.timezone,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (language != null) {
      result.addAll({'language': language});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (timezone != null) {
      result.addAll({'timezone': timezone});
    }

    return result;
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      language: map['language'],
      country: map['country'],
      timezone: map['timezone'],
    );
  }

  @override
  String toString() =>
      'SettingsModel(language: $language, country: $country, timezone: $timezone)';
}
