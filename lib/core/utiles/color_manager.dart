import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ColorManager {
  static MaterialColor black = const MaterialColor(
    0xFF0F0F0F,
    {
      10: Color(0xFFCFCFCF),
      20: Color(0xFFAFAFAF),
      30: Color(0xFF878787),
      40: Color(0xFF5F5F5F),
      50: Color(0xFF373737),
      60: Color(0xFF0D0D0D),
      70: Color(0xFF0A0A0A),
      80: Color(0xFF080808),
      90: Color(0xFF050505),
      100: Color(0xFF030303),
    },
  );

  static MaterialColor blue = const MaterialColor(
    0xFF02369C,
    {
      10: Color(0xFFCCD7EB),
      20: Color(0xFFABBCDE),
      30: Color(0xFF819BCE),
      40: Color(0xFF5679BD),
      50: Color(0xFF2C58AD),
      60: Color(0xFF022D82),
      70: Color(0xFF012468),
      80: Color(0xFF011B4E),
      90: Color(0xFF011234),
      100: Color(0xFF000B1F),
    },
  );
  static Color error = const Color(0xFFCC1010);
  static Color lightRed = const Color(0xFFF8D2D2);
  static Color success = const Color(0xFF11CE19);
  static Color lightGreen = const Color(0xFFCAF9CC);
  static Color gray = const Color(0xFF535353);
  static Color placeHolder = const Color(0xFFA6A6A6);
  static Color white = const Color(0xFFF9F9F9);
  static Color lightBlue = const Color(0xFFEDEFF3);
  static Color pinCodeBoxColor = const Color(0xFFDFE7F7);





  static Color lightPrimaryColor = white;
  static Color lightOnPrimaryColor = gray;
  static Color lightSecondaryColor = blue;
  static Color lightOnSecondary = black;
  static Color lightTertiary = placeHolder;
  static Color lightOnTertiary = Colors.black;
  static Color darkPrimaryColor = Colors.black;
  static Color darkOnPrimaryColor = Colors.black;
  static Color darkSecondary = Colors.black;
  static Color darkOnSecondary = Colors.black;
  static Color darkTertiary = Colors.black;
}
