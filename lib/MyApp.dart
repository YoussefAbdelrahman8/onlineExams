
import 'package:flutter/material.dart';
import 'package:online_exam_app/core/widget/custom_button.dart';

import 'core/widget/custom_text_field.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: CustomButton(onPressed: (){}, width: 343, height: 43, content: "Hello",borderRadius: 100, backgroundColor: Colors.black, contentColor: Colors.white, borderColor: Colors.blue,)),
      ),
    );
  }
}