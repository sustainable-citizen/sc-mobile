class UserChallenge {
  num id;
  num userId;
  num challengeId;
  num statusId;

  UserChallenge(this.id, this.userId, this.challengeId, this.statusId);

  UserChallenge.map(dynamic obj) {
    this.id = obj["id"];
    this.userId = obj["user_id"];
    this.challengeId = obj["challenge_id"];
    this.statusId = obj["status_id"];
  }

  UserChallenge.fromJson(Map<String, dynamic> json) 
    : id = json['id'],
      userId = json['user_id'],
      challengeId = json['challenge_id'],
      statusId = json['challenge_id'];

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["user_id"] = userId;
    map["challenge_id"] = challengeId;
    map["status_id"] = statusId;
    return map;
  }

  @override
  String toString() {
    return "{ UserChallenge - " +
      "id: $id, " +
      "userId: $userId, " +
      "challengeId: $challengeId " +
      "statusId: $statusId " +
      "}";
  }
}
