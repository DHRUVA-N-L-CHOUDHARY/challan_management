import 'package:challan_management/app/modules/record_detail/controllers/record_detail_controller.dart';
import 'package:challan_management/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecordDetailView extends StatelessWidget {
  final String orderno;
  final String orderKey;
  final String status;
  final String locationname;
  final String paymentmethod;
  final double amount;
  final String product;
  final String bookingDate;
  const RecordDetailView(
      {super.key,
      required this.orderno,
      required this.orderKey,
      required this.status,
      required this.locationname,
      required this.paymentmethod,
      required this.amount,
      required this.product,
      required this.bookingDate});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecordDetailController>(
        init: RecordDetailController(),
        builder: (c) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: c.secondaryColor,
              iconTheme: IconThemeData(color: c.primaryColor),
              title: Text(
                "Order Details",
                style: TextStyle(fontSize: 20, color: c.primaryColor),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Image.asset(
                      appConst + AppImages.kAppIconUnnamed,
                      height: 120.h,
                      width: 120.w,
                    ),
                    Center(
                      child: Text(
                        'Record details',
                        style: TextStyle(
                            fontSize: 20.0.sp,
                            decoration: TextDecoration.underline),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(vertical: 8.0.dg),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         'Record ID #$orderno',
                    //         style: TextStyle(
                    //           color: c.secondaryColor,
                    //           fontSize: 16.0.sp,
                    //         ), 
                    //       ),
                    //       Text(
                    //         status.capitalizeFirst.toString(),
                    //         style: TextStyle(
                    //           color: c.secondaryColor,
                    //           fontSize: 16.0.sp,
                    //         ), // White text, larger font
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // Order details table

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(vertical: 8.0).dg,
                    //       child: Text(
                    //         'Product',
                    //         style: TextStyle(
                    //           color: c.secondaryColor,
                    //           fontSize: 16.0,
                    //         ), // White text, larger font
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(vertical: 8.0).dg,
                    //       child: Text(
                    //         product,
                    //         style: TextStyle(
                    //           color: c.primaryColor,
                    //           fontSize: 16.0,
                    //         ), // White text, larger font
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0).dg,
                          child: Text(
                            'Record Date',
                            style: TextStyle(
                              color: c.secondaryColor,
                              fontSize: 16.0,
                            ), // White text, larger font
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0).dg,
                          child: Text(
                            bookingDate,
                            style: TextStyle(
                              color: c.secondaryColor,
                              fontSize: 16.0,
                            ), // White text, larger font
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Total Amount',
                            style: TextStyle(
                              color: c.secondaryColor,
                              fontSize: 16.0,
                            ), // White text, larger font
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "${NumberFormat('#,##0.00').format(amount)}",
                            style: TextStyle(
                              color: c.secondaryColor,
                              fontSize: 16.0,
                            ), // White text, larger font
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment Type',
                          style: TextStyle(
                            color: c.secondaryColor,
                            fontSize: 16.0,
                          ), // White text, larger font
                        ),
                        Text(
                          paymentmethod.capitalizeFirst.toString(),
                          style: TextStyle(
                            color: c.secondaryColor,
                            fontSize: 16.0,
                          ), // White text, larger font
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Location Name',
                            style: TextStyle(
                              color: c.secondaryColor,
                              fontSize: 16.0,
                            ), // White text, larger font
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            width: Get.width / 2,
                            child: Text(
                              locationname,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: c.secondaryColor,
                                fontSize: 16.0,
                              ), // White text, larger font
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       'Location Address',
                    //       style: TextStyle(
                    //         color: kPrimaryBlue,
                    //         fontSize: 16.0,
                    //       ), // White text, larger font
                    //     ),
                    //     Text(
                    //       locationaddress,
                    //       style: TextStyle(
                    //         color: kPrimaryBlue,
                    //         fontSize: 16.0,
                    //       ), // White text, larger font
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 5.0),
                    // // ... (rest of the code remains the same)
                  ],
                ),
              ),
            ),
          );
        });
  }
}
