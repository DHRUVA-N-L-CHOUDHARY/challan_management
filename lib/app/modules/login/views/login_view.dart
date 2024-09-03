import 'package:challan_management/app/components/show_loader.dart';
import 'package:challan_management/app/data/local/my_shared_pref.dart';
import 'package:challan_management/app/modules/login/controllers/login_controller.dart';
import 'package:challan_management/config/theme/dark_theme_colors.dart';
import 'package:challan_management/config/theme/light_theme_colors.dart';
import 'package:challan_management/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phone_email_auth/phone_email_auth.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (c) {
          return Scaffold(
            body: c.isLoading.value
                ? ShowLoader()
                : ListView(
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
                          "Login using you mobile number \n to sign in",
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      // Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 10.h),
                      //   child: Text(
                      //     "Your mobile number",
                      //     style: Get.textTheme.bodyLarge,
                      //   ),
                      // ),
                      // AppTextField(
                      //   margin: EdgeInsets.symmetric(horizontal: 20.dg),
                      //   contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                      //   controller: c.phonController,
                      //   hintText: "+91 9876543210",
                      // ),
                      // SizedBox(
                      //   height: 100.h,
                      // ),
                    ],
                  ),
            bottomNavigationBar: SizedBox(
              height: Get.height * 0.15,
              child: Column(
                children: [
                  Center(
                      child: PhoneLoginButton(
                    borderRadius: 8,
                    buttonColor: MySharedPref.getThemeIsLight()
                        ? LightThemeColors.kSecondaryColor
                        : DarkThemeColors.kSecondaryColor,
                    label: 'Sign in with Phone',
                    onSuccess: (String accessToken, String jwtToken) {
                      if (accessToken.isNotEmpty) {
                        print(accessToken);
                        print(jwtToken);
                        c.onSuccess(accessToken);
                      }
                    },
                  )
                      // AppButton(
                      //   text: "Get OTP",
                      //   onPressed: () {
                      //     MySharedPref.setPhoneNumber(c.phonController.text);
                      //     Get.toNamed(AppPages.VERIFYOTP);
                      //   },
                      // ),
                      ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      "By pressing this you agree to our Privacy policy and \n Terms and Conditions",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
