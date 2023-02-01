import 'dart:convert';

import '../city_model.dart';
import '../country_model.dart';
import 'district_model.dart';

class AddressModel {
  String? id;
  String? userId;
  String? name;
  CountryModel? country;
  City? city;
  DistrictModel? district;
  String? address;
  String? postalCode;
  AddressModel({
    this.id,
    this.userId,
    this.name,
    this.country,
    this.city,
    this.district,
    this.address,
    this.postalCode,
  });


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(userId != null){
      result.addAll({'userId': userId});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(country != null){
      result.addAll({'country': country!.toMap()});
    }
    if(city != null){
      result.addAll({'city': city!.toMap()});
    }
    if(district != null){
      result.addAll({'district': district!.toMap()});
    }
    if(address != null){
      result.addAll({'address': address});
    }
    if(postalCode != null){
      result.addAll({'postalCode': postalCode});
    }
  
    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      userId: map['userId'],
      name: map['name'],
      country: map['country'] != null ? CountryModel.fromMap(map['country']) : null,
      city: map['city'] != null ? City.fromMap(map['city']) : null,
      district: map['district'] != null ? DistrictModel.fromMap(map['district']) : null,
      address: map['address'],
      postalCode: map['postalCode'],
    );
  }
}


/*
{
  "id": "39",
  "user_id": "57",
  "name": "Test",
  "country": {
    "id": "6",
    "name": "Andorra",
    "code": "AD",
    "phonecode": "376",
    "currency": "EUR",
    "currency_name": "Euro",
    "currency_symbol": "€",
    "timezones": [
      {
        "zoneName": "Europe/Andorra",
        "gmtOffset": 3600,
        "gmtOffsetName": "UTC+01:00",
        "abbreviation": "CET",
        "tzName": "Central European Time"
      }
    ],
    "flag": "🇦🇩"
  },
  "city": {
    "id": "488",
    "name": "Andorra la Vella"
  },
  "district": {
    "id": "1",
    "name": "Andorra la Vella"
  },
  "address": "test",
  "postal_code": "34345"
} 
*/