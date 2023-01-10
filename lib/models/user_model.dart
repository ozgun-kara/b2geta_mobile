// ignore_for_file: non_constant_identifier_names
import 'package:b2geta_mobile/models/company_model.dart';
import 'package:b2geta_mobile/models/country_model.dart';
import 'package:b2geta_mobile/models/settings_model.dart';
import 'package:b2geta_mobile/models/town_model.dart';

class UserModel {
  String? id;
  String? type; // Personel/Company
  String? email;
  String? password;
  String? registrationDate;
  String? token;
  String? firstname;
  String? lastname;
  String? citizenshipNumber;
  String? phone_number;
  String? gender; // Male/Female
  String? photo;
  String? cover;
  String? company_name;
  String? taxOffice;
  String? taxNumber;
  CountryModel? country;
  String? city;
  String? district;
  TownModel? town;
  String? address;
  String? postalCode;
  String? about;
  SettingsModel? settings;
  String? want_email; // 1/0
  List<CompanyModel>? companies;
  UserModel({
    this.id,
    this.type,
    this.email,
    this.password,
    this.registrationDate,
    this.token,
    this.firstname,
    this.lastname,
    this.citizenshipNumber,
    this.phone_number,
    this.gender,
    this.photo,
    this.cover,
    this.company_name,
    this.taxOffice,
    this.taxNumber,
    this.country,
    this.city,
    this.district,
    this.town,
    this.address,
    this.postalCode,
    this.about,
    this.settings,
    this.want_email,
    this.companies,
  });



  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(type != null){
      result.addAll({'type': type});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(password != null){
      result.addAll({'password': password});
    }
    if(registrationDate != null){
      result.addAll({'registrationDate': registrationDate});
    }
    if(token != null){
      result.addAll({'token': token});
    }
    if(firstname != null){
      result.addAll({'firstname': firstname});
    }
    if(lastname != null){
      result.addAll({'lastname': lastname});
    }
    if(citizenshipNumber != null){
      result.addAll({'citizenshipNumber': citizenshipNumber});
    }
    if(phone_number != null){
      result.addAll({'phone_number': phone_number});
    }
    if(gender != null){
      result.addAll({'gender': gender});
    }
    if(photo != null){
      result.addAll({'photo': photo});
    }
    if(cover != null){
      result.addAll({'cover': cover});
    }
    if(company_name != null){
      result.addAll({'company_name': company_name});
    }
    if(taxOffice != null){
      result.addAll({'taxOffice': taxOffice});
    }
    if(taxNumber != null){
      result.addAll({'taxNumber': taxNumber});
    }
    if(country != null){
      result.addAll({'country': country!.toMap()});
    }
    if(city != null){
      result.addAll({'city': city});
    }
    if(district != null){
      result.addAll({'district': district});
    }
    if(town != null){
      result.addAll({'town': town!.toMap()});
    }
    if(address != null){
      result.addAll({'address': address});
    }
    if(postalCode != null){
      result.addAll({'postalCode': postalCode});
    }
    if(about != null){
      result.addAll({'about': about});
    }
    if(settings != null){
      result.addAll({'settings': settings!.toMap()});
    }
    if(want_email != null){
      result.addAll({'want_email': want_email});
    }
    if(companies != null){
      result.addAll({'companies': companies!.map((x) => x.toMap()).toList()});
    }
  
    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      type: map['type'],
      email: map['email'],
      password: map['password'],
      registrationDate: map['registrationDate'],
      token: map['token'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      citizenshipNumber: map['citizenshipNumber'],
      phone_number: map['phone_number'],
      gender: map['gender'],
      photo: map['photo'],
      cover: map['cover'],
      company_name: map['company_name'],
      taxOffice: map['taxOffice'],
      taxNumber: map['taxNumber'],
      country: map['country'] != null ? CountryModel.fromMap(map['country']) : null,
      city: map['city'],
      district: map['district'],
      town: map['town'] != null ? TownModel.fromMap(map['town']) : null,
      address: map['address'],
      postalCode: map['postalCode'],
      about: map['about'],
      settings: map['settings'] != null ? SettingsModel.fromMap(map['settings']) : null,
      want_email: map['want_email'],
      companies: map['companies'] != null ? List<CompanyModel>.from(map['companies']?.map((x) => CompanyModel.fromMap(x))) : null,
    );
  }


  @override
  String toString() {
    return 'UserModel(id: $id, type: $type, email: $email, password: $password, registrationDate: $registrationDate, token: $token, firstname: $firstname, lastname: $lastname, citizenshipNumber: $citizenshipNumber, phone_number: $phone_number, gender: $gender, photo: $photo, cover: $cover, company_name: $company_name, taxOffice: $taxOffice, taxNumber: $taxNumber, country: $country, city: $city, district: $district, town: $town, address: $address, postalCode: $postalCode, about: $about, settings: $settings, want_email: $want_email, companies: $companies)';
  }
}





/*
{
    "id": "93",
    "name": " ",
    "photo": "",
    "cover": "",
    "phone": "",
    "email": "test100.personal@gmail.com",
    "citizenship_number": "",
    "tax_office": "",
    "tax_number": "0",
    "gender": "Unknown",
    "country": {
        "id": "233",
        "name": "United States",
        "code": "US",
        "phonecode": "1",
        "currency": "USD",
        "currency_name": "United States dollar",
        "currency_symbol": "$",
        "timezones": [
            {
                "zoneName": "America/Adak",
                "gmtOffset": -36000,
                "gmtOffsetName": "UTC-10:00",
                "abbreviation": "HST",
                "tzName": "Hawaii–Aleutian Standard Time"
            },
            {
                "zoneName": "America/Anchorage",
                "gmtOffset": -32400,
                "gmtOffsetName": "UTC-09:00",
                "abbreviation": "AKST",
                "tzName": "Alaska Standard Time"
            }
        ],
        "flag": "🇺🇸"
    },
    "city": [],
    "district": [],
    "address": "",
    "postal_code": "",
    "about": "",
    "settings": {
        "language": "en",
        "country": "",
        "timezone": "-5.00"
    },
    "registration_date": "2022-11-18 17:38:22",
    "companies": [
        {
            "id": "99",
            "role": "admin",
            "name": "company name up",
            "logo": ""
        },
        {
            "id": "100",
            "role": "admin",
            "name": "company name",
            "logo": ""
        },
        {
            "id": "101",
            "role": "admin",
            "name": "Test Firma",
            "logo": ""
        },
        {
            "id": "401",
            "role": "admin",
            "name": "ahhahdfwe",
            "logo": ""
        }
    ]
}
*/