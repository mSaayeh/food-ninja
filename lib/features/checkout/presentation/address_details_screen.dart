import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_back_button.dart';
import 'package:food_ninja/features/cart/presentation/widgets/custom_text.dart';
import 'package:food_ninja/features/checkout/presentation/widgets/custom_form_field.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({super.key});

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void dispose() {
    streetAddressController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    text: 'Address Details',
                    fontFamily: "BentonSans",
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff09051C),
                    fontSize: 25.sp,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (conutry) {
                              countryController.text = conutry.name;
                            },
                          );
                        },
                        child: CustomFormField(
                          label: 'Country',
                          controller: countryController,
                          enabled: false,
                          trailingIcon: Icons.arrow_drop_down_outlined,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomFormField(
                        label: 'City',
                        controller: cityController,
                      ),
                      SizedBox(height: 20.h),
                      CustomFormField(
                        label: 'Street Address',
                        controller: streetAddressController,
                      ),
                      SizedBox(height: 20.h),
                      CustomFormField(
                        label: 'Postal Code',
                        controller: postalCodeController,
                      ),
                      SizedBox(height: 40.h),
                      FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // save address
                          }
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ],
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
