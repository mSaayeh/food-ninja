import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField({
    super.key,
    required this.label,
    required this.icon,
    required this.isPassword,
    required this.validator,
    required this.onSave,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
  });

  final String label;
  final Widget icon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final void Function(String?) onSave;
  final String? Function(String?) validator;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  var isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.label,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: const Color(0xFFF4F4F4), width: 1.0.r),
        ),
        prefixIcon: Padding(
          padding:
              EdgeInsets.only(left: 20.w, top: 16.h, bottom: 16.h, right: 16.w),
          child: widget.icon,
        ),
        prefixIconConstraints: BoxConstraints(minHeight: 24.h, minWidth: 24.w),
        suffixIcon: widget.isPassword
            ? Padding(
                padding: EdgeInsets.only(left: 20.w, right: 16.w),
                child: IconButton(
                  onPressed: toggleVisibility,
                  icon: SvgPicture.asset("assets/icons/Show_Password.svg"),
                ),
              )
            : null,
      ),
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
      ),
      validator: widget.validator,
      obscureText: widget.isPassword && !isPasswordVisible,
      onSaved: widget.onSave,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
    );
  }

  void toggleVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
