// font sizes
import 'package:flutter/material.dart';

// font sizes
class FontSizes {
  final double fontSizeSmall = 13;
  final double fontSizeMedium = 16;
  final double fontSizeLarge = 28;

  final double iconSizeNormal = 24;
  final double iconSizeBig = 35;
}

// icons
class IconItems {
  final Icon iconNextUp = Icon(
    Icons.arrow_circle_up_outlined,
    size: FontSizes().iconSizeBig,
    color: AllColors().colorBlue,
  );

  final Icon iconClose = Icon(
    Icons.close_rounded,
    size: FontSizes().iconSizeNormal,
    color: AllColors().colorBlack,
  );

  final Icon iconNextRight = Icon(
    Icons.arrow_circle_right_outlined,
    size: FontSizes().iconSizeBig,
    color: AllColors().colorWhite,
  );
}

// colors
class AllColors {
  final Color colorBlack = Colors.black;
  final Color colorWhite = Colors.white;
  final Color colorBlue = Colors.blue;
}

// Padding Classes
class PaddingItems {
  final EdgeInsets paddingPage2x = EdgeInsets.symmetric(
    vertical: PaddingValues().paddingVerticalNormal,
    horizontal: PaddingValues().paddingNormal2X,
  );

  final EdgeInsets paddingPage = EdgeInsets.symmetric(
    vertical: PaddingValues().paddingVerticalNormal,
  );

  final EdgeInsets paddingCard = EdgeInsets.symmetric(
    horizontal: PaddingValues().paddingSmall,
    vertical: PaddingValues().paddingSmall,
  );

  final EdgeInsets paddingImage = EdgeInsets.symmetric(
    horizontal: PaddingValues().paddingNormal,
    vertical: PaddingValues().paddingSmall,
  );

  final EdgeInsets paddingIcon = EdgeInsets.only(
    right: PaddingValues().paddingNormal,
  );

  final EdgeInsets paddingBottomSheet = EdgeInsets.symmetric(
    horizontal: PaddingValues().paddingNormal,
    vertical: PaddingValues().paddingSmall,
  );
}

class PaddingValues {
  // general padding values
  final double paddingSmall = 6;
  final double paddingNormal = 14;
  final double paddingNormal2X = 20;

  // horizontal

  // vertical
  final double paddingVerticalNormal = 14;
}
