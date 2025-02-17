import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:online_exam_app/core/utiles/color_manager.dart';

class ToastMessage{
  static toastMessage(String message){
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: ColorManager.error,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}
