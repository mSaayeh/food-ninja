import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG support

class CartBackground extends StatelessWidget {
  final Widget child;

  const CartBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const Scaffold(
          backgroundColor: Color(0xffFBFBFF),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: SizedBox(
            child: SvgPicture(
              const SvgAssetLoader("assets/images/cart_bg_pattern.svg"),
              height: size.height / 3,
              fit: BoxFit.cover,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
