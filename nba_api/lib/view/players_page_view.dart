import 'package:flutter/material.dart';
import 'package:nba_api/constants/constants.dart';
import 'package:nba_api/model/player_model.dart';

import '../classes/player_information_proccess.dart';

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
    _correctPlayers = PlayerInformationProcess()
        .findCorrectPlayers(widget.teamName, widget.players);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _goBackButton(context),
      body: Padding(
        padding: PaddingItems().paddingPage2x,
        child: ListView.builder(
            itemCount: _correctPlayers.length,
            itemBuilder: (context, index) {
              return _playerInformations(index);
            }),
      ),
    );
  }

  FloatingActionButton _goBackButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Icon(Icons.arrow_back_rounded),
    );
  }

  Row _playerInformations(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _playerImage(),
        _playerInformation(index),
      ],
    );
  }

  Column _playerInformation(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        _playerRichText(
          'First name',
          _correctPlayers[index].first_name.toString(),
        ),
        _playerRichText(
          'Last name',
          _correctPlayers[index].last_name.toString(),
        ),
        _playerRichText(
          'Position',
          _correctPlayers[index].position.toString(),
        ),
        _playerRichText(
          'Height feet',
          _correctPlayers[index].height_feet.toString(),
        ),
        _playerRichText(
          'Height inches',
          _correctPlayers[index].height_inches.toString(),
        ),
        _playerRichText(
          'Weight pounds',
          _correctPlayers[index].weight_pounds.toString(),
        ),
        Padding(padding: PaddingItems().paddingPage),
      ],
    );
  }

  SizedBox _playerImage() {
    return SizedBox(
        height: 120,
        width: 120,
        child: Image.asset('assets/team_logos/Mavericks.png'));
  }

  RichText _playerRichText(String label, String text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label: ',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          TextSpan(
            text: _checkText(text),
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }

  String _checkText(String text) {
    if (text.compareTo('null') == 0) {
      return 'Unkown';
    }
    return text;
  }
}
