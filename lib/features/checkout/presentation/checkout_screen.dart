import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/navigation/app_router.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_back_button.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_text.dart';
import 'package:food_ninja/features/checkout/data/models/address.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Address? address;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.hasData) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!snapshot.data!.data()!.containsKey('address')) {
                    context.pushReplacement(addressDetails);
                  } else {
                    address = snapshot.data!.data()!['address'].cast<Address>();
                    if (address == null) {
                      context.pushReplacement(addressDetails);
                    } else {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                });
              }
              return isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 25.w, top: 35.h),
                          child: const CustomBackButton(),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 25.w, top: 19.h),
                          child: CustomText(
                            text: 'Confirm Order',
                            fontFamily: "BentonSans",
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff09051C),
                            fontSize: 25.sp,
                          ),
                        ),
                        Text(address!.address),
                      ],
                    );
            }),
      ),
    );
  }
}
