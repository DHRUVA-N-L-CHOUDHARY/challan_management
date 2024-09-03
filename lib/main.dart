import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:phone_email_auth/phone_email_auth.dart';
import "app/data/local/my_shared_pref.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/routes/app_pages.dart';
import 'config/theme/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PhoneEmail.initializeApp(clientId: '13385501908388414295');
  await MySharedPref.init();
  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    useInheritedMediaQuery: true,
    builder: (context, widget) {
      return GetMaterialApp(
        title: "Bus Management",
        transitionDuration: const Duration(milliseconds: 300),
        defaultTransition: Transition.cupertino,
        builder: (context, widget) {
          bool themeIsLight = MySharedPref.getThemeIsLight();
          return Theme(
            data: MyTheme.getThemeData(isLight: themeIsLight),
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            ),
          );
        },
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      );
    },
  ));
}
