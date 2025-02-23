import 'package:flutter/material.dart';
import 'package:online_exam_app/core/utiles/string_manager.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utiles/color_manager.dart';

class PinCodeWidget extends StatelessWidget {
  TextEditingController otpController;
  GlobalKey formKey;
  Function(String) onComplete;
  bool isError;

  PinCodeWidget(
      {super.key,
      required this.otpController,
      required this.formKey,
      required this.onComplete,
      required this.isError});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        PinCodeTextField(
          key: formKey,
          length: 6,
          appContext: context,
          controller: otpController,
          keyboardType: TextInputType.number,
          textStyle: Theme.of(context).textTheme.bodyMedium,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: height * 0.07,
            //68
            fieldWidth: width * 0.139,
            //74
            inactiveFillColor:
                isError ? Colors.white : Theme.of(context).colorScheme.onPrimary,
            activeFillColor:
                isError ? Colors.white : Theme.of(context).colorScheme.onPrimary,
            selectedFillColor:
                isError ? Colors.white : Theme.of(context).colorScheme.onPrimary,
            inactiveColor: isError ? ColorManager.error : Colors.transparent,
            activeColor: isError ? ColorManager.error : Colors.transparent,
            selectedColor: isError ? ColorManager.error : Colors.transparent,
            errorBorderColor: ColorManager.error,
            borderWidth: 1,
          ),
          validator: (value) {
            if (isError) {
              return StringManager.invalidCode;
            }
            return null;
          },
          onCompleted: (value) {
            onComplete(value);
          },
          cursorColor: Colors.black,
          showCursor: true,
          enableActiveFill: true,
          errorTextSpace: 20,
          errorTextDirection: TextDirection.rtl,

        ),
      ],
    );
  }
}
