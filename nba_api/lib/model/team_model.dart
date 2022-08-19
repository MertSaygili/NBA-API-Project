// ignore_for_file: non_constant_identifier_names

class TeamModel {
  final int? id;
  final String? city;
  final String? conference;
  final String? full_name;
  final String? name;

  TeamModel({this.id, this.city, this.conference, this.full_name, this.name});

  factory TeamModel.fromJson(dynamic json) {
    return TeamModel(
      id: json['id'] as int,
      city: json['city'] as String,
      conference: json['conference'] as String,
      full_name: json['full_name'] as String,
      name: json['name'] as String,
    );
  }

  static List<TeamModel> teamModelFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return TeamModel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Teams {id: ${id.toString()}, city: $city, conference: $conference, full_name: $full_name, name: $name}';
  }
}
