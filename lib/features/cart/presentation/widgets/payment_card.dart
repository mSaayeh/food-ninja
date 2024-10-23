import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/cart/presentation/widgets/place_order_button.dart';
import 'package:food_ninja/features/cart/presentation/widgets/price_info.dart';

class PaymentCard extends StatelessWidget {
  final double subtotal;
  final double deliveryCharge;
  final double discount;
  final double totalPrice;
  final VoidCallback? onCheckout;
  final bool isLoading;

  const PaymentCard({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.totalPrice,
    required this.onCheckout,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
            colors: [gradientLightGreen, gradientDarkGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              child: SvgPicture(
                const SvgAssetLoader('assets/images/payment_cart_pattern.svg'),
                height: 200.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 20.h,
              bottom: 12.h,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: PriceInfo(
                    subtotal: subtotal,
                    deliveryCharge: deliveryCharge,
                    discount: discount,
                    totalPrice: totalPrice,
                  ),
                ),
                const Spacer(),
                PlaceOrderButton(
                  onCheckout: onCheckout,
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
