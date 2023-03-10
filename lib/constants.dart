class Constants {
  const Constants._();
  static String apiUrl = '';
  //"https://api.businessucces.com/api"; // THIS VARIABLE WILL BE CHANGED WITH PROVIDER IN THE FUTURE
  static String? userToken;
  static String? userId;

// THIS VARIABLE (headers) WILL BE REMOVED FROM HERE IN THE FUTURE
  static final Map<String, String> headers = {
    "Content-Type": "application/json; charset=utf-8",
    "Authorization": "Bearer ${Constants.userToken}",
    "Accept-Language":
        "tr", // THE LANGUAGE VARIABLE MUST COME FROM THE PROVIDER AND STORED IN THE LOCAL DB
  };
}
