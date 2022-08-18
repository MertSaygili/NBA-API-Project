// ignore_for_file: unnecessary_question_mark, prefer_void_to_null

class PlayerModel {
  int? id;
  String? firstName;
  Null? heightFeet;
  Null? heightInches;
  String? lastName;
  String? position;
  Team? team;
  Null? weightPounds;

  PlayerModel(
      {this.id,
      this.firstName,
      this.heightFeet,
      this.heightInches,
      this.lastName,
      this.position,
      this.team,
      this.weightPounds});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    heightFeet = json['height_feet'];
    heightInches = json['height_inches'];
    lastName = json['last_name'];
    position = json['position'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    weightPounds = json['weight_pounds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['height_feet'] = heightFeet;
    data['height_inches'] = heightInches;
    data['last_name'] = lastName;
    data['position'] = position;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['weight_pounds'] = weightPounds;
    return data;
  }
}

class Team {
  int? id;

  Team({
    this.id,
  });

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}
