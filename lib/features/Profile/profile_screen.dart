import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/navigation/app_router.dart';
import 'package:food_ninja/features/Profile/cubit/profile_cubit.dart';
import 'package:food_ninja/features/Profile/widgets/profile_list_tile.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..loadProfile(),
      child: SafeArea(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            switch (state) {
              case ProfileLoading():
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ProfileError():
                return Center(
                  child: Text(state.message),
                );
              case ProfileLoaded():
                return Column(
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello, ${state.user.name}',
                                style: TextStyle(fontSize: 25.sp),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                              Text(
                                state.user.email,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color:
                                      const Color(0xFF3B3B3B).withOpacity(0.3),
                                ),
                              ),
                            ],
                          ),
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
                              leading: const Icon(Icons.password),
                              title: 'Change Password',
                              onTab: () {
                                context.push(changePassword);
                              },
                            ),
                            ProfileListTile(
                              leading: const Icon(Icons.logout),
                              title: 'Log out',
                              onTab: () {
                                FirebaseAuth.instance.signOut();
                                if (context.mounted) {
                                  context.go(splash);
                                }
                              },
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
