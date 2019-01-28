import 'package:oauth2/oauth2.dart' as oauth2;

class User {
  String username;
  num id;
  oauth2.Credentials credentials;

  User(this.username, this.id, this.credentials);

  User.map(dynamic obj) {
    this.username = obj["username"];
    this.id = obj["id"];
    this.credentials = obj["credentials"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["username"] = username;
    map["id"] = id;
    map["credentials"] = credentials;
    return map;
  }
}
