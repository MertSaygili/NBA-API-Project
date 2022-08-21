import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTheme {
  late final ThemeData theme;
  late final FontSizes _fontSizes;
  late final AllColors _colors;
  final String _fontFamilyRoboto = 'RobotoMono';

  CustomTheme() {
    _fontSizes = FontSizes();
    _colors = AllColors();

    theme = ThemeData(
      fontFamily: _fontFamilyRoboto,
      textTheme: TextTheme(
        headline2: TextStyle(
          fontSize: _fontSizes.fontSizeLarge,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          wordSpacing: -1,
          color: _colors.colorBlack,
        ),
        headline3: TextStyle(
          fontSize: _fontSizes.fontSizeMedium,
          fontWeight: FontWeight.bold,
        ),
        button: TextStyle(
          fontSize: _fontSizes.fontSizeMedium,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
          color: _colors.colorWhite,
        ),
      ),
    );
  }
}
