import 'package:balancedmeal/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    this.onPressed,
    required this.textColor,
    required this.backgrounColor, required this.statebutton,
  });
  final String text;
  final double width;
  final double height;
  final void Function()? onPressed;
  final Color textColor;
  final Color backgrounColor;
  final bool statebutton;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: statebutton ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgrounColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: AppStyle.textStylesemibold50016poppins.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
