import 'package:flutter/material.dart';
import 'package:food_ninja/features/cart/presentation/widgets/cart_background.dart';
import 'package:food_ninja/features/cart/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartBackground(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: CartViewBody(),
      ),
    );
  }
}
