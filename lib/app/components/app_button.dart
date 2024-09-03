import 'package:challan_management/app/data/local/my_shared_pref.dart';
import 'package:challan_management/config/theme/dark_theme_colors.dart';
import 'package:challan_management/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Size? fixedSize;
  final Function()? onPressed;
  const AppButton({super.key, this.text = "OK", this.fixedSize, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          foregroundColor: MySharedPref.getThemeIsLight()
              ? LightThemeColors.kPrimaryColor
              : DarkThemeColors.kPrimaryColor,
          backgroundColor: MySharedPref.getThemeIsLight()
              ? LightThemeColors.kSecondaryColor
              : DarkThemeColors.kSecondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          fixedSize: fixedSize ?? Size(Get.width * 0.85, 50.h)),
      child: Text(text),
    );
  }
}
