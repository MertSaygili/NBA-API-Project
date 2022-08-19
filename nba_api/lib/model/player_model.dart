// ignore_for_file: non_constant_identifier_names

class PlayerModel {
  final String? first_name;
  final int? height_feet;
  final int? height_inches;
  final String? last_name;
  final String? position;
  final String? full_name;
  final int? weight_pounds;

  PlayerModel({
    this.height_feet,
    this.height_inches,
    this.weight_pounds,
    this.first_name,
    this.last_name,
    this.position,
    this.full_name,
  });

  factory PlayerModel.fromJson(dynamic json) {
    return PlayerModel(
      first_name: json['first_name'] as String,
      height_feet: json['height_feet'],
      height_inches: json['height_inches'],
      last_name: json['last_name'] as String,
      position: json['position'] as String,
      full_name: json['team']['full_name'] as String,
      weight_pounds: json['weight_pounds'],
    );
  }

  static List<PlayerModel> playerModelFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return PlayerModel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Players {first name: $first_name, height feet: $height_feet, height_inches: $height_inches, last name: $last_name, position: $position, full name: $full_name, weight_pounds: $weight_pounds}';
  }
}
