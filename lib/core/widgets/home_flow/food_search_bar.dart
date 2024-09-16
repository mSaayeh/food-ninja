import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodSearchBar extends StatelessWidget {
  const FoodSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
        prefixIcon: Container(
          height: 24.h,
          margin: EdgeInsets.all(16.w),
          child: SvgPicture.asset(
            'assets/images/ic_search.svg',
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        fillColor: lightOrange.withOpacity(0.2),
        filled: true,
        prefixIconColor: darkOrange,
        hintText: 'What do you want to order?',
        hintStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 12.sp,
          color: darkOrange.withOpacity(.4),
        ),
      ),
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
