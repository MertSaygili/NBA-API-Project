import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/team_model.dart';

class ServiceApi {
//   const unirest = require("unirest");

// const req = unirest("GET", "https://free-nba.p.rapidapi.com/teams");

// req.query({
// 	"page": "0"
// });

// req.headers({
  // "X-RapidAPI-Key": "1112b8b673msha512558d29221d4p1a7ec5jsn8e9aaa5cd663",
  // "X-RapidAPI-Host": "free-nba.p.rapidapi.com",
  // "useQueryString": true
// });

// req.end(function (res) {
// 	if (res.error) throw new Error(res.error);

// 	console.log(res.body);
// });

  static Future<List<TeamModel>?> getData() async {
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

    return TeamModel.teamModelsFromSnapshot(_temp);
  }
}
