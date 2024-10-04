import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeartIcon extends StatelessWidget {
  const HeartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: const Center(
        child: Icon(
          FontAwesomeIcons.solidHeart,
          color: Color(0xffFF1D1D),
        ),
      ),
    );
  }
}
