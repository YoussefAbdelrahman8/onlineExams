import 'package:flutter/material.dart';

import 'color_manager.dart';

abstract class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(ColorManager.lightPrimaryColor),
      side: BorderSide(
        color: ColorManager.lightOnPrimaryColor,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
    ),
      appBarTheme:  AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorManager.lightOnSecondary
      )
    ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: ColorManager.lightOnPrimaryColor),
        hintStyle:  TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: ColorManager.lightTertiary,
        ),
        counterStyle: TextStyle(color: ColorManager.lightOnSecondary),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightOnPrimaryColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightOnSecondary)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.error)),
      ),
      textTheme: TextTheme(
        bodySmall:  TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: ColorManager.lightOnSecondary
        ),
        bodyMedium:  TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
            color: ColorManager.lightOnSecondary
        ),
        titleMedium:  TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
            color: ColorManager.lightOnSecondary
        ),
        displaySmall:TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: ColorManager.lightOnPrimaryColor,
        ),
        displayMedium:  TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
            color: ColorManager.lightOnSecondary
        ),
        headlineSmall: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.lightOnSecondary,
          decorationThickness: 3.0,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: ColorManager.lightOnSecondary
      ),
        labelMedium: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: ColorManager.lightSecondaryColor,
          decorationThickness: 3.0,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: ColorManager.lightSecondaryColor
        ),
        labelSmall:  TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
            color: ColorManager.lightOnSecondary
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
