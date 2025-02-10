import 'package:flutter/material.dart';
import 'package:online_exam_app/core/resources/color_manager.dart';

class CustomTextField extends StatelessWidget {
  String label;
  String hint;
  TextEditingController? controller;
  String Function(String? value)? validation;
  bool secure;


  CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.validation,
    required this.secure
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validation!(value);
      },
      cursorColor: ColorManager.lightOnTertiary,
      controller: controller,
      obscureText: secure,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: ColorManager.lightOnTertiary),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.labelSmall,
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
    );
  }
}
