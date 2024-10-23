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
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isLogout
            ? Colors.red.withOpacity(0.1)
            : gradientLightGreen.withOpacity(0.1),
        foregroundColor: isLogout ? Colors.red : gradientLightGreen,
        child: leading,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp),
      ),
      onTap: onTab,
    );
  }
}
