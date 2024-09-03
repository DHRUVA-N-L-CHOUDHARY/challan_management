import 'package:challan_management/config/theme/dark_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/data/local/my_shared_pref.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {
  static getThemeData({required bool isLight}) {
    return ThemeData(
      primaryColor: isLight
          ? LightThemeColors.kPrimaryColor
          : DarkThemeColors.kPrimaryColor,
      brightness: isLight ? Brightness.light : Brightness.dark,
      textTheme: MyStyles.getTextTheme(isLightTheme: isLight),
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: isLight
              ? LightThemeColors.kPrimaryColor
              : DarkThemeColors.kPrimaryColor),
    );
  }

  /// update app theme and save theme type to shared pref
  /// (so when the app is killed and up again theme will remain the same)
  static changeTheme() {
    // *) check if the current theme is light (default is light)
    bool isLightTheme = MySharedPref.getThemeIsLight();
    // *) store the new theme mode on get storage
    MySharedPref.setThemeIsLight(!isLightTheme);
    // *) let GetX change theme
    Get.changeThemeMode(!isLightTheme ? ThemeMode.light : ThemeMode.dark);
  }

  /// check if the theme is light or dark
  bool get getThemeIsLight => MySharedPref.getThemeIsLight();
}
