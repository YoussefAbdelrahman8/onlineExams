import 'package:flutter/material.dart';
import 'package:online_exam_app/core/routes_manager/routes.dart';
import 'package:online_exam_app/features/forget_password/presentation/pages/forget_password_screen.dart';
import 'package:online_exam_app/features/home/presentation/pages/home_screen.dart';

import '../../features/signup/presentation/pages/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUpScreenRoute:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
        case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
    }
    return null;
  }
}
