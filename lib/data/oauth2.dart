import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart';

class RestDatasource {
  static final baseUrl = "http://localhost:3000";
  final tokenEndpoint = Uri.parse(baseUrl + "/oauth/token");
  final idEndpoint = Uri.parse(baseUrl + "/oauth/token/info");

  Future<Response> login(String username, String password) async {
    var client = await oauth2.resourceOwnerPasswordGrant(
        tokenEndpoint, username, password);
    return client.get(idEndpoint).then((response) {
      return response;
    });
    
  }
}
