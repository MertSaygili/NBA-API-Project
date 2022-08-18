import 'package:flutter/material.dart';
import 'package:nba_api/theme/custom_theme.dart';
import 'package:nba_api/view/starting_page.dart';

void main() {
  runApp(const MyApp());
}
// http://www.balldontlie.io/#errors
// https://www.balldontlie.io/api/v1/teams
// https://www.balldontlie.io/api/v1/players

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme().theme,
      home: const StartingPageView(),
    );
  }
}
