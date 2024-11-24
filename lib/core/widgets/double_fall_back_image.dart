import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/util/extensions.dart';

class DoubleFallBackImage extends StatelessWidget {
  final String? mainNetworkImage;
  final String? fallBackNetworkImage;
  final String fallBackLocalImage;
  final double? size;
  final BoxFit boxFit;

  const DoubleFallBackImage({
    super.key,
    this.mainNetworkImage,
    this.fallBackNetworkImage,
    required this.fallBackLocalImage,
    this.size,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      mainNetworkImage.isNullOrEmpty()
          ? fallBackNetworkImage!
          : mainNetworkImage!,
      height: size?.h,
      width: size?.w,
      fit: boxFit,
      alignment: Alignment.center,
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
