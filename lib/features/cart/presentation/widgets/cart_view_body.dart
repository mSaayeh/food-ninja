import 'package:flutter/material.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_back_button.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_text.dart';
import 'package:food_ninja/features/cart/presentation/widgets/order_list.dart';
import 'package:food_ninja/features/cart/presentation/widgets/payment_card.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomBackButton(),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        CustomText(
          text: 'Order details',
          fontFamily: "BentonSans",
          fontWeight: FontWeight.w400,
          color: Color(0xff09051C),
          fontSize: 35,
        ),
        SizedBox(
          height: 25,
        ),
        OrderList(),
        Padding(
          padding: EdgeInsets.only(top: 65),
          child: PaymentCard(),
        ),
      ],
    );
  }
}
