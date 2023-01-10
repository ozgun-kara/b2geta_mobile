import 'package:b2geta_mobile/models/city_model.dart';
import 'package:b2geta_mobile/models/country_model.dart';
import 'package:b2geta_mobile/models/settings_model.dart';

class CompanyModel {
  String? id;
  String? name;
  String? taxOffice;
  String? taxNumber;
  String? phone;
  String? email;
  CountryModel? country;
  City? city;
  String? district;
  String? address;
  String? postalCode;
  String? logo;
  String? about;
  SettingsModel? settings;
  String? registrationDate;
  List<Collaborator>? collaborator;
  CompanyModel({
    this.id,
    this.name,
    this.taxOffice,
    this.taxNumber,
    this.phone,
    this.email,
    this.country,
    this.city,
    this.district,
    this.address,
    this.postalCode,
    this.logo,
    this.about,
    this.settings,
    this.registrationDate,
    this.collaborator,
  });


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(taxOffice != null){
      result.addAll({'taxOffice': taxOffice});
    }
    if(taxNumber != null){
      result.addAll({'taxNumber': taxNumber});
    }
    if(phone != null){
      result.addAll({'phone': phone});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(country != null){
      result.addAll({'country': country!.toMap()});
    }
    if(city != null){
      result.addAll({'city': city!.toMap()});
    }
    if(district != null){
      result.addAll({'district': district});
    }
    if(address != null){
      result.addAll({'address': address});
    }
    if(postalCode != null){
      result.addAll({'postalCode': postalCode});
    }
    if(logo != null){
      result.addAll({'logo': logo});
    }
    if(about != null){
      result.addAll({'about': about});
    }
    if(settings != null){
      result.addAll({'settings': settings!.toMap()});
    }
    if(registrationDate != null){
      result.addAll({'registrationDate': registrationDate});
    }
    if(collaborator != null){
      result.addAll({'collaborator': collaborator!.map((x) => x.toMap()).toList()});
    }
  
    return result;
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'],
      name: map['name'],
      taxOffice: map['taxOffice'],
      taxNumber: map['taxNumber'],
      phone: map['phone'],
      email: map['email'],
      country: map['country'] != null ? CountryModel.fromMap(map['country']) : null,
      city: map['city'] != null ? City.fromMap(map['city']) : null,
      district: map['district'],
      address: map['address'],
      postalCode: map['postalCode'],
      logo: map['logo'],
      about: map['about'],
      settings: map['settings'] != null ? SettingsModel.fromMap(map['settings']) : null,
      registrationDate: map['registrationDate'],
      collaborator: map['collaborator'] != null ? List<Collaborator>.from(map['collaborator']?.map((x) => Collaborator.fromMap(x))) : null,
    );
  }

  @override
  String toString() {
    return 'CompanyModel(id: $id, name: $name, taxOffice: $taxOffice, taxNumber: $taxNumber, phone: $phone, email: $email, country: $country, city: $city, district: $district, address: $address, postalCode: $postalCode, logo: $logo, about: $about, settings: $settings, registrationDate: $registrationDate, collaborator: $collaborator)';
  }
}

class Collaborator {
  String? id;
  String? role;
  String? name;
  String? photo;
  Collaborator({
    this.id,
    this.role,
    this.name,
    this.photo,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(role != null){
      result.addAll({'role': role});
    }
    if(name != null){
      result.addAll({'name': name});
    }
    if(photo != null){
      result.addAll({'photo': photo});
    }
  
    return result;
  }

  factory Collaborator.fromMap(Map<String, dynamic> map) {
    return Collaborator(
      id: map['id'],
      role: map['role'],
      name: map['name'],
      photo: map['photo'],
    );
  }


  @override
  String toString() {
    return 'Collaborator(id: $id, role: $role, name: $name, photo: $photo)';
  }
}
