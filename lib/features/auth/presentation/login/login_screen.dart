import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/navigation/app_router.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/features/auth/data/model/user.dart';
import 'package:food_ninja/features/auth/data/util/firestore_auth_helper.dart';
import 'package:food_ninja/features/auth/widgets/auth_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/theme/theme.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _googleSignIn = GoogleSignIn();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _fromKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool isLoading = false;

  void _onLoginClicked() async {
    if (_fromKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      _fromKey.currentState!.save();
    } else {
      return;
    }

    try {
      final loginUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: _email, password: _password);
      if (context.mounted) {
        context.go(mainNavigationScreen);
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.maybeOf(context)?.clearSnackBars();
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(content: Text(error.message ?? 'Authentication failed')),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<void> loginWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      final userCredentials =
          await _firebaseAuth.signInWithCredential(credential);
      if (userCredentials.additionalUserInfo?.isNewUser == true) {
        final user = AuthedUser(
          id: userCredentials.user!.uid,
          name: googleUser!.displayName ?? "Google User",
          email: googleUser.email,
        );
        await FirestoreAuthHelper.createNewUser(user);
      }
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Google sign in failed')),
      );
    }
  }

  void _onGoogleSignInClicked() async {
    setState(() {
      isLoading = true;
    });
    await loginWithGoogle();
    if (context.mounted) {
      context.go(mainNavigationScreen);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : BackgroundWidget(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/Logo.png'),
                        SvgPicture.asset("assets/images/App_Name.svg"),
                        SizedBox(height: 64.h),
                        Text('Login To Your Account',
                            style: Theme.of(context).textTheme.titleSmall),
                        Form(
                          key: _fromKey,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 24.w,
                              right: 24.w,
                              top: 40.h,
                              bottom: 20.h,
                            ),
                            child: Column(
                              children: [
                                AuthTextFormField(
                                  label: 'Email',
                                  icon: SvgPicture.asset(
                                      'assets/icons/Message.svg'),
                                  isPassword: false,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please enter a valid email.';
                                    }
                                    return null;
                                  },
                                  onSave: (value) {
                                    _email = value!;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 12),
                                AuthTextFormField(
                                  label: 'Password',
                                  icon: SvgPicture.asset(
                                      'assets/icons/Password.svg'),
                                  isPassword: true,
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().length < 6) {
                                      return 'Password must be at least 6 characters.';
                                    }
                                    return null;
                                  },
                                  onSave: (value) {
                                    _password = value!;
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Text('Or Continue With',
                            style: Theme.of(context).textTheme.headlineSmall),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            bottom: 76.h,
                          ),
                          child: OutlinedButton.icon(
                            onPressed: _onGoogleSignInClicked,
                            icon: Padding(
                              padding: EdgeInsetsDirectional.only(end: 12.w),
                              child: SvgPicture.asset(
                                'assets/icons/Google.svg',
                                width: 25.w,
                                height: 25.h,
                              ),
                            ),
                            label: Text(
                              'Google',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(letterSpacing: 0.5),
                              textAlign: TextAlign.center,
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.only(
                                top: 16.h,
                                bottom: 16.h,
                                right: 34.w,
                                left: 31.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              side: const BorderSide(
                                  color: Color(0xFFF4F4F4), width: 1),
                            ),
                          ),
                        ),
                        FilledButton(
                          onPressed: _onLoginClicked,
                          child: const Text('Login'),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            context.go(signup);
                          },
                          child: const Text(
                            'create an account',
                            style: TextStyle(color: gradientDarkGreen),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
