import 'package:oauth2/oauth2.dart' as oauth2;
import '../models/user.dart';
import '../models/user_challenge.dart';
import 'dart:convert';

class RestDatasource {
  static final baseUrl2 = "http://localhost:3000";
  static final baseUrl = "https://api.thesci.net/";
  final tokenEndpoint = Uri.parse(baseUrl + "/oauth/token");
  final idEndpoint = Uri.parse(baseUrl + "/oauth/token/info");
  final userChallengeEndpoint = baseUrl + "/api/v1/user_challenge";

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

  Future<List<UserChallenge>> getUserChallenges(User user) async {
    List<UserChallenge> userChallenges;
    oauth2.Client client = oauth2.Client(user.credentials);
    var endpoint = Uri.parse(userChallengeEndpoint + "?user_id=${user.id}");

    List<dynamic> body = await client.get(endpoint).then((response) {
      return jsonDecode(response.body);
    }).catchError((error) {
      client.close();
      return null;
    }).whenComplete(client.close);
    userChallenges = [];

    if (body != null) {
          body.forEach((challenge) {
      userChallenges.add(UserChallenge.map(challenge));
    });
    }
    return userChallenges;
  }

  Future<bool> updateUserChallenge(User user, UserChallenge userChallenge) async {
    oauth2.Client client = oauth2.Client(user.credentials);
    var endpoint = Uri.parse(userChallengeEndpoint + "/${userChallenge.id}");

    bool isSuccess = await client.put(endpoint, body: userChallenge.toMap()).then((response) {
      return response.statusCode == 204 ? true : false;
    }).catchError((error) {
      client.close();
      return false;
    }).whenComplete(client.close);
    return isSuccess;
  }
}
