// ignore_for_file: prefer_collection_literals, unnecessary_getters_setters

class TeamModel {
  int? _id;
  String? _abbreviation;
  String? _city;
  String? _conference;
  String? _division;
  String? _fullName;
  String? _name;

  TeamModel(
      {int? id,
      String? abbreviation,
      String? city,
      String? conference,
      String? division,
      String? fullName,
      String? name}) {
    if (id != null) {
      _id = id;
    }
    if (abbreviation != null) {
      _abbreviation = abbreviation;
    }
    if (city != null) {
      _city = city;
    }
    if (conference != null) {
      _conference = conference;
    }
    if (division != null) {
      _division = division;
    }
    if (fullName != null) {
      _fullName = fullName;
    }
    if (name != null) {
      _name = name;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get abbreviation => _abbreviation;
  set abbreviation(String? abbreviation) => _abbreviation = abbreviation;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get conference => _conference;
  set conference(String? conference) => _conference = conference;
  String? get division => _division;
  set division(String? division) => _division = division;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  String? get name => _name;
  set name(String? name) => _name = name;

  TeamModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _abbreviation = json['abbreviation'];
    _city = json['city'];
    _conference = json['conference'];
    _division = json['division'];
    _fullName = json['full_name'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = _id;
    data['abbreviation'] = _abbreviation;
    data['city'] = _city;
    data['conference'] = _conference;
    data['division'] = _division;
    data['full_name'] = _fullName;
    data['name'] = _name;
    return data;
  }
}
