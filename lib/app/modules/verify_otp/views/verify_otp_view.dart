import 'package:challan_management/app/data/local/my_shared_pref.dart';
import 'package:challan_management/config/theme/dark_theme_colors.dart';
import 'package:challan_management/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../../utils/constants.dart';
import '../../../components/app_button.dart';
import '../../../routes/app_pages.dart';

class VerifyOTPView extends StatelessWidget {
  const VerifyOTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 80.h,
          ),
          Center(
            child: Image.asset(
              appConst + AppImages.kAppIconNamed,
              width: Get.width * 0.45,
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Center(
            child: Text(
              "Welcome to Arrowspeed",
              textAlign: TextAlign.center,
              style: Get.textTheme.headline4,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              "Enter the verification code sent to",
              textAlign: TextAlign.center,
              style: Get.textTheme.bodyLarge,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(4.0.dg),
                child: Text(
                  MySharedPref.getPhoneNumber(),
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyLarge,
                ),
              ),
              Icon(
                Icons.edit,
                size: 15.sp,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0.dg, vertical: 20.h),
            child: Text(
              "One Time Password (OTP)",
              style: Get.textTheme.bodyLarge,
            ),
          ),
          OTPPinField(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Resend in 10secs",
                  style: TextStyle(
                      color: Colors.lightGreen,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.lightGreen),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: Get.height * 0.1,
        child: Column(
          children: [
            Center(
              child: AppButton(
                text: "Login / Get Started",
                onPressed: () {
                  Get.toNamed(AppPages.SIGNUP);
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget OTPPinField() {
    return OtpPinField(
      // key: _otpPinFieldController,

      ///in case you want to enable autoFill
      autoFillEnable: true,

      ///for Ios it is not needed as the SMS autofill is provided by default, but not for Android, that's where this key is useful.
      textInputAction: TextInputAction.done,

      ///in case you want to change the action of keyboard
      /// to clear the Otp pin Controller
      onSubmit: (text) {
        print('Entered pin is $text');

        /// return the entered pin
      },
      onChange: (text) {
        print('Enter on change pin is $text');

        /// return the entered pin
      },
      onCodeChanged: (code) {
        print('onCodeChanged  is $code');
      },

      /// to decorate your Otp_Pin_Field
      otpPinFieldStyle: OtpPinFieldStyle(
        /// border color for inactive/unfocused Otp_Pin_Field
        defaultFieldBorderColor: MySharedPref.getThemeIsLight()
            ? LightThemeColors.kSecondaryColor
            : DarkThemeColors.kSecondaryColor,

        fieldBorderWidth: 1,
      ),
      maxLength: 4,
      fieldHeight: 45.h,
      fieldWidth: 60.w,

      /// no of pin field
      showCursor: true,

      /// bool to show cursor in pin field or not
      cursorColor: MySharedPref.getThemeIsLight()
          ? LightThemeColors.kSecondaryColor
          : DarkThemeColors.kSecondaryColor,

      cursorWidth: 2,

      mainAxisAlignment: MainAxisAlignment.center,

      otpPinFieldDecoration: OtpPinFieldDecoration.defaultPinBoxDecoration,
    );
  }
}
