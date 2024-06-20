import 'custom_text_lato.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButtonText extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;
  final Color textColor;
  final double radius;
  final double width;
  CustomButtonText(this.text,
      {@required this.onTap,
      this.color,
      this.textColor,
      this.radius,
      this.width});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 50,
          width: width ?? 70.0.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
          child: Center(
            child: CustomTextLato(
              text,
              size: 10.0.sp,
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
