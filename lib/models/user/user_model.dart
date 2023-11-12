// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? id;
  String? token;
  String? type;
  String? userConfirmed;
  String? firstname;
  String? lastname;
  String? companyName;
  String? phone;
  String? email;
  String? avatar;
  String? cover;
  String? citizenshipNumber;
  String? taxOffice;
  String? taxNumber;
  String? gender;
  String? wantEmail;
  String? country;
  String? city;
  String? district;
  String? town;
  String? address;
  String? about;
  String? postalCode;
  String? languageCode;
  String? countryCode;
  String? timezone;
  String? createdAt;

  UserModel({
    this.id,
    this.token,
    this.type,
    this.userConfirmed,
    this.firstname,
    this.lastname,
    this.companyName,
    this.phone,
    this.email,
    this.avatar,
    this.cover,
    this.citizenshipNumber,
    this.taxOffice,
    this.taxNumber,
    this.gender,
    this.wantEmail,
    this.country,
    this.city,
    this.district,
    this.town,
    this.address,
    this.about,
    this.postalCode,
    this.languageCode,
    this.countryCode,
    this.timezone,
    this.createdAt,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    type = json['type']?.toString();
    userConfirmed = json['user_confirmed']?.toString();
    firstname = json['firstname']?.toString();
    lastname = json['lastname']?.toString();
    phone = json['phone']?.toString();
    email = json['email']?.toString();
    avatar = json['avatar']?.toString();
    cover = json['cover']?.toString();
    citizenshipNumber = json['citizenship_number']?.toString();
    taxOffice = json['tax_office']?.toString();
    taxNumber = json['tax_number']?.toString();
    gender = json['gender']?.toString();
    wantEmail = json['want_email']?.toString();
    country = json['country']?.toString();
    city = json['city']?.toString();
    district = json['district']?.toString();
    town = json['town']?.toString();
    address = json['address']?.toString();
    about = json['about']?.toString();
    postalCode = json['postal_code']?.toString();
    languageCode = json['language_code']?.toString();
    countryCode = json['country_code']?.toString();
    timezone = json['timezone']?.toString();
    createdAt = json['created_at']?.toString();
  }

  @override
  String toString() {
    return 'UserModel(id: $id,type: $type, userConfirmed: $userConfirmed, firstname: $firstname, lastname: $lastname, phone: $phone, email: $email, avatar: $avatar, cover: $cover, citizenshipNumber: $citizenshipNumber, taxOffice: $taxOffice, taxNumber: $taxNumber, gender: $gender, wantEmail: $wantEmail, country: $country, city: $city, town: $town, address: $address, about: $about, postalCode: $postalCode, languageCode: $languageCode, countryCode: $countryCode, timezone: $timezone, createdAt: $createdAt)';
  }

  UserModel copyWith({
    String? id,
    String? token,
    String? type,
    String? userConfirmed,
    String? firstname,
    String? lastname,
    String? companyName,
    String? phone,
    String? email,
    String? avatar,
    String? cover,
    String? citizenshipNumber,
    String? taxOffice,
    String? taxNumber,
    String? gender,
    String? wantEmail,
    String? country,
    String? city,
    String? district,
    String? town,
    String? address,
    String? about,
    String? postalCode,
    String? languageCode,
    String? countryCode,
    String? timezone,
    String? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      token: token ?? this.token,
      type: type ?? this.type,
      userConfirmed: userConfirmed ?? this.userConfirmed,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      companyName: companyName ?? this.companyName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      cover: cover ?? this.cover,
      citizenshipNumber: citizenshipNumber ?? this.citizenshipNumber,
      taxOffice: taxOffice ?? this.taxOffice,
      taxNumber: taxNumber ?? this.taxNumber,
      gender: gender ?? this.gender,
      wantEmail: wantEmail ?? this.wantEmail,
      country: country ?? this.country,
      city: city ?? this.city,
      district: district ?? this.district,
      town: town ?? this.town,
      address: address ?? this.address,
      about: about ?? this.about,
      postalCode: postalCode ?? this.postalCode,
      languageCode: languageCode ?? this.languageCode,
      countryCode: countryCode ?? this.countryCode,
      timezone: timezone ?? this.timezone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
