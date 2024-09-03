import 'package:challan_management/app/data/local/my_shared_pref.dart';
import 'package:challan_management/app/modules/record_listing/controllers/record_listing_controller.dart';
import 'package:challan_management/config/theme/dark_theme_colors.dart';
import 'package:challan_management/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../record_detail/views/record_detail_view.dart';


class RecordListingView extends StatelessWidget {
  const RecordListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordListingController>(
        init: RecordListingController(),
        builder: (c) {
          return Scaffold(
            body: c.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: c.records.length,
                    itemBuilder: (context, index) {
                      final record = c.records[index];
                      return RecordItem(
                        bookingDate: DateTime.parse(record.createdAt ?? DateTime.now().toIso8601String()),
                        ordernum: record.recordId ?? '',
                        orderKey: record.id ?? '',
                        amount: record.amount?.toDouble() ?? 0.0,
                        status: record.challanType ?? '',
                        locationName: record.busNumber ?? '',
                        paymentMethod: '', // Assuming this is not available in RecordModel
                        product: record.remarks ?? '',
                      );
                    },
                  ),
          );
        });
  }
}

class RecordItem extends StatelessWidget {
  final DateTime bookingDate;
  final String ordernum;
  final double amount;
  final String status;
  final String locationName;
  final String paymentMethod;
  final String product;
  final String orderKey;
  const RecordItem(
      {super.key,
      required this.bookingDate,
      required this.ordernum,
      required this.orderKey,
      required this.amount,
      required this.status,
      required this.locationName,
      required this.paymentMethod,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(RecordDetailView(
          orderno: ordernum,
          orderKey: orderKey,
          status: status,
          locationname: locationName,
          paymentmethod: paymentMethod,
          amount: amount,
          product: product,
          bookingDate: "${DateFormat('EEE, d MMMM').format(bookingDate)}",
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(10.dg),
        child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: MySharedPref.getThemeIsLight()
              ? LightThemeColors.kPrimaryColor
              : DarkThemeColors.kPrimaryColor,
          minLeadingWidth: 20,
          title: Padding(
            padding: const EdgeInsets.all(8.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Record Name : ${ordernum}",
                    style: TextStyle(fontSize: 14.sp)),
                Text(
                    "Record Date : ${DateFormat('EEE, d MMMM').format(bookingDate)}",
                    style: TextStyle(fontSize: 14.sp)),
                Text("Price : $amount", style: TextStyle(fontSize: 14.sp)),
                Text(
                  "Record Amount : ${status.capitalizeFirst}",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "Record Type : ${status.capitalizeFirst}",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: status == "pending" ? Colors.red : Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
