import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';
import 'package:food_ninja/features/restaurant/presentation/add_to_cart_button.dart';
import 'package:food_ninja/features/restaurant/presentation/gradient_text.dart';

class MealTile extends StatelessWidget {
  final Meal meal;
  final VoidCallback onClick;
  final int cartQuantity;
  const MealTile({
    super.key,
    required this.meal,
    required this.onClick,
    required this.cartQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.r),
      ),
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: DoubleFallBackImage(
            mainNetworkImage: meal.imageUrl,
            fallBackNetowrkImage: meal.restaurant.imageUrl,
            fallBackLocalImage: 'assets/images/Logo.png',
            size: 62,
            boxFit: BoxFit.cover,
          ),
        ),
        title: Text(
          meal.name,
          style: TextStyle(
            color: const Color(0xFF3B3B3B),
            fontFamily: 'BentonSans',
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: GradientText(
          text: "\$ ${meal.price}",
          gradient: const LinearGradient(
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
            fontSize: 12.sp,
          ),
        ),
        trailing: cartQuantity == 0
            ? AddToCartButton(onClick: onClick)
            : const SizedBox(),
      ),
    );
  }
}
