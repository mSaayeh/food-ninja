part of 'theme.dart';

const _bentonSansFontFamily = "BentonSans";

var _buttonTextStyle = TextStyle(
  fontFamily: _bentonSansFontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 16.sp,
);

var _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: _bentonSansFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 31.sp,
      color: const Color(0xFF09051C),
    ),
    headlineMedium: TextStyle(
      fontFamily: _bentonSansFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 22.sp,
      color: const Color(0xFF09051C),
    ),
    headlineSmall: TextStyle(
      fontFamily: _bentonSansFontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 12.sp,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontFamily: _bentonSansFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 16.sp,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: _bentonSansFontFamily,
      fontWeight: FontWeight.w300,
      fontSize: 13.sp,
      color: Colors.black.withOpacity(0.5),
    ),
    titleMedium: TextStyle(
      fontFamily: _bentonSansFontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 15.sp,
      color: const Color(0xFF09051C),
    ),
    titleLarge: TextStyle(
      fontSize: 20.sp,
      fontFamily: _bentonSansFontFamily,
      fontWeight: FontWeight.w700,
      color: const Color(0xFF09051C),
    ));
