import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/util/get_meal.dart';
import 'package:food_ninja/core/widgets/meals_list/widgets/meal_tile.dart';
import 'package:food_ninja/di/app_module.dart';
import 'package:food_ninja/features/cart/data/models/cart_item.dart';
import 'package:food_ninja/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_ninja/features/home/data/models/meal.dart';

class MealsList extends StatelessWidget {
  final List<Meal> meals;
  final double separatorHeight;
  final ScrollPhysics physics;
  const MealsList({
    super.key,
    required this.meals,
    this.separatorHeight = 20,
    this.physics = const NeverScrollableScrollPhysics(),
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(sl()),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('cart')
              .where('meal', whereIn: meals.map((e) => e.ref).toList())
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            var cartItemsDocs = snapshot.data!.docs;

            return FutureBuilder(
              future: Future.wait(cartItemsDocs.map((e) async {
                final doc = await e['meal'].get();
                final meal = await getMeal(doc);
                final quantity = await e['quantity'];
                return CartItem(
                  quantity: quantity,
                  meal: meal,
                );
              }).toList()),
              builder: (context, snapshot) {
                final cartItems = snapshot.data?.cast<CartItem>() ?? [];
                meals.forEach((meal) {
                  if (!cartItems.any((element) => element.meal.id == meal.id)) {
                    cartItems.add(CartItem(quantity: 0, meal: meal));
                  }
                });
                return ListView.separated(
                  shrinkWrap: true,
                  physics: physics,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return MealTile(
                      cartItem: cartItems[index],
                      onIncreaseClicked: () => context
                          .read<CartCubit>()
                          .increaseQuantity(cartItems[index]),
                      onDecreaseClicked: () => context
                          .read<CartCubit>()
                          .decreaseQuantity(cartItems[index]),
                    );
                  },
                  itemCount: cartItems.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: separatorHeight.h);
                  },
                );
              },
            );
          }),
    );
  }
}
