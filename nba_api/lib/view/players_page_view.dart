import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
