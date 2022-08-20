// font sizes
import 'package:flutter/material.dart';

class FontSizes {
  final double fontSizeMedium = 16;
}

// Padding Classes
class PaddingItems {
  final EdgeInsets paddingPage = EdgeInsets.only(
    top: PaddingValues().paddingVerticalNormal,
  );

  final EdgeInsets paddingCard = EdgeInsets.symmetric(
    horizontal: PaddingValues().paddingSmall,
    vertical: PaddingValues().paddingSmall,
  );

  final EdgeInsets paddingImage = EdgeInsets.symmetric(
    horizontal: PaddingValues().paddingNormal,
    vertical: PaddingValues().paddingSmall,
  );
}

class PaddingValues {
  // general padding values
  final double paddingSmall = 6;
  final double paddingNormal = 14;

  // horizontal

  // vertical
  final double paddingVerticalNormal = 14;
}
