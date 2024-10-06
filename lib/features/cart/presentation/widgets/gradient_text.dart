import 'package:flutter/material.dart';
import 'package:food_ninja/core/theme/theme.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.gradient,
    required this.text,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight,
  });

  const GradientText.defaultGradient({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontFamily,
    this.fontWeight,
  }) : gradient = const LinearGradient(
          colors: [
            gradientLightGreen,
            gradientDarkGreen,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

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
