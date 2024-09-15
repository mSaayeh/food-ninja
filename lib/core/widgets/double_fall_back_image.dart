import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/util/extensions.dart';

class DoubleFallBackImage extends StatelessWidget {
  final String? mainNetworkImage;
  final String? fallBackNetowrkImage;
  final String fallBackLocalImage;
  final double? size;
  final BoxFit boxFit;

  const DoubleFallBackImage({
    super.key,
    this.mainNetworkImage,
    this.fallBackNetowrkImage,
    required this.fallBackLocalImage,
    this.size,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      mainNetworkImage.isNullOrEmpty()
          ? fallBackNetowrkImage!
          : mainNetworkImage!,
      height: size?.h,
      width: size?.w,
      fit: boxFit,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          fallBackLocalImage,
          height: size?.h,
          width: size?.w,
          fit: boxFit,
        );
      },
    );
  }
}
