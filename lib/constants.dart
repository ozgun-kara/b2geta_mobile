class Constants {
  const Constants._();
  static String apiUrl =
      "https://api.businessucces.com/api"; // THIS VARIABLE WILL BE CHANGED WITH PROVIDER IN THE FUTURE
  static String? userToken;
  static String? userId;
  static String? language;

// THIS VARIABLE (headers) WILL BE REMOVED FROM HERE IN THE FUTURE
  static final Map<String, String> headers = {
    "Authorization": "Bearer ${Constants.userToken}",
    "Accept-Language": "${Constants.language}"
  };
}
