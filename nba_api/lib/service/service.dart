// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nba_api/model/player_model.dart';

import '../model/team_model.dart';

class ServiceApi {
  static Future<List<TeamModel>> getTeamData() async {
    var uri = Uri.https(
      'free-nba.p.rapidapi.com',
      '/teams',
      {"page": "0"},
    );

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "1112b8b673msha512558d29221d4p1a7ec5jsn8e9aaa5cd663",
      "X-RapidAPI-Host": "free-nba.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['data']) {
      _temp.add(i);
    }

    return TeamModel.teamModelFromSnapshot(_temp);
  }

  static Future<List<PlayerModel>> getPlayerData() async {
    var uri = Uri.https(
      'free-nba.p.rapidapi.com',
      '/players',
      {"page": "0", "per_page": "25"},
    );

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "1112b8b673msha512558d29221d4p1a7ec5jsn8e9aaa5cd663",
      "X-RapidAPI-Host": "free-nba.p.rapidapi.com",
      "useQueryString": 'true'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['data']) {
      _temp.add(i);
    }

    return PlayerModel.playerModelFromSnapshot(_temp);
  }
}
