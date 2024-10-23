import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/util/get_meal.dart';
import 'package:food_ninja/di/app_module.dart';
import 'package:food_ninja/features/cart/data/models/cart_item.dart';
import 'package:food_ninja/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_ninja/features/cart/presentation/widgets/cart_background.dart';
import 'package:food_ninja/features/cart/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return CartBackground(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 14.w, top: 24.h, right: 14.w),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('cart')
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
                  return CartItem(
                    quantity: e['quantity'],
                    meal: meal,
                  );
                }).toList()),
                builder: (context, snapshot) {
                  final cartItems = snapshot.data?.cast<CartItem>() ?? [];
                  final double subtotal = cartItems.fold(
                    0,
                    (previousValue, element) =>
                        previousValue + (element.meal.price * element.quantity),
                  );
                  final double deliveryCharge = cartItems.length * 5;
                  final double discount = 0;
                  final double totalPrice =
                      subtotal + deliveryCharge - discount;

                  return BlocProvider<CartCubit>(
                    create: (context) => CartCubit(sl()),
                    child: CartViewBody(
                      cartItems: cartItems,
                      subtotal: subtotal,
                      deliveryCharge: deliveryCharge,
                      discount: discount,
                      totalPrice: totalPrice,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
