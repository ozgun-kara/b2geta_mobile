class CountryModel {
  String? id;
  String? name;
  String? code;
  String? phonecode;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  List<Timezones>? timezones;
  String? flag;

  CountryModel(
      {this.id,
      this.name,
      this.code,
      this.phonecode,
      this.currency,
      this.currencyName,
      this.currencySymbol,
      this.timezones,
      this.flag});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    phonecode = json['phonecode'];
    currency = json['currency'];
    currencyName = json['currency_name'];
    currencySymbol = json['currency_symbol'];
    if (json['timezones'] != null) {
      timezones = <Timezones>[];
      json['timezones'].forEach((v) {
        timezones!.add(Timezones.fromJson(v));
      });
    }
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['phonecode'] = phonecode;
    data['currency'] = currency;
    data['currency_name'] = currencyName;
    data['currency_symbol'] = currencySymbol;
    if (timezones != null) {
      data['timezones'] = timezones!.map((v) => v.toJson()).toList();
    }
    data['flag'] = flag;
    return data;
  }
}

class Timezones {
  String? zoneName;
  int? gmtOffset;
  String? gmtOffsetName;
  String? abbreviation;
  String? tzName;

  Timezones(
      {this.zoneName,
      this.gmtOffset,
      this.gmtOffsetName,
      this.abbreviation,
      this.tzName});

  Timezones.fromJson(Map<String, dynamic> json) {
    zoneName = json['zoneName'];
    gmtOffset = json['gmtOffset'];
    gmtOffsetName = json['gmtOffsetName'];
    abbreviation = json['abbreviation'];
    tzName = json['tzName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['zoneName'] = zoneName;
    data['gmtOffset'] = gmtOffset;
    data['gmtOffsetName'] = gmtOffsetName;
    data['abbreviation'] = abbreviation;
    data['tzName'] = tzName;
    return data;
  }
}
