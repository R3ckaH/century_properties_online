import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextLato extends StatelessWidget {
  final double size;
  final FontWeight weight;
  final FontStyle style;
  final Color color;
  final String text;
  final double spacing;
  CustomTextLato(
    this.text, {
    this.size,
    this.weight,
    this.style,
    this.color,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.clip,
      style: GoogleFonts.lato(
          fontSize: size,
          fontWeight: weight,
          height: spacing,
          fontStyle: style,
          color: color ?? Colors.black),
    );
  }
}
