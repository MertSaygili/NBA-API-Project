import 'package:flutter/material.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/model/team_model.dart';
import 'package:nba_api/widgets/team_logo_image.dart';

import '../constants/constants.dart';
import 'bottom_sheet.dart';

class CustomTeamCard extends StatefulWidget {
  const CustomTeamCard({Key? key, required this.teams, required this.players})
      : super(key: key);

  final List<TeamModel> teams;
  final List<PlayerModel> players;

  @override
  State<CustomTeamCard> createState() => _CustomTeamCardState();
}

class _CustomTeamCardState extends State<CustomTeamCard> {
  final String _logoMainPath = 'assets/team_logos/';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.teams.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: PaddingItems().paddingCard,
          child: _customCard(index, context),
        );
      },
    );
  }

  Card _customCard(int index, BuildContext context) {
    double elevation = 20;

    return Card(
      elevation: elevation,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _teamLogo(index),
          _teamName(index, context),
          _nextUpButton(index),
        ],
      ),
    );
  }

  Align _teamLogo(int index) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomImageAsset(
        team: widget.teams[index],
        logoMainPath: _logoMainPath,
      ),
    );
  }

  Align _teamName(int index, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        widget.teams[index].full_name.toString(),
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Align _nextUpButton(int index) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomSheetModel(
        team: widget.teams[index],
        players: widget.players,
        logoMainPath: _logoMainPath,
      ),
    );
  }
}
