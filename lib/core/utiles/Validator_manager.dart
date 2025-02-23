import 'package:online_exam_app/core/utiles/string_manager.dart';

class ValidatorManager {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.validation[Validation.emailReq];
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return StringManager.validation[Validation.enterValidEmail];
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.validation[Validation.passReq];
    }
    if (value.length < 6) {
      return StringManager.validation[Validation.pass8Char];
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return StringManager.validation[Validation.passUpperCase];
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return StringManager.validation[Validation.pass1Num];
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return StringManager.validation[Validation.pass1SpecialChar];
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.validation[Validation.fieldReq];
    }
    if (value.length < 2) {
      return StringManager.validation[Validation.field2Char];
    }
    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return StringManager.validation[Validation.fieldOnlyLetters];
    }
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.validation[Validation.userNameReq];
    }
    if (value.length < 3) {
      return StringManager.validation[Validation.username3Char];
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return StringManager.validation[Validation.usernameOnlyLettersNums];
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return StringManager.validation[Validation.phoneReq];
    }
    final RegExp phoneRegex = RegExp(r'^\+?\d{7,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return StringManager.validation[Validation.enterValidPhoneNum];
    }
    return null;
  }
}
