import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/core/widgets/gradient_text.dart';
import 'package:food_ninja/features/cart/data/models/cart_item.dart';
import 'package:food_ninja/features/cart/presentation/widgets/quantity_changer.dart';
import 'package:food_ninja/features/restaurant/presentation/add_to_cart_button.dart';

class MealTile extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onIncreaseClicked;
  final VoidCallback onDecreaseClicked;
  const MealTile({
    super.key,
    required this.onIncreaseClicked,
    required this.onDecreaseClicked,
    required this.cartItem,
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
            mainNetworkImage: cartItem.meal.imageUrl,
            fallBackNetworkImage: cartItem.meal.restaurant.imageUrl,
            fallBackLocalImage: 'assets/images/Logo.png',
            size: 62,
            boxFit: BoxFit.cover,
          ),
        ),
        title: Text(
          cartItem.meal.name,
          style: TextStyle(
            color: const Color(0xFF3B3B3B),
            fontFamily: 'BentonSans',
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: GradientText(
          text: "\$ ${cartItem.meal.price}",
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
        trailing: cartItem.quantity == 0
            ? AddToCartButton(onClick: onIncreaseClicked)
            : QuantityChanger(
                quantity: cartItem.quantity,
                onPlus: onIncreaseClicked,
                onMinus: onDecreaseClicked,
              ),
      ),
    );
  }
}
