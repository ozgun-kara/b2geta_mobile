
class TimezonesModel {
  String? zoneName;
  int? gmtOffset;
  String? gmtOffsetName;
  String? abbreviation;
  String? tzName;
  TimezonesModel({
    this.zoneName,
    this.gmtOffset,
    this.gmtOffsetName,
    this.abbreviation,
    this.tzName,
  });
  

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(zoneName != null){
      result.addAll({'zoneName': zoneName});
    }
    if(gmtOffset != null){
      result.addAll({'gmtOffset': gmtOffset});
    }
    if(gmtOffsetName != null){
      result.addAll({'gmtOffsetName': gmtOffsetName});
    }
    if(abbreviation != null){
      result.addAll({'abbreviation': abbreviation});
    }
    if(tzName != null){
      result.addAll({'tzName': tzName});
    }
  
    return result;
  }

  factory TimezonesModel.fromMap(Map<String, dynamic> map) {
    return TimezonesModel(
      zoneName: map['zoneName'],
      gmtOffset: map['gmtOffset']?.toInt(),
      gmtOffsetName: map['gmtOffsetName'],
      abbreviation: map['abbreviation'],
      tzName: map['tzName'],
    );
  }

  @override
  String toString() {
    return 'TimezonesModel(zoneName: $zoneName, gmtOffset: $gmtOffset, gmtOffsetName: $gmtOffsetName, abbreviation: $abbreviation, tzName: $tzName)';
  }
}
