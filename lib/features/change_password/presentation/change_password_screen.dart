import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_back_button.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_text.dart';
import 'package:food_ninja/features/checkout/presentation/widgets/custom_form_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late final TextEditingController _currentPasswordController;
  late final TextEditingController _newPasswordController;
  late final TextEditingController _confirmNewPasswordController;
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 35.h),
                  child: const CustomBackButton(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 19.h),
                  child: CustomText(
                    text: 'Change Password',
                    fontFamily: "BentonSans",
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff09051C),
                    fontSize: 25.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 19.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          label: 'Current Password',
                          controller: _currentPasswordController,
                          validator: (value) {
                            if (_currentPasswordController.text.isEmpty) {
                              return 'Please enter your current password';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 20.h),
                        CustomFormField(
                          label: 'New Password',
                          controller: _newPasswordController,
                          validator: (p0) {
                            if (_newPasswordController.text.isEmpty) {
                              return 'Please enter your new password';
                            }
                            if (_newPasswordController.text.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 20.h),
                        CustomFormField(
                          label: 'Confirm New Password',
                          controller: _confirmNewPasswordController,
                          validator: (p0) {
                            if (_confirmNewPasswordController.text.isEmpty) {
                              return 'Please confirm your new password';
                            }
                            if (_confirmNewPasswordController.text !=
                                _newPasswordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 20.h),
                        ElevatedButton(
                          onPressed: _isLoading
                              ? null
                              : () async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      await FirebaseAuth.instance.currentUser!
                                          .reauthenticateWithCredential(
                                        EmailAuthProvider.credential(
                                          email: FirebaseAuth
                                              .instance.currentUser!.email!,
                                          password:
                                              _currentPasswordController.text,
                                        ),
                                      );
                                      await FirebaseAuth.instance.currentUser!
                                          .updatePassword(
                                              _newPasswordController.text);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Password changed successfully'),
                                          ),
                                        );
                                        Navigator.pop(context);
                                      }
                                    } on FirebaseAuthException catch (e) {
                                      if (e.code == 'wrong-password') {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Current password is incorrect'),
                                            ),
                                          );
                                        }
                                      } else if (e.code == 'weak-password') {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Password is too weak. Please choose a stronger password'),
                                            ),
                                          );
                                        }
                                      } else if (context.mounted) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(e.message!),
                                          ),
                                        );
                                        print(e.code);
                                      }
                                    }
                                  }
                                  setState(() {
                                    _isLoading = false;
                                  });
                                },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.of(context).size.width / 2,
                              50.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : const Text('Change Password'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
