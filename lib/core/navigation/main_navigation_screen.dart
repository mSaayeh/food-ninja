import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/features/Profile/profile_screen.dart';
import 'package:food_ninja/features/cart/presentation/cart_view.dart';
import 'package:food_ninja/features/home/presentation/home_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('cart')
            .snapshots(),
        builder: (context, snapshot) {
          return PersistentTabView(
            navBarOverlap: const NavBarOverlap.full(),
            navBarHeight: 64.h,
            margin: EdgeInsets.all(10.r),
            tabs: [
              PersistentTabConfig(
                screen: const HomeScreen(),
                item: _buildNavBarItem(
                  iconPath: 'assets/images/Home.svg',
                  title: "Home",
                ),
              ),
              PersistentTabConfig(
                screen: const CartView(),
                item: _buildNavBarItem(
                  iconPath: 'assets/images/Cart.svg',
                  title: 'Cart',
                  hasBadge: snapshot.hasData && snapshot.data!.docs.isNotEmpty,
                  badgeNumber: snapshot.data?.docs.length,
                ),
              ),
              PersistentTabConfig(
                screen: const ProfileScreen(),
                item: _buildNavBarItem(
                  iconPath: 'assets/images/Profile.svg',
                  title: 'Profile',
                ),
              ),
            ],
            navBarBuilder: (navBarConfig) => Style8BottomNavBar(
              navBarConfig: navBarConfig,
              navBarDecoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(22.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20.r,
                    color: Colors.black54,
                    offset: Offset(10.w, 10.h),
                  )
                ],
              ),
              itemPadding: EdgeInsets.only(top: 10.h, bottom: 7.h),
            ),
          );
        });
  }

  ItemConfig _buildNavBarItem({
    required String iconPath,
    required String title,
    bool hasBadge = false,
    int? badgeNumber,
  }) =>
      ItemConfig(
        icon: hasBadge
            ? Badge(
                label: badgeNumber != null
                    ? Text(
                        badgeNumber.toString(),
                        style: TextStyle(fontSize: 9.sp),
                      )
                    : null,
                child: SvgPicture.asset(
                  iconPath,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.topCenter,
                  height: 24.h,
                  width: 24.w,
                ),
              )
            : SvgPicture.asset(
                iconPath,
                fit: BoxFit.scaleDown,
                alignment: Alignment.topCenter,
                height: 24.h,
                width: 24.w,
              ),
        title: title,
        iconSize: 24.r,
        textStyle: TextStyle(
          fontSize: 12.sp,
          fontFamily: bentonSansFontFamily,
        ),
        activeForegroundColor: const Color(0xFF09051C),
        activeColorSecondary: gradientLightGreen.withOpacity(.2),
      );
}
