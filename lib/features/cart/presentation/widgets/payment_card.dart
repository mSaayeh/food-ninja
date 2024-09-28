import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/cart/presentation/widgets/place_order_button.dart';
import 'package:food_ninja/features/cart/presentation/widgets/price_info.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            colors: [gradientLightGreen, gradientDarkGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: const Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              child: SvgPicture(
                SvgAssetLoader('assets/images/payment_cart_pattern.svg'),
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                PriceInfo(),
                SizedBox(
                  height: 36,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: PlaceOrderButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
