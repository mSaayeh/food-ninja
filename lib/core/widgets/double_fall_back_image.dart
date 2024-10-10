import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/util/extensions.dart';

class DoubleFallBackImage extends StatelessWidget {
  final String? mainNetworkImage;
  final String? fallBackNetworkImage;
  final String fallBackLocalImage;
  final BoxFit boxFit;
  final double? width;
  final double? height;

  const DoubleFallBackImage({
    super.key,
    this.mainNetworkImage,
    this.fallBackNetworkImage,
    required this.fallBackLocalImage,
    double? size,
    this.boxFit = BoxFit.cover,
  })  : width = size,
        height = size;

  const DoubleFallBackImage.customSize({
    super.key,
    this.mainNetworkImage,
    this.fallBackNetworkImage,
    required this.fallBackLocalImage,
    this.boxFit = BoxFit.cover,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      mainNetworkImage.isNullOrEmpty()
          ? fallBackNetworkImage!
          : mainNetworkImage!,
      height: height?.h,
      width: width?.w,
      fit: boxFit,
      alignment: Alignment.center,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          fallBackLocalImage,
          height: height?.h,
          width: width?.w,
          fit: boxFit,
        );
      },
    );
  }
}
