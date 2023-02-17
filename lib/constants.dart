class Constants {
  const Constants._();
  static String apiUrl = "https://api.businessucces.com/api";
  //! bu silinecek bunun kullanılan yerlerine user provider ile çekilecek.
  static String? userToken;

//!Bu buradan kaldırılacak.
  static final Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
    "Authorization": "Bearer ${Constants.userToken}",
    "Accept-Language":
        "tr", //provider den çekilecek sabit olmamalı ve değer local db de tutulmalı.
  };
}
