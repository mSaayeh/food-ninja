import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/cart/data/models/cart_item.dart';
import 'package:food_ninja/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_text.dart';
import 'package:food_ninja/features/cart/presentation/widgets/order_list.dart';
import 'package:food_ninja/features/cart/presentation/widgets/payment_card.dart';

class CartViewBody extends StatelessWidget {
  final List<CartItem> cartItems;
  final double subtotal;
  final double deliveryCharge;
  final double discount;
  final double totalPrice;

  const CartViewBody({
    super.key,
    required this.cartItems,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.totalPrice,
  });

  void removeFromCart(BuildContext context, CartItem cartItem) {
    try {
      context.read<CartCubit>().removeFromCart(cartItem);
      cartItems.remove(cartItem);
    } catch (e) {
      cartItems.add(cartItem);
    }
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item deleted!'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            context.read<CartCubit>().addToCart(cartItem);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Order details',
          fontFamily: "BentonSans",
          fontWeight: FontWeight.w400,
          color: const Color(0xff09051C),
          fontSize: 25.sp,
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: OrderList(
            cartItems: cartItems,
            onRemoved: (cartItem) => removeFromCart(context, cartItem),
          ),
        ),
        PaymentCard(
          subtotal: subtotal,
          deliveryCharge: deliveryCharge,
          discount: discount,
          totalPrice: totalPrice,
        ),
      ],
    );
  }
}
