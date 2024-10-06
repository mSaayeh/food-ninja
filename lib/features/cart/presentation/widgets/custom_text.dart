import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.fontFamily,
      required this.fontWeight,
      required this.color,
      required this.fontSize});

  final String text;
  final String fontFamily;

  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
