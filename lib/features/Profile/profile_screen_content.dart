import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/navigation/app_router.dart';
import 'package:food_ninja/features/Profile/profile_cubit.dart';
import 'package:food_ninja/features/Profile/widgets/profile_list_tile.dart';
import 'package:food_ninja/features/auth/data/model/user.dart';
import 'package:go_router/go_router.dart';

class ProfileScreenContent extends StatelessWidget {
  final AuthedUser user;

  const ProfileScreenContent(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    void onLogoutClick() async {
      await FirebaseAuth.instance.signOut();
      if (context.mounted) {
        context.go(splash);
      }
    }

    return BlocProvider(
      create: (context) => ProfileCubit()..loadProfile(),
      child: SafeArea(
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            switch (state) {
              case ProfileLoading():
                const Center(
                  child: CircularProgressIndicator(),
                );
              case ProfileError():
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: Colors.red,
                  ),
                );
              case ProfileLoaded():
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          height: 100.h,
                          width: 100.w,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, ${user.name}',
                              style: TextStyle(fontSize: 25.sp),
                            ),
                            Text(
                              user.email,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF3B3B3B).withOpacity(0.3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black45,
                      thickness: 0.5,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ProfileListTile(
                              leading: const Icon(Icons.logout),
                              title: 'Log out',
                              onTab: onLogoutClick,
                              isLogout: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
