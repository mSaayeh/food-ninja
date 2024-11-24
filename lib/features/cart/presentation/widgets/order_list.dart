import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/cart/data/models/cart_item.dart';
import 'package:food_ninja/features/cart/presentation/widgets/cart_list_tile.dart';

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
    required this.cartItems,
    required this.onRemoved,
  });

  final List<CartItem> cartItems;
  final void Function(CartItem cartItem) onRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: ValueKey(cartItems[index].meal.id),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onRemoved(cartItems[index]);
          },
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsetsDirectional.only(end: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: const Color(0xFFFAAB22),
            ),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 30.sp,
            ),
          ),
          child: CartListTile(cartItem: cartItems[index]),
        );
      },
      itemCount: cartItems.length,
    );
  }
}
