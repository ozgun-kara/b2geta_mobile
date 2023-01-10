
class TownModel {
  String? id;
  String? name;
  TownModel({
    this.id,
    this.name,
  });
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }

    return result;
  }

  factory TownModel.fromMap(Map<String, dynamic> map) {
    return TownModel(
      id: map['id'],
      name: map['name'],
    );
  }
  @override
  String toString() => 'TownModel(id: $id, name: $name)';
}
