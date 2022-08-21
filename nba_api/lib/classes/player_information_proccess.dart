import '../model/player_model.dart';

class PlayerInformationProcess {
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
