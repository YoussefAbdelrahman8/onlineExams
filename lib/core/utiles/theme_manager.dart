import 'package:flutter/material.dart';

import 'color_manager.dart';

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black
      )
    ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
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
      textTheme: TextTheme(
        bodyMedium: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        displaySmall:TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: ColorManager.lightTertiary,
        ),
        displayMedium: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        labelMedium: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.lightSecondaryColor,
          decorationThickness: 3.0,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: ColorManager.lightSecondaryColor
        ),
        labelSmall: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          primary: ColorManager.lightPrimaryColor,
          secondary: ColorManager.lightSecondaryColor,
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
