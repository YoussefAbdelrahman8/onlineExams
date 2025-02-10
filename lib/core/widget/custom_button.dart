import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function() onPressed;
  double width, height;
  String content;
  Color contentColor;
  Color backgroundColor;
  double borderRadius;
  Color borderColor;

  CustomButton({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.content,
    required this.contentColor,
    required this.borderRadius,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: borderColor, width: 1)),
          fixedSize: Size(width, height),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            content,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: contentColor),
          ),
        ));
  }
}
