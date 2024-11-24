import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingIndicatorWithNumber extends StatelessWidget {
  const RatingIndicatorWithNumber({
    super.key,
    required this.rating,
    this.label = "",
    required this.fontSize,
    required this.iconSize,
    required this.iconPadding,
  });

  final double rating;
  final String label;
  final double fontSize;
  final double iconSize;
  final double iconPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Padding(
          padding: EdgeInsets.only(right: iconPadding),
          child: Icon(
            FontAwesomeIcons.starHalfStroke,
            color: const Color(0xff2ECF80),
            size: iconSize,
            applyTextScaling: true,
          ),
        ),
        Container(
          height: 20.w,
          alignment: Alignment.center,
          child: Text(
            '$rating $label',
            style: TextStyle(
              color: const Color(0xFF3B3B3B).withOpacity(0.3),
              fontFamily: 'BentonSans',
              fontWeight: FontWeight.w400,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
