import 'dart:convert';
import 'dart:io';

import 'package:challan_management/app/data/local/my_shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../../../data/remote/api_service.dart';

class AddRecordController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController busNumberController = TextEditingController();
  TextEditingController challanTypeController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  RxList<String> images = <String>[].obs;

  void addImage(String path) {
    images.add(path);
    update();
  }

  void removeImage(String path) {
    images.remove(path);
    update();
  }

  Future<String> uploadImageToCloudinary(String imagePath) async {
    // Read the image file
    File imageFile = File(imagePath);
    List<int> imageBytes = await imageFile.readAsBytes();

    // Create the Cloudinary URL
    var url =
        Uri.parse('https://api.cloudinary.com/v1_1/dij8dqkos/image/upload');

    // Prepare the Cloudinary API request
    var request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = 'unsigned_preset'
      // ..fields['public_id'] = "Profile Image"
      ..fields['api_key'] = '369513281282942'
      ..fields['timestamp'] = DateTime.now().millisecondsSinceEpoch.toString()
      // ..fields['signature'] = _generateSignature('iFyIkmtbpEdxx4WJwFYDYDl-H0U',
      // DateTime.now().millisecondsSinceEpoch.toString())
      ..files.add(http.MultipartFile.fromBytes('file', imageBytes,
          filename: "imagePath.jpg"));

    // Send the request to Cloudinary
    var response = await request.send();
    var responseString = await response.stream.bytesToString();
    var jsonResponse = jsonDecode(responseString);
    print(jsonResponse);
    print("=========================================");
    print(response.statusCode);
    if (response.statusCode == 200) {
      return jsonResponse['secure_url'];
    } else {
      throw Exception('Failed to upload image to Cloudinary: $responseString');
    }
  }

  String _generateSignature(String apiSecret, String timestamp) {
    var bytes = utf8.encode('timestamp=$timestamp$apiSecret');
    return md5.convert(bytes).toString();
  }

  Future<void> addRec() async {
    String imageUrl =
        await uploadImageToCloudinary(images.length != 0 ? images[0] : "");
    Map res = await ApiService().addRecord({
      "userID": MySharedPref.getUserId(),
      "amount": amountController.text,
      "remarks": remarksController.text,
      "imageUrl": imageUrl,
      "challanType": "overspeeding",
      "busNumber": "FJSKL"
    });
  }
  
}
