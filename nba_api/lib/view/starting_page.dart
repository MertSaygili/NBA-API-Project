import 'package:flutter/material.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/service/service.dart';

import '../widgets/team_logo_image.dart';

class StartingPageView extends StatefulWidget {
  const StartingPageView({Key? key}) : super(key: key);

  @override
  State<StartingPageView> createState() => _StartingPageViewState();
}

class _StartingPageViewState extends State<StartingPageView> {
  List<TeamModel> _teams = [];
  List<PlayerModel>? _players;

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
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _teams.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 150,
              child: ListTile(
                title: Container(
                    alignment: Alignment.centerLeft,
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    child: CustomImageAsset(
                      team: _teams[index],
                      logoMainPath: 'assets/team_logos/',
                    )),
                subtitle: Text(_teams[index].conference ?? ''),
              ),
            );
          }),
    );
  }
}
