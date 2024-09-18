import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'colors.dart';
part 'typo.dart';

final ThemeData lightTheme = ThemeData(
  filledButtonTheme: _filledButtonThemeData,
  textTheme: _textTheme,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: gradientDarkGreen,
    secondary: gradientLightGreen,
    brightness: Brightness.light,
  ),
);

final buttonBorderRadius = BorderRadius.circular(15);

final FilledButtonThemeData _filledButtonThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    padding: const WidgetStatePropertyAll(EdgeInsets.zero),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: buttonBorderRadius,
      ),
    ),
    backgroundBuilder: (context, states, child) => DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: buttonBorderRadius,
        gradient: const LinearGradient(
          colors: [
            gradientLightGreen,
            gradientDarkGreen,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 18.h),
        child: child,
      ),
    ),
    textStyle: WidgetStatePropertyAll(_buttonTextStyle),
  ),
);
