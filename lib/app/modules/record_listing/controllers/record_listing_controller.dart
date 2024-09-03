import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/local/my_shared_pref.dart';
import '../../../data/remote/api_service.dart';
import '../models/record_model.dart';

class RecordListingController extends GetxController {
  var records = <RecordModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    await fetchRecords();
    super.onInit();
  }

  Future<void> fetchRecords() async {
    try {
      isLoading(true);
      update();
      dynamic resu = await ApiService().getRecords(MySharedPref.getUserId());
      List<dynamic> jsonList = jsonDecode(resu.body);
      records.value =
          jsonList.map((json) => RecordModel.fromJson(json)).toList();
    } finally {
      isLoading(false);
      update();
    }
  }
}
