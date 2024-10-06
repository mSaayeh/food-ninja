import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/double_fall_back_image.dart';
import 'package:food_ninja/features/cart/data/models/cart_item.dart';
import 'package:food_ninja/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_ninja/features/cart/presentation/widgets/gradient_text.dart';
import 'package:food_ninja/features/cart/presentation/widgets/quantity_changer.dart';

class CartListTile extends StatelessWidget {
  const CartListTile({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              clipBehavior: Clip.hardEdge,
              child: DoubleFallBackImage(
                mainNetworkImage: cartItem.meal.imageUrl,
                fallBackNetworkImage: cartItem.meal.restaurant.imageUrl,
                fallBackLocalImage: 'assets/images/Logo.png',
                size: 64,
              ),
            ),
            const Spacer(flex: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.meal.name,
                  style: TextStyle(
                    color: const Color(0xFF09041B),
                    fontSize: 15.sp,
                    fontFamily: 'BentonSans',
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.fade,
                ),
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    cartItem.meal.restaurant.name,
                    style: TextStyle(
                      color: const Color(0xFF3B3B3B),
                      fontSize: 14.sp,
                      fontFamily: 'BentonSans',
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ),
                GradientText.defaultGradient(
                  text: "\$ ${cartItem.meal.price}",
                  fontSize: 18.sp,
                )
              ],
            ),
            const Spacer(flex: 7),
            QuantityChanger(
              quantity: cartItem.quantity,
              onPlus: () {
                context.read<CartCubit>().increaseQuantity(cartItem);
              },
              onMinus: () {
                context.read<CartCubit>().decreaseQuantity(cartItem);
              },
            ),
          ],
        ),
      ),
    );
  }
}
