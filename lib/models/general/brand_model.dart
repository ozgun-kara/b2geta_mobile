///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class BrandModel {
/*
{
  "id": "1",
  "name": "My Band"
}
*/

  String? id;
  String? name;

  BrandModel({
    this.id,
    this.name,
  });
  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
