import 'dart:async';
import 'dart:convert';
import '../utils/network_util.dart';
import '../models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final baseUrl = "http://localhost:3000";
  static final loginURL = baseUrl + "/oauth/token";
  static final grantType = "password";

  Future<User> login(String username, String password) {
    return _netUtil.post(
      loginURL,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      }, 
      body: json.encode({
        "grant_type": grantType,
        "username": username,
        "password": password
     }),
    ).then((dynamic result) {
      print(result.toString());
      if (result["status_code"] == 401) {
        throw new Exception("You have entered an invalid username or password.");
      } else if (result["status_code"] != 200) {
        throw new Exception("An unexpected error has occurred.");
      }
      return User(username, password);
    });
  }
}
