import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';
import 'package:online_exam_app/features/forget_password/presentation/pages/tabs/reset_passeord_part.dart';
import 'package:online_exam_app/features/forget_password/presentation/pages/tabs/send_email_part.dart';
import 'package:online_exam_app/features/forget_password/presentation/pages/tabs/verification_part.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  int _index = 0;
  String _email = "";

  switchTabs(String? nEmail) {
    setState(() {
      _email = nEmail ?? "";
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> parts = [
      SendEmailPart(
        switchTabs: switchTabs,
      ),
      VerificationPart(
        switchTabs: switchTabs,
        email: _email,
      ),
      ResetPasswordPart(
        email: _email,
        switchTabs: switchTabs,
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.forgetPassword[ForgetPassword.password]!),
      ),
      body: parts[2],
    );
  }
}
