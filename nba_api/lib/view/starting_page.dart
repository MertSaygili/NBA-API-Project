import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nba_api/model/player_model.dart';
import 'package:nba_api/model/team_model.dart';

class StartingPageView extends StatefulWidget {
  const StartingPageView({Key? key}) : super(key: key);

  @override
  State<StartingPageView> createState() => _StartingPageViewState();
}

class _StartingPageViewState extends State<StartingPageView> {
  final String _path = 'https://balldontlie.io/api/v1/players';
  List<PlayerModel>? _data;
  Dio? _network;

  @override
  void initState() {
    super.initState();

    _network = Dio(BaseOptions(baseUrl: _path));
    fetchItems();
  }

  Future<void> fetchItems() async {
    final response = await Dio().get(_path);

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      print(data);

      if (data is List) {
        _data = data.map((e) => PlayerModel.fromJson(e)).toList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _data?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_data?[index].firstName.toString() ?? ' '),
            );
          }),
    );
  }
}
