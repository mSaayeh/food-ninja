import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: 45.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFDF5ED),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: const Color(0xFFDA6317),
            size: 16.w,
          ),
        ),
      ),
    );
  }
}
