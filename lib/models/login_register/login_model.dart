class LoginModel {
  bool? status;
  int? responseCode;
  String? responseText;
  List<dynamic>? errors;
  String? accessToken;
  LoginDataModel? data;

  LoginModel(
      {this.status,
      this.responseCode,
      this.responseText,
      this.errors,
      this.accessToken,
      this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['responseCode'];
    responseText = json['responseText'];
    if (json['errors'] != null) {
      errors = <Null>[];
      json['errors'].forEach((v) {
        errors!.add(v);
      });
    }
    accessToken = json['access_token'];
    data = json['data'] != null ? LoginDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['responseCode'] = responseCode;
    data['responseText'] = responseText;
    if (errors != null) {
      // data['errors'] = this.errors!.map((v) => v.toList());
    }
    data['access_token'] = accessToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginDataModel {
  String? userId;
  String? refreshToken;
  String? refreshTokenExpire;

  LoginDataModel({this.userId, this.refreshToken, this.refreshTokenExpire});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    refreshToken = json['refresh_token'];
    refreshTokenExpire = json['refresh_token_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_id'] = userId;
    data['refresh_token'] = refreshToken;
    data['refresh_token_expire'] = refreshTokenExpire;
    return data;
  }
}
