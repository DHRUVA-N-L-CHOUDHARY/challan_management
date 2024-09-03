import 'dart:convert';

import 'package:challan_management/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:phone_email_auth/phone_email_auth.dart';

import '../../../data/remote/api_service.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  // TextEditingController phonController = new TextEditingController();
  RxBool isLoading = false.obs;
  PhoneEmailUserModel phoneEmailUserModel = new PhoneEmailUserModel();

  void onSuccess(String accessToken) async {
    isLoading.value = true;
    update();
    PhoneEmail.getUserInfo(
        accessToken: accessToken,
        clientId: "13385501908388414295",
        onSuccess: (userData) async {
          phoneEmailUserModel = userData;
          print(phoneEmailUserModel.firstName);
          print(phoneEmailUserModel.lastName);
          print(phoneEmailUserModel.phoneNumber);
        });
    update();
    dynamic res = await ApiService().createUserAccount({
      "userName":
          "${phoneEmailUserModel.firstName} ${phoneEmailUserModel.lastName}",
      "phoneNumber": phoneEmailUserModel.phoneNumber,
      "accountType": "Driver"
    });
    if (res.statusCode == 201) {
      res = jsonDecode(res.body);
      if (res["message"] == "User registered successfully") {
        MySharedPref.setUserId(res["user"]["_id"]);
        MySharedPref.setPhoneNumber(res["user"]["phoneNumber"]);
        MySharedPref.setUserName(res["user"]["userName"]);
        MySharedPref.setToken(res["user"]["token"]);
        Get.offAllNamed(AppPages.ADDRECORD);
      }
    } else {
      res = jsonDecode(res.body);
      if (res["message"] == "User already exists with this phone number.") {
        dynamic resu = await ApiService()
            .getUserDetails(phoneEmailUserModel.phoneNumber.toString());
        resu = jsonDecode(resu.body);
        print(resu);
        if (resu["_id"] != null) {
          MySharedPref.setUserId(resu["_id"]);
          MySharedPref.setPhoneNumber(resu["phoneNumber"]);
          MySharedPref.setUserName(resu["userName"]);
          MySharedPref.setToken(resu["token"]);
          Get.offAllNamed(AppPages.ADDRECORD);
        }
      } else {
        Get.snackbar("Error", "Couldn't find the user");
      }
    }
    isLoading.value = false;
    update();
  }
}
