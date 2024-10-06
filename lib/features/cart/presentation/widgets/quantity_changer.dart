import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/cart/presentation/cubit/cart_cubit.dart';

class QuantityChanger extends StatelessWidget {
  const QuantityChanger({
    super.key,
    required this.quantity,
    required this.onPlus,
    required this.onMinus,
  });
  final int quantity;
  final VoidCallback onPlus;
  final VoidCallback onMinus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Row(
            children: [
              InkWell(
                onTap: (state is CartLoading) ? null : onMinus,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  'assets/images/button_minus.png',
                  width: 25.w,
                  height: 25.h,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              if (state is CartLoading)
                const Center(child: CircularProgressIndicator())
              else
                Text(quantity.toString()),
              const Spacer(),
              InkWell(
                highlightColor: Colors.white,
                onTap: (state is CartLoading) ? null : onPlus,
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  'assets/images/button_plus.png',
                  width: 25.w,
                  height: 25.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
