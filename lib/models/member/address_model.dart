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

    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (country != null) {
      result.addAll({'country': country!.toMap()});
    }
    if (city != null) {
      result.addAll({'city': city!.toMap()});
    }
    if (district != null) {
      result.addAll({'district': district!.toMap()});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (postalCode != null) {
      result.addAll({'postalCode': postalCode});
    }

    return result;
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      id: map['id'],
      userId: map['userId'],
      name: map['name'],
      country:
          map['country'] != null ? CountryModel.fromMap(map['country']) : null,
      city: map['city'] != null ? City.fromMap(map['city']) : null,
      district: map['district'] != null
          ? DistrictModel.fromMap(map['district'])
          : null,
      address: map['address'],
      postalCode: map['postalCode'],
    );
  }
}


