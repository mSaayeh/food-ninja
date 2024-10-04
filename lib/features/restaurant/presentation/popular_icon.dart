import 'package:flutter/material.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/restaurant/presentation/gradient_text.dart';

class PopularIcon extends StatelessWidget {
  const PopularIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(colors: [
          gradientLightGreen.withOpacity(0.1),
          gradientDarkGreen.withOpacity(0.1),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: const Center(
        child: GradientText(
          text: 'Popular',
          gradient: LinearGradient(colors: [
            gradientLightGreen,
            gradientDarkGreen,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          style: TextStyle(
            fontFamily: 'BentonSans',
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
