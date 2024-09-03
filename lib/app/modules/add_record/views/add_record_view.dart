import 'dart:io';

import 'package:challan_management/app/data/local/my_shared_pref.dart';
import 'package:challan_management/config/theme/dark_theme_colors.dart';
import 'package:challan_management/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/constants.dart';
import '../../../components/app_button.dart';
import '../../../components/drawer.dart';
import '../../../components/text_field.dart';
import '../controllers/add_record_controller.dart';

class AddRecordView extends StatelessWidget {
  const AddRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddRecordController>(
        init: AddRecordController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: MySharedPref.getThemeIsLight()
                  ? LightThemeColors.kSecondaryColor
                  : DarkThemeColors.kSecondaryColor,
                  leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: ImageIcon(AssetImage(appConst + AppImages.kMenuBar), color: MySharedPref.getThemeIsLight() ? LightThemeColors.kPrimaryColor : DarkThemeColors.kPrimaryColor,),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
              title: Text(
                "Add Record",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: MySharedPref.getThemeIsLight()
                      ? LightThemeColors.kPrimaryColor
                      : DarkThemeColors.kPrimaryColor,
                ),
              ),
            ),
              drawer: SideDrawer(),
            body: ListView(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 5.h),
                  child: Text(
                    "Name",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                AppTextField(
                  margin: EdgeInsets.symmetric(horizontal: 20.dg),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  controller: c.nameController,
                  hintText: "Challan",
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 5.h),
                  child: Text(
                    "Bus Number",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                AppTextField(
                  margin: EdgeInsets.symmetric(horizontal: 20.dg),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  controller: c.busNumberController,
                  hintText: "KA 16 F 2629",
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 5.h),
                  child: Text(
                    "Amount",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                AppTextField(
                  margin: EdgeInsets.symmetric(horizontal: 20.dg),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  controller: c.amountController,
                  hintText: "29",
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 5.h),
                  child: Text(
                    "",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                AppTextField(
                  margin: EdgeInsets.symmetric(horizontal: 20.dg),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  controller: c.remarksController,
                  maxLines: 1,
                  hintText: "29",
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 5.h),
                  child: Text(
                    "Remarks",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                AppTextField(
                  margin: EdgeInsets.symmetric(horizontal: 20.dg),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  controller: c.remarksController,
                  maxLines: 1,
                  hintText: "29",
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 10.h),
                  child: Text(
                    "Upload Images",
                    style: Get.textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.dg, vertical: 10.h),
                  child: Wrap(
                    spacing: 10.w,
                    runSpacing: 10.h,
                    children: c.images.map((imagePath) {
                      return Stack(
                        children: [
                          Image.file(
                            File(imagePath),
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                c.removeImage(imagePath);
                              },
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0.dg, vertical: 20.dg),
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.add_a_photo,
                          color: MySharedPref.getThemeIsLight()
                              ? LightThemeColors.kSecondaryColor
                              : DarkThemeColors.kSecondaryColor,
                        ),
                        label: Text(
                          "Add Image",
                          style: TextStyle(
                            color: MySharedPref.getThemeIsLight()
                                ? LightThemeColors.kSecondaryColor
                                : DarkThemeColors.kSecondaryColor,
                          ),
                        ),
                        onPressed: () async {
                          final pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            c.addImage(pickedFile.path);
                          }
                        },
                      ),
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
                      text: "Save",
                      onPressed: () {
                        // MySharedPref.setPhoneNumber("+91 9876543210");
                        // Get.toNamed(AppPages.RECORDLISTING);
                        c.addRec();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
