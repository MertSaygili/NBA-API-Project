import 'package:flutter/material.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/service/service.dart';

class StartingPageView extends StatefulWidget {
  const StartingPageView({Key? key}) : super(key: key);

  @override
  State<StartingPageView> createState() => _StartingPageViewState();
}

class _StartingPageViewState extends State<StartingPageView> {
  final String _path = 'https://balldontlie.io/api/v1/teams';
  List<TeamModel>? _teams;
  List<PlayerModel>? _players;

  @override
  void initState() {
    super.initState();
    getItems();
  }

  Future<void> getItems() async {
    _teams = await ServiceApi.getTeamData();
    _players = await ServiceApi.getPlayerData();
    print(_players);
    print(_players?[0].first_name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _players?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_players?[index].full_name ?? ' '),
              leading: const Icon(Icons.abc),
            );
          }),
    );
  }
}
