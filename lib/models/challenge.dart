class Challenge {
  int id;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;

  Challenge(this.id, this.name, this.description, this.startDate, this.endDate);

  Challenge.map(dynamic obj) {
    this.id = obj["id"];
    this.name = obj["name"];
    this.description = obj["description"];
    this.startDate = DateTime.parse(obj["start_date"]);
    this.endDate = DateTime.parse(obj["end_date"]);
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id.toString();
    map["name"] = name;
    map["description"] = description;
    map["start_date"] = startDate.toString();
    map["end_date"] = endDate.toString();
    return map;
  }

  @override
  String toString() {
    return "{ Challenge - " +
        "id: $id, " +
        "name: $name, " +
        "description: $description " +
        "startDate: $startDate " +
        "endDate: $endDate " +
        "}";
  }
}
