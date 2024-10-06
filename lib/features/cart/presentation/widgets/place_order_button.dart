import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/cart/presentation/widgets/gradient_text.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: GradientText(
          text: 'Place My Order',
          fontSize: 20,
          gradient: LinearGradient(
            colors: [
              gradientLightGreen,
              gradientDarkGreen,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
