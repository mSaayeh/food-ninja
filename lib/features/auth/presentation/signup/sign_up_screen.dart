import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ninja/core/theme/theme.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/features/auth/data/model/user.dart';
import 'package:food_ninja/features/auth/widgets/auth_text_form_field.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_router.dart';

final _firebaseAuth = FirebaseAuth.instance;
final _fireStore = FirebaseFirestore.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  String _email = "";
  String _password = "";

  void _onCreatedAccountClicked() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }

    try {
      final createdUser = await _firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      final user =
          AuthedUser(id: createdUser.user!.uid, name: _name, email: _email);
      log(user.toString());
      await _fireStore
          .collection("users")
          .doc(createdUser.user!.uid)
          .set(user.toMap());
      if (context.mounted) {
        context.pushReplacement(signupSuccess);
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'Authentication failed')),
      );
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message ?? 'FireStore failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset('assets/images/Logo.png'),
                  SvgPicture.asset("assets/images/App_Name.svg"),
                  SizedBox(height: 64.h),
                  Text('Sign Up For Free',
                      style: Theme.of(context).textTheme.titleSmall),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 24.w,
                        right: 24.w,
                        top: 40.h,
                        bottom: 118.h,
                      ),
                      child: Column(
                        children: <Widget>[
                          AuthTextFormField(
                            label: 'Name',
                            icon: SvgPicture.asset("assets/icons/Profile.svg"),
                            isPassword: false,
                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value.trim().length < 4) {
                                return 'Name must be at least 4 characters.';
                              }
                              return null;
                            },
                            onSave: (value) {
                              _name = value!;
                            },
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                          ),
                          const SizedBox(height: 12),
                          AuthTextFormField(
                            label: 'Email',
                            icon: SvgPicture.asset("assets/icons/Message.svg"),
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
                            icon: SvgPicture.asset("assets/icons/Password.svg"),
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.trim().length < 6) {
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
                  FilledButton(
                    onPressed: _onCreatedAccountClicked,
                    child: const Text('Create Account'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(login);
                      log("login success");
                    },
                    child: const Text(
                      'already have an account?',
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
