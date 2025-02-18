import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.forgetPassword[ForgetPassword.password]!),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(),
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
