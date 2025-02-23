
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:online_exam_app/features/forget_password/presentation/pages/forget_password_screen.dart';

import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'core/utiles/theme_manager.dart';
import 'core/widget/custom_text_field.dart';
import 'features/signup/presentation/pages/signup_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: Routes.forgetPasswordScreenRoute, // Set the initial screen
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}