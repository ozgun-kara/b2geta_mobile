class LoginModel {
  bool? status;
  int? responseCode;
  String? responseText;
  List<dynamic>? errors;
  String? accessToken;
  Data? data;

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
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['responseCode'] = this.responseCode;
    data['responseText'] = this.responseText;
    if (this.errors != null) {
      // data['errors'] = this.errors!.map((v) => v.toList());
    }
    data['access_token'] = this.accessToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? refreshToken;
  String? refreshTokenExpire;

  Data({this.userId, this.refreshToken, this.refreshTokenExpire});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    refreshToken = json['refresh_token'];
    refreshTokenExpire = json['refresh_token_expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['refresh_token'] = this.refreshToken;
    data['refresh_token_expire'] = this.refreshTokenExpire;
    return data;
  }
}
