import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/navigation/app_router.dart';
import 'package:food_ninja/core/widgets/background_widget.dart';
import 'package:food_ninja/features/auth/data/model/user.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_back_button.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_text.dart';
import 'package:food_ninja/features/cart/presentation/widgets/payment_card.dart';
import 'package:food_ninja/features/checkout/data/models/address.dart';
import 'package:food_ninja/features/checkout/presentation/widgets/address_details_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class CheckoutScreen extends StatefulWidget {
  final double subtotal;
  final double deliveryCharge;
  final double discount;
  final double totalPrice;

  const CheckoutScreen({
    super.key,
    required this.subtotal,
    required this.deliveryCharge,
    required this.discount,
    required this.totalPrice,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Address? address;
  bool isLoading = true;
  bool isCheckoutLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BackgroundWidget(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser?.uid)
                .snapshots(),
            builder: (context, snapshot) {
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
                    address =
                        Address.fromMap(snapshot.data!.data()!['address']);
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          child: AddressDetailsTile(address: address!),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 20.h,
                          ),
                          child: PaymentCard(
                            subtotal: widget.subtotal,
                            deliveryCharge: widget.deliveryCharge,
                            discount: widget.discount,
                            totalPrice: widget.totalPrice,
                            isLoading: isCheckoutLoading,
                            onCheckout: isCheckoutLoading
                                ? null
                                : () async {
                                    setState(() {
                                      isCheckoutLoading = true;
                                    });
                                    final user = AuthedUser.fromMap(
                                        (await FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(FirebaseAuth
                                                    .instance.currentUser!.uid)
                                                .get())
                                            .data()!);

                                    final response = await http.post(
                                      Uri.parse(
                                          'https://accept.paymob.com/api/auth/tokens'),
                                      headers: {
                                        "Content-Type": "application/json",
                                      },
                                      body: json.encode(
                                        {
                                          "api_key":
                                              "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RnM05EQTNMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuN1ZqM1NGVy1rRFdhUlVGWW5zMXEzQnQxaWVMeHlUZ1gyaF9JRUJRbzRIUGc1UnVINEdrUGs4bUcxQTRtOGNpdVFlSG03S0M5Nkg3b2Rzai1zVzVDV1E=",
                                        },
                                      ),
                                    );
                                    if (json
                                        .decode(response.body)
                                        .containsKey('error')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            json.decode(response.body)['error'],
                                          ),
                                        ),
                                      );
                                      setState(() {
                                        isCheckoutLoading = false;
                                      });
                                      return;
                                    }

                                    final token =
                                        json.decode(response.body)['token'];

                                    final orderResponse = await http.post(
                                      Uri.parse(
                                          'https://accept.paymob.com/api/ecommerce/orders'),
                                      headers: {
                                        "Content-Type": "application/json",
                                      },
                                      body: json.encode(
                                        {
                                          "auth_token": token,
                                          "delivery_needed": "true",
                                          "amount_cents":
                                              widget.totalPrice * 100,
                                          "currency": "EGP",
                                          "items": [],
                                          "shipping_data": {
                                            "email": FirebaseAuth
                                                .instance.currentUser!.email,
                                            "first_name": user.name,
                                            "phone_number": "NA",
                                            "last_name": "NA",
                                            "street": address!.address,
                                            "building": "NA",
                                            "floor": "NA",
                                            "apartment": "NA",
                                            "city": address!.city,
                                            "state": "NA",
                                            "country": address!.country,
                                            "postal_code": address!.postalCode,
                                          },
                                        },
                                      ),
                                    );

                                    final orderId =
                                        json.decode(orderResponse.body)['id'];

                                    final paymentKeyResponse = await http.post(
                                      Uri.parse(
                                          'https://accept.paymob.com/api/acceptance/payment_keys'),
                                      headers: {
                                        "Content-Type": "application/json",
                                      },
                                      body: json.encode(
                                        {
                                          "auth_token": token,
                                          "amount_cents":
                                              widget.totalPrice * 100,
                                          "currency": "EGP",
                                          "expiration": 3600,
                                          "order_id": "$orderId",
                                          "billing_data": {
                                            "apartment": "NA",
                                            "email": FirebaseAuth
                                                .instance.currentUser!.email,
                                            "floor": "NA",
                                            "first_name": user.name,
                                            "last_name": user.name,
                                            "street": address!.address,
                                            "building": "NA",
                                            "phone_number": "NA",
                                            "shipping_method": "NA",
                                            "postal_code": address!.postalCode,
                                            "city": address!.city,
                                            "country": address!.country,
                                            "state": "NA",
                                          },
                                          "integration_id": 4619019,
                                          "lock_order_when_paid": "true",
                                        },
                                      ),
                                    );

                                    setState(() {
                                      isCheckoutLoading = false;
                                    });

                                    log(paymentKeyResponse.body);

                                    context.pushNamed(
                                      paymentDetails,
                                      pathParameters: {
                                        'paymentKey': json.decode(
                                            paymentKeyResponse.body)['token'],
                                      },
                                    ).then((value) async {
                                      if (value != null && value is Map) {
                                        if (value['status'] == 'success') {
                                          final cartCollection =
                                              FirebaseFirestore.instance
                                                  .collection('users')
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .collection('cart');
                                          var snapshots =
                                              await cartCollection.get();

                                          WriteBatch batch = FirebaseFirestore
                                              .instance
                                              .batch();

                                          for (var doc in snapshots.docs) {
                                            batch.delete(doc.reference);
                                          }
                                          await batch.commit();
                                          context.pushReplacement(
                                              mainNavigationScreen);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Payment failed, please try again later',
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    });
                                  },
                          ),
                        )
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
