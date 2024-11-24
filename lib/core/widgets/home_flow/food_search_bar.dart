import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/home/presentation/cubit/home_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodSearchBar extends StatefulWidget {
  const FoodSearchBar({super.key});

  @override
  State<FoodSearchBar> createState() => _FoodSearchBarState();
}

class _FoodSearchBarState extends State<FoodSearchBar> {
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onSearchChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () {
      context.read<HomeCubit>().loadRestaurants(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
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
