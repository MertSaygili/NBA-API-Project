import 'package:flutter/material.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/service/service.dart';
import 'package:nba_api/widgets/row_card.dart';

import '../constants/constants.dart';

class StartingPageView extends StatefulWidget {
  const StartingPageView({Key? key}) : super(key: key);

  @override
  State<StartingPageView> createState() => _StartingPageViewState();
}

class _StartingPageViewState extends State<StartingPageView>
    with TickerProviderStateMixin {
  List<TeamModel> _teams = [];
  List<PlayerModel>? _players;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getItems();
  }

  Future<void> getItems() async {
    _teams = await ServiceApi.getTeamData();
    _players = await ServiceApi.getPlayerData();
    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Padding(
              padding: PaddingItems().paddingPage,
              child: CustomRowCard(teams: _teams),
            ),
    );
  }
}
