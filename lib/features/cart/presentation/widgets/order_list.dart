import 'package:flutter/material.dart';
import 'package:food_ninja/features/cart/presentation/widgets/item_tile.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListBody(
      children: [
        ItemTile(image: 'assets/images/Menu Photo1.png'),
        SizedBox(
          height: 8,
        ),
        ItemTile(image: 'assets/images/Menu Photo2.png'),
        SizedBox(
          height: 8,
        ),
        ItemTile(image: 'assets/images/Menu Photo3.png'),
      ],
    );
  }
}
