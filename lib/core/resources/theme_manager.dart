import 'package:flutter/material.dart';

import 'color_manager.dart';

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      labelStyle:TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: ColorManager.lightOnTertiary),
      hintStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFA6A6A6),
      ),
      counterStyle: TextStyle(color: ColorManager.lightOnTertiary),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightTertiary)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightOnTertiary)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error)),

    ),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,),
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
