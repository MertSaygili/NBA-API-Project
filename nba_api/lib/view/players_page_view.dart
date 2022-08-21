import 'package:flutter/material.dart';
import 'package:nba_api/model/player_model.dart';

class PlayersPageView extends StatefulWidget {
  const PlayersPageView(
      {Key? key, required this.teamName, required this.players})
      : super(key: key);

  @override
  State<PlayersPageView> createState() => _PlayersPageViewState();

  final String teamName;
  final List<PlayerModel> players;
}

class _PlayersPageViewState extends State<PlayersPageView> {
  late final List<PlayerModel> _correctPlayers;

  @override
  void initState() {
    super.initState();
    _correctPlayers =
        PlayerProcess().findCorrectPlayers(widget.teamName, widget.players);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _correctPlayers.length,
          itemBuilder: (context, index) {
            return Text(
                '${_correctPlayers[index].first_name} ${_correctPlayers[index].last_name}');
          }),
    );
  }
}

class PlayerProcess {
  final List<PlayerModel> _players = [];

  List<PlayerModel> findCorrectPlayers(
      String teamName, List<PlayerModel> players) {
    for (int i = 0; i < players.length; i++) {
      if (players[i].full_name.toString().compareTo(teamName) == 0) {
        _players.add(players[i]);
      }
    }
    return _players;
  }
}
