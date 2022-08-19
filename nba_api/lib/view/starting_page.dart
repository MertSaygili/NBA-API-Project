import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/service/service.dart';
import 'package:nba_api/widgets/row_card.dart';

import '../widgets/team_logo_image.dart';

class StartingPageView extends StatefulWidget {
  const StartingPageView({Key? key}) : super(key: key);

  @override
  State<StartingPageView> createState() => _StartingPageViewState();
}

class _StartingPageViewState extends State<StartingPageView> {
  List<TeamModel>? _teams;
  List<PlayerModel>? _players;
  List<TeamModel>? x;

  @override
  void initState() {
    super.initState();
    getItems();
  }

  Future<void> getItems() async {
    _teams = await ServiceApi.getTeamData();
    _players = await ServiceApi.getPlayerData();
    print(_teams![0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _teams?.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: CustomImageAsset(team: _teams![index]),
                title: Text(_teams?[index].full_name ?? ''),
                subtitle: Text(_teams?[index].conference ?? ''),
              ),
            );
          }),
    );
  }
}
