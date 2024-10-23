import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;
  final IconData? trailingIcon;

  const CustomFormField({
    super.key,
    required this.label,
    required this.controller,
    this.trailingIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      style: TextStyle(
        color: const Color(0xff3B3B3B),
        fontFamily: 'BentonSans',
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      decoration: InputDecoration(
        suffixIcon: trailingIcon != null
            ? Icon(
                trailingIcon,
                color: const Color(0xff3B3B3B).withOpacity(0.3),
              )
            : null,
        labelText: label,
        labelStyle: TextStyle(
          color: const Color(0xff3B3B3B).withOpacity(0.3),
          fontFamily: 'BentonSans',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        floatingLabelStyle: TextStyle(
          color: gradientDarkGreen,
          fontFamily: 'BentonSans',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: gradientDarkGreen,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xff3B3B3B).withOpacity(0.3),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xff3B3B3B).withOpacity(0.3),
          ),
        ),
      ),
      validator: (value) => value!.isEmpty ? 'Please enter $label' : null,
    );
  }
}
