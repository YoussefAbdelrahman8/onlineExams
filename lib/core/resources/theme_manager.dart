import 'package:flutter/material.dart';

import 'color_manager.dart';

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
      textTheme: const TextTheme(
        labelMedium: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,),
        labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: Color(0xFFA6A6A6),
        )
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: ColorManager.lightPrimaryColor,
          secondary: ColorManager.lightSecondary,
          onPrimary: ColorManager.lightOnPrimaryColor,
          onSecondary: ColorManager.lightOnSecondary,
          tertiary: ColorManager.lightTertiary));
  static ThemeData darkTheme = ThemeData(
      textTheme: const TextTheme(),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: ColorManager.darkPrimaryColor,
          secondary: ColorManager.darkSecondary,
          onPrimary: ColorManager.darkOnPrimaryColor,
          onSecondary: ColorManager.darkOnSecondary,
          tertiary: ColorManager.darkTertiary));
}
