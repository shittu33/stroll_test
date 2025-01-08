import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dimensions.dart';

var appColor = AppColors();
var appTheme = AppTheme();

class AppColors {
  AppColors();

  var fadeBlack = const Color(0xFF0F1115);
  var primary = const Color(0xFF8B88EF);
  var greyText = const Color(0xFFC4C4C4);
  var greyText2 = const Color(0xFFE5E5E5);
  var primaryText = const Color(0xFFCBC9FF);
  var primaryBoldText = const Color(0xFFCCC8FF);
  var whiteBoldText = const Color(0xFFF5F5F5);
  var white = const Color(0xFFFFFFFF);

}

var headline2Style =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: appColor.black);

var textColor = appColor.white;

class AppTheme {
  var light = ThemeData(
    fontFamily: 'Proxima',

    iconTheme: appColor.primary,
    primaryColor: appColor.primary,
    scaffoldBackgroundColor: appColor.fadeBlack,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: appColor.fadeBlack,
    ),

    // ignore: prefer_const_constructors
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        color: appColor.primaryBoldText,
        letterSpacing: 1,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: appColor.whiteBoldText,
        letterSpacing: 1,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: appColor.greyText,
      ),
      titleMedium: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: appColor.whiteBoldText,
        letterSpacing: 1,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: appColor.greyText2, //primaryText
      ),


    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appColor.fadeBlack,
      selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  );
}
