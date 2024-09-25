import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton(
      {super.key,
      required this.icon,
      required this.gradientColors,
      required this.iconColor,
      required this.gradientShaderColors});

  final IconData icon;
  final List<Color> gradientColors;
  final List<Color> gradientShaderColors;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: gradientShaderColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Icon(
            icon,
            size: 30,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
