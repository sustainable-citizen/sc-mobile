import 'challenge.dart';

class UserChallenge {
  int id;
  int userId;
  int challengeId;
  int status;
  DateTime acceptDate;
  DateTime createdAt;
  DateTime updatedAt;
  Challenge challenge;

  UserChallenge(this.id, this.userId, this.challengeId, this.status,      this.acceptDate, this.createdAt, this.updatedAt, this.challenge);

  UserChallenge.map(dynamic obj) {
    this.id = obj["id"];
    this.userId = obj["user_id"];
    this.challengeId = obj["challenge_id"];
    this.status = obj["status_id"];
    this.acceptDate = DateTime.parse(obj["accept_date"]);
    this.createdAt = DateTime.parse(obj["created_at"]);
    this.updatedAt = DateTime.parse(obj["updated_at"]);
    this.challenge = Challenge.map(obj["challenge"]);
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["user_id"] = userId;
    map["challenge_id"] = challengeId;
    map["status_id"] = status;
    map["accept_date"] = acceptDate.toString();
    map["created_at"] = createdAt.toString();
    map["update_at"] = updatedAt.toString();
    map["challenge"] = challenge.toMap();
    return map;
  }

  @override
  String toString() {
    return "{ UserChallenge - " +
      "id: $id, " +
      "userId: $userId, " +
      "challengeId: $challengeId " +
      "acceptDate: $acceptDate " +
      "createdAt: $createdAt " +
      "updatedAt: $updatedAt " +
      "challenge: $challenge " +
      "}";
  }
}
