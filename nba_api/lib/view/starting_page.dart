import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    getItems();
  }

  Future<void> getItems() async {
    _teams = await ServiceApi.getData();
    print(_teams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _teams?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_teams?[index].name ?? ' '),
              leading: Icon(Icons.abc),
            );
          }),
    );
  }
}
