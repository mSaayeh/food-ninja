import 'package:flutter/material.dart';
import 'package:food_ninja/features/cart/data/models/cart_item.dart';
import 'package:food_ninja/features/cart/presentation/widgets/cart_list_tile.dart';

class OrderList extends StatelessWidget {
  final List<CartItem> cartItems;
  const OrderList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return CartListTile(cartItem: cartItems[index]);
      },
      itemCount: cartItems.length,
    );
  }
}
