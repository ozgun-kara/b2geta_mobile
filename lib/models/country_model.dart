import 'package:b2geta_mobile/models/timezones_model.dart';

class CountryModel {
  String? id;
  String? name;
  String? code;
  String? phonecode;
  String? currency;
  String? currencyName;
  String? currencySymbol;
  List<TimezonesModel>? timezones;
  String? flag;
  CountryModel({
    this.id,
    this.name,
    this.code,
    this.phonecode,
    this.currency,
    this.currencyName,
    this.currencySymbol,
    this.timezones,
    this.flag,
  });
 

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(code != null){
      result.addAll({'code': code});
    }
    if(phonecode != null){
      result.addAll({'phonecode': phonecode});
    }
    if(currency != null){
      result.addAll({'currency': currency});
    }
    if(currencyName != null){
      result.addAll({'currencyName': currencyName});
    }
    if(currencySymbol != null){
      result.addAll({'currencySymbol': currencySymbol});
    }
    if(timezones != null){
      result.addAll({'timezones': timezones!.map((x) => x.toMap()).toList()});
    }
    if(flag != null){
      result.addAll({'flag': flag});
    }
  
    return result;
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id'],
      name: map['name'],
      code: map['code'],
      phonecode: map['phonecode'],
      currency: map['currency'],
      currencyName: map['currencyName'],
      currencySymbol: map['currencySymbol'],
      timezones: map['timezones'] != null ? List<TimezonesModel>.from(map['timezones']?.map((x) => TimezonesModel.fromMap(x))) : null,
      flag: map['flag'],
    );
  }

  @override
  String toString() {
    return 'CountryModel(id: $id, name: $name, code: $code, phonecode: $phonecode, currency: $currency, currencyName: $currencyName, currencySymbol: $currencySymbol, timezones: $timezones, flag: $flag)';
  }
}
