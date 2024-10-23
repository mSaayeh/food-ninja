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
            Text(
              'Sub-Total',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            Text(
              '${subtotal.toStringAsFixed(2)} \$',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Charge',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
            Text(
              '${deliveryCharge.toStringAsFixed(2)} \$',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        if (discount != 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'BentonSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                '${discount.toStringAsFixed(2)} \$',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'BentonSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'BentonSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp),
            ),
            Text(
              '${totalPrice.toStringAsFixed(2)} \$',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
