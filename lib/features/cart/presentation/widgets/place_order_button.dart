import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/cart/presentation/widgets/gradient_text.dart';

class PlaceOrderButton extends StatelessWidget {
  final void Function()? onCheckout;
  final bool isLoading;
  const PlaceOrderButton({
    super.key,
    required this.onCheckout,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCheckout,
      child: Container(
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : GradientText(
                  text: 'Place My Order',
                  fontSize: 14.sp,
                  gradient: const LinearGradient(
                    colors: [
                      gradientLightGreen,
                      gradientDarkGreen,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
        ),
      ),
    );
  }
}
