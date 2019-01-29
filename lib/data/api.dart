import 'package:oauth2/oauth2.dart' as oauth2;
import '../models/user.dart';
import 'dart:convert';

class RestDatasource {
  static final baseUrl = "http://ec2-13-58-184-130.us-east-2.compute.amazonaws.com:3000";
  final tokenEndpoint = Uri.parse(baseUrl + "/oauth/token");
  final idEndpoint = Uri.parse(baseUrl + "/oauth/token/info");

  Future<User> login(String username, String password) async {
    oauth2.Client client;
    oauth2.Credentials credentials;
    num userId;
    
    // Attempt to authenticate the user
    client = await oauth2.resourceOwnerPasswordGrant(
    tokenEndpoint, username, password);
    credentials = client.credentials;
    
    // Attempt to get the user ID
    userId = await client.get(idEndpoint).then((response) {
      Map<String, dynamic> body = jsonDecode(response.body);
      return body["resource_owner_id"];
    }).catchError((error) {
      client.close();
    }).whenComplete(client.close);

    return User(username, userId, credentials);
  }
}
