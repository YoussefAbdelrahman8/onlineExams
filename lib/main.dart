import 'package:flutter/material.dart';
import 'MyApp.dart';
import 'core/DI/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

