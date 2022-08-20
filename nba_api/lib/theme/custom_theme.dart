import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTheme {
  late final ThemeData theme;
  late final FontSizes _fontSizes;
  final String _fontFamilyRoboto = 'RobotoMono';

  CustomTheme() {
    _fontSizes = FontSizes();

    theme = ThemeData(
      fontFamily: _fontFamilyRoboto,
      textTheme: TextTheme(
        headline3: TextStyle(
          fontSize: _fontSizes.fontSizeMedium,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
