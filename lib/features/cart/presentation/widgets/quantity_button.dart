import 'package:flutter/material.dart';
import 'package:food_ninja/core/theme/theme.dart';

class QuantityButton extends StatelessWidget {
  QuantityButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.colors});
  VoidCallback onTap;
  Widget icon;
  List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
