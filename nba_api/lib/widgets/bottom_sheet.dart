import 'package:flutter/material.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/view/players_page_view.dart';
import 'package:nba_api/widgets/team_logo_image.dart';

import '../constants/constants.dart';
import '../model/team_model.dart';

class CustomSheetModel extends StatefulWidget {
  const CustomSheetModel(
      {Key? key,
      required this.team,
      required this.logoMainPath,
      required this.players})
      : super(key: key);

  final TeamModel team;
  final List<PlayerModel> players;
  final String logoMainPath;

  @override
  State<CustomSheetModel> createState() => _CustomSheetModelState();
}

class _CustomSheetModelState extends State<CustomSheetModel> {
  final OutlineInputBorder _bottomSheetBorder = const OutlineInputBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  );
  final RoundedRectangleBorder _playersRoundedBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  );
  final String _textPlayers = 'Players';
  final String _textConference = 'Conference';
  final String _textCity = 'City';
  final double _widthTen = 10;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: PaddingItems().paddingIcon,
      alignment: Alignment.centerRight,
      icon: IconItems().iconNextUp,
      onPressed: () {
        showModalBottomSheet(
            shape: _bottomSheetBorder,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _closeSheetButton(context),
                    Padding(padding: PaddingItems().paddingBottomSheet),
                    _teamLogo(context),
                    _teamInformation(context),
                    _playerInformationButton()
                  ],
                ),
              );
            });
      },
    );
  }

  Align _closeSheetButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: IconItems().iconClose,
      ),
    );
  }

  SizedBox _teamLogo(BuildContext context) {
    return SizedBox(
      child: CustomImageAsset(
        team: widget.team,
        logoMainPath: widget.logoMainPath,
      ),
    );
  }

  ListTile _teamInformation(BuildContext context) {
    return ListTile(
      contentPadding: PaddingItems().paddingBottomSheet,
      title: Text(
        widget.team.full_name.toString(),
        style: Theme.of(context).textTheme.headline2,
      ),
      subtitle: Text(
        '$_textConference: ${widget.team.conference.toString()}\n$_textCity: ${widget.team.city.toString()}',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Padding _playerInformationButton() {
    return Padding(
      padding: PaddingItems().paddingBottomSheet,
      child: Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: _playersRoundedBorder),
          onPressed: () {
            _openPlayersPage();
          },
          child: _buttonText(),
        ),
      ),
    );
  }

  Row _buttonText() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(_textPlayers, style: Theme.of(context).textTheme.button),
        SizedBox(width: _widthTen),
        IconItems().iconNextRight,
      ],
    );
  }

  void _openPlayersPage() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => PlayersPageView(
          teamName: widget.team.full_name.toString(),
          players: widget.players,
        ),
      ),
    );
  }
}
