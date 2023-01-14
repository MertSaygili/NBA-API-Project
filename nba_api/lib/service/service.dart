// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:nba_api/model/player_model.dart';

import '../model/team_model.dart';

class ServiceApi {
  static String api_key = dotenv.env['X-RapidAPI-Key'] ?? '';

  static Future<List<TeamModel>> getTeamData() async {
    var uri = Uri.https(
      'free-nba.p.rapidMapi.com',
      '/teams',
      {"page": "0"},
    );

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": api_key,
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
      "X-RapidAPI-Key": api_key,
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
