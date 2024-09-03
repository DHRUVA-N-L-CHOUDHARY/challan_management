import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_fonts.dart';

class MyStyles {
  static TextStyle getTextStyle(
      {Color color = Colors.white, double fontSize = 20, fontFamily}) {
    return TextStyle(
        color: color, fontSize: fontSize.sp, fontFamily: fontFamily);
  }

  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
    button: TextStyle(
          fontSize: MyFonts.buttonTextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
          fontSize: MyFonts.body1TextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        bodyText2: TextStyle(
          fontSize: MyFonts.body2TextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline1: TextStyle(
          fontSize: MyFonts.headline1TextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.w800,
        ),
        headline2: TextStyle(
          fontSize: MyFonts.headline2TextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.w700,
        ),
        headline3: TextStyle(
          fontSize: MyFonts.headline3TextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.w600,
        ),
        headline4: TextStyle(
          fontSize: MyFonts.headline4TextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
        headline5: TextStyle(
          fontSize: MyFonts.headline5TextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          fontSize: MyFonts.headline6TextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.w300,
        ),
        caption: TextStyle(
          fontSize: MyFonts.captionTextSize,
          color: isLightTheme
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          fontWeight: FontWeight.normal,
        ),

      );
}
