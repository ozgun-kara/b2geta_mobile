class RegisterModel {
  int? userId;
  String? verifyCode;

  RegisterModel({this.userId, this.verifyCode});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    verifyCode = json['verify_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['verify_code'] = verifyCode;
    return data;
  }
}
