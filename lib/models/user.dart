class User {
  String username;
  User(this.username);

  User.map(dynamic obj) {
    this.username = obj["username"];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["username"] = username;
    return map;
  }
}
