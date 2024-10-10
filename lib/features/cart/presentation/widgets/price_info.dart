import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceInfo extends StatelessWidget {
  final double subtotal;
  final double deliveryCharge;
  final double discount;
  final double totalPrice;

  const PriceInfo({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sub-Total',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
            Text(
              '${subtotal.toStringAsFixed(2)} \$',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Delivery Charge',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'BentonSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 19),
            ),
            Text(
              '${deliveryCharge.toStringAsFixed(2)} \$',
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'BentonSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 19),
            ),
          ],
        ),
        if (discount != 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Discount',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'BentonSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 19),
              ),
              Text(
                '${discount.toStringAsFixed(2)} \$',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'BentonSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 19),
              ),
            ],
          ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'BentonSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 19),
            ),
            Text(
              '${totalPrice.toStringAsFixed(2)} \$',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
