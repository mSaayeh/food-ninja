import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_ninja/core/theme/theme.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.onClick,
  });

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onClick,
      child: Container(
        height: 32.h,
        width: 32.w,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              gradientLightGreen,
              gradientDarkGreen,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          FontAwesomeIcons.cartPlus,
          color: Colors.white,
          size: 16.r,
        ),
      ),
    );
  }
}
