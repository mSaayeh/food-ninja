import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/theme/theme.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.leading,
    required this.title,
    required this.onTab,
    this.trailing,
    this.isLogout = false,
  });

  final Widget leading;
  final String title;
  final Widget? trailing;
  final void Function() onTab;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 4.h, horizontal: 8.w),
      child: ListTile(
        leading: Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isLogout
                ? Colors.red.withOpacity(0.1)
                : gradientLightGreen.withOpacity(0.1),
          ),
          child: leading,
        ),
        iconColor: isLogout ? Colors.red : gradientLightGreen,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
        ),
        tileColor: const Color(0xFF3B3B3B).withOpacity(0.05),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        onTap: onTab,
      ),
    );
  }
}
