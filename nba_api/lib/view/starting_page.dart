import 'package:flutter/material.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/service/service.dart';
import 'package:nba_api/widgets/row_card.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _teams?.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image.asset(
                  'assets/team_logos/${_teams?[index].name ?? 'TrailBlazers'}.png',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(_teams?[index].name ?? ''),
              ),
            );
          }),
    );
  }
}
