import 'package:challan_management/config/theme/dark_theme_colors.dart';
import 'package:challan_management/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/local/my_shared_pref.dart';
import '../routes/app_pages.dart';

class SideDrawer extends StatelessWidget {
  Color kPrimaryColor = MySharedPref.getThemeIsLight() ? LightThemeColors.kPrimaryColor : DarkThemeColors.kPrimaryColor;
  Color kSecondaryColor = MySharedPref.getThemeIsLight() ? LightThemeColors.kSecondaryColor : DarkThemeColors.kSecondaryColor;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              MySharedPref.getUserId() == "guest@email.com"
                  ? print("---------")
                  : Get.toNamed(AppPages.HOME);
              MySharedPref.getUserId() == "guest@email.com"
                  ? print("---------")
                  : Get.toNamed(AppPages.HOME);
            },
            child: ListTile(
              selected: true,
              selectedTileColor: kSecondaryColor,
              minVerticalPadding: 30,
              title: Text(
                MySharedPref.getUserName().capitalize ?? "",
                style: TextStyle(color: kPrimaryColor, fontSize: 25.sp),
              ),
              // subtitle: MySharedPref.getUserId() == "guest@email.com"
              //     ? Container(
              //         height: 10,
              //         width: 10,
              //       )
              //     : Text(
              //         MySharedPref.getUserId(),
              //         style: TextStyle(color: kSecondaryColor, fontSize: 16.sp),
              //       ),
              // currentAccountPicture: Container(
              //   width: 120,
              //   height: 120,
              //   padding: const EdgeInsets.all(2),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(60)),
              //   //backgroundColor: Colors.white70,
              //   //minRadius: 60.0,
              //   child: Container(
              //     width: 120,
              //     height: 120,
              //     decoration: BoxDecoration(
              //         //  color: Colors.white70,
              //         borderRadius: BorderRadius.circular(60)),
              //     child: ClipOval(
              //         child: Image.asset(
              //       "assets/user.png",
              //       width: 90,
              //       fit: BoxFit.cover,
              //       errorBuilder: (BuildContext context, Object exception,
              //           dynamic stackTrace) {
              //         return Container(
              //             color: Colors.red.withOpacity(0.1),
              //             width: 90,
              //             height: 90,
              //             child: Center(
              //               child: Icon(
              //                 Icons.add_a_photo_outlined,
              //                 color: Colors.red.withOpacity(0.3),
              //                 size: 28,
              //               ),
              //             ));
              //       },
              //       height: 90,
              //     )),
              //   ),
              // ),
              // decoration: const BoxDecoration(
              tileColor: kPrimaryColor,
              // ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(
              'Add Record',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () => {Navigator.pop(context)},
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () => {Get.toNamed(AppPages.SPLASH)},
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: Text(
              'Records Listing',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () => {Get.toNamed(AppPages.RECORDLISTING)},
          ),
          
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 14.sp),
            ),
            onTap: () {
              Get.offAllNamed(AppPages.SIGNIN);
              MySharedPref.clearSession();
            },
          ),
          
        ],
      ),
    );
  }
}
