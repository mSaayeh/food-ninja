import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/core/widgets/gradient_text.dart';

class PopularIcon extends StatelessWidget {
  const PopularIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        gradient: LinearGradient(
          colors: [
            gradientLightGreen.withOpacity(0.1),
            gradientDarkGreen.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
          child: const GradientText(
            text: 'Popular',
            gradient: LinearGradient(
              colors: [
                gradientLightGreen,
                gradientDarkGreen,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            style: TextStyle(
              fontFamily: 'BentonSans',
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
