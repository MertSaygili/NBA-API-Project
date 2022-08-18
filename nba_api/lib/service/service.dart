// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/model/team_model.dart';

abstract class IService {
  IService(this.dio);
  final Dio dio;

  Future<List<TeamModel>?> fetchedTeams();
  Future<List<PlayerModel>?> fetchedPlayers();
}

class Service extends IService {
  Service(super.dio);
  final String _pathPlayers = 'https://www.balldontlie.io/api/v1/players';
  final String _pathTeams = 'https://www.balldontlie.io/api/v1/teams';

  @override
  Future<List<PlayerModel>?> fetchedPlayers() async {
    final response = await dio.get(_pathPlayers);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => PlayerModel.fromJson(e)).toList();
      }
    }
    return null;
  }

  @override
  Future<List<TeamModel>?> fetchedTeams() async {
    final response = await dio.get(_pathTeams);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => TeamModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}
