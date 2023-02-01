
class DistrictModel {
  String? id;
  String? name;

  DistrictModel({
    this.id,
    this.name,
  });


  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(name != null){
      result.addAll({'name': name});
    }
  
    return result;
  }

  factory DistrictModel.fromMap(Map<String, dynamic> map) {
    return DistrictModel(
      id: map['id'],
      name: map['name'],
    );
  }

}
