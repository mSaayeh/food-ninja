import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/navigation/app_router.dart';
import 'package:food_ninja/features/cart/presentation/widgets/gradient_text.dart';
import 'package:food_ninja/features/checkout/data/models/address.dart';
import 'package:go_router/go_router.dart';

class AddressDetailsTile extends StatelessWidget {
  final Address address;
  const AddressDetailsTile({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: 12.w,
          top: 20.h,
          bottom: 20.h,
          end: 21.w,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deliver To',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'BentonSans',
                    color: const Color(0xFF3B3B3B).withOpacity(0.3),
                  ),
                ),
                GestureDetector(
                  onTap: () => context.push(addressDetails),
                  child: GradientText.defaultGradient(
                    text: 'Edit',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFF8D52B),
                  foregroundColor: const Color(0xFFE86D28),
                  radius: 16.5.w,
                  child: Icon(Icons.location_on, size: 23.w),
                ),
                SizedBox(width: 14.w),
                Expanded(
                  child: Text(
                    '${address.address}, ${address.city}, ${address.country}, ${address.postalCode}',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'BentonSans',
                      color: const Color(0xFF3B3B3B),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
