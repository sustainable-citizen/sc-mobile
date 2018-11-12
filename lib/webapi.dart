import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

final String preUrl =
    'http://ec2-13-58-184-130.us-east-2.compute.amazonaws.com:3000/';
String accessToken;
String refreshToken;

class AWSWebAPI {
  Future<bool> login(String userName, String password) async {
    if (userName == null || password == null) {
      return false;
    }
    String jsonData = '{"grant_type":"password", "username":"' +
        userName +
        '","password": "' +
        password +
        '"}';
    var response = await http.post(preUrl + 'oauth/token',
        headers: {'Content-Type': 'application/json'}, body: jsonData);
    if (response.statusCode == 200) {
      Map<String, dynamic> keyPair = json.decode(response.body);
      accessToken = keyPair['access_token'];
      refreshToken = keyPair['refresh_token'];
      return true;
    } else {
      return false;
    }
  }
}
