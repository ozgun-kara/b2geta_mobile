class CompanyAddressDummyModel {
  int? id;
  String? name;
  String? address;
  String? district;
  String? city;
  String? country;
  String? postalCode;

  CompanyAddressDummyModel(
      {this.id,
      this.name,
      this.address,
      this.district,
      this.city,
      this.country,
      this.postalCode});

  CompanyAddressDummyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    district = json['district'];
    city = json['city'];
    country = json['country'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['district'] = district;
    data['city'] = city;
    data['country'] = country;
    data['postal_code'] = postalCode;
    return data;
  }
}
