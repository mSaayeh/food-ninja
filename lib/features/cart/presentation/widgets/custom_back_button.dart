import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFFDF5ED),
        borderRadius: BorderRadius.circular(22),
      ),
      child: const Center(
        child: Icon(
          Icons.arrow_back_ios_new,
          color: Color(0xFFDA6317),
          size: 25,
        ),
      ),
    );
  }
}
