import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.gradient,
    required this.text,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight,
  });

  final String text;
  final Gradient gradient;
  final double fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
