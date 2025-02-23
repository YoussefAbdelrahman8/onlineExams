import 'package:flutter/material.dart';
import 'package:online_exam_app/core/cache/shared_pref.dart';
import 'MyApp.dart';
import 'core/DI/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  configureDependencies();
  runApp(const MyApp());
}

