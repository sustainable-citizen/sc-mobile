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

  UserChallenge(this.id, this.userId, this.challengeId, this.status,
      this.acceptDate, this.createdAt, this.updatedAt, this.challenge);

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

  Map<String, String> toMap() {
    var map = Map<String, String>();
    map["id"] = id.toString();
    map["user_id"] = userId.toString();
    map["challenge_id"] = challengeId.toString();
    map["status_id"] = status.toString();
    map["accept_date"] = acceptDate.toString();
    map["created_at"] = createdAt.toString();
    map["update_at"] = updatedAt.toString();
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
