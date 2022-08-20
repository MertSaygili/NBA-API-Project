import 'package:flutter/material.dart';
import 'package:nba_api/theme/custom_theme.dart';
import 'package:nba_api/view/teams_page.dart';

void main() {
  runApp(const MyApp());
}

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
