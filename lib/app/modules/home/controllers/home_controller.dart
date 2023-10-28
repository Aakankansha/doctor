import 'dart:convert';
import 'dart:developer';

import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/edit_profile/models/profile.dart';
import 'package:clear_vikalp_app/app/modules/home/views/geoLocation.dart';
import 'package:clear_vikalp_app/app/modules/otpverify/model/user_model.dart';
import 'package:clear_vikalp_app/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../../../../util/shared_pref.dart';
import '../../upload_prescription/views/past_prescription_screen.dart';
import '../../upload_prescription/views/upload_cashback_prescription_screen.dart';
import '../../upload_prescription/views/upload_prescription_screen.dart';

class HomeController extends GetxController {
  var currentProfileData = ProfileModel().obs;
  var currentUserModel = UserModel().obs;
  var walletBal = 0.0.obs;
  final count = 0.obs;
  onTapRadios(value) {
    Get.back();
    getDialogFeedback(value);
    Get.snackbar("Welcome To  Clear Vikalp", "Thank You For Choosing Us",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: const EdgeInsets.all(20),
        borderRadius: 20,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        mainButton: TextButton(
          onPressed: () {
            Get.back();
          },
          child: "OK".text.white.make(),
        ));
  }

  showPaymentDialogSuccess() {
    double value = 10;
    Get.dialog(Material(
      child: StatefulBuilder(builder: (context, set) {
        return Center(
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/correct (2) 9.png",
                          height: 70,
                        ),
                        10.heightBox,
                        "Payment Successful".text.bold.xl2.make(),
                        10.heightBox,
                        "Thank you for choosing Clear Vikalp.".text.bold.make(),
                        10.heightBox,
                        "your ODP has been booked and you would received an confirmation for the same."
                            .text
                            .center
                            .make()
                            .paddingAll(12),
                        10.heightBox,
                        "Order Id: 1231231440000".text.xl2.make(),
                        10.heightBox,
                        "Rate Us".text.bold.xl2.make(),
                        10.heightBox,
                        VxRating(
                          stepInt: true,
                          value: value,
                          onRatingUpdate: (v) {
                            value = double.parse(v);
                          },
                          size: 30,
                        ),
                        10.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: themeColor,
                            ),
                            onPressed: () {
                              Get.back();
                              Get.back();
                              Get.back();
                              Get.back();
                            },
                            child: "OK".text.white.make(),
                          ),
                        ),
                        10.heightBox,
                        "How to get cashback?"
                            .text
                            .white
                            .xl
                            .color(themeColor)
                            .bold
                            .makeCentered()
                            .onTap(() {
                          Get.back();
                          Get.back();
                          Get.back();
                          Get.back();
                          showCashback();
                        }),
                        10.heightBox,
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      }),
    ));
  }

  showCashback() {
    Get.dialog(Material(
      child: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/Group 11092.png",
                        fit: BoxFit.cover,
                      ),
                      20.heightBox,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: themeColor,
                          ),
                          onPressed: () {
                            Get.to(() => const UploadPresCashbackScreeen());
                          },
                          child: "Get Cashback".text.white.make(),
                        ),
                      ),
                      10.heightBox,
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }

  showUploadPrescription() {
    Get.dialog(
      Material(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          const Spacer(),
                          const Spacer(),
                          "Steps to Upload Prescription "
                              .text
                              .black
                              .bold
                              .xl
                              .make(),
                          const Spacer(),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ).pSymmetric(
                        h: 20,
                      ),
                      Image.asset(
                        "assets/images/image 8.png",
                        fit: BoxFit.cover,
                        height: 180,
                      ),
                      "1.Click Your Photo and then upload"
                          .text
                          .black
                          .bold
                          .xl
                          .make(),
                      Image.asset(
                        "assets/images/image 9.png",
                        fit: BoxFit.cover,
                        height: 180,
                      ),
                      "2.Will Notify you".text.black.bold.xl.make(),
                      30.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          10.widthBox,
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: themeColor,
                              ),
                              onPressed: () {
                                Get.back();
                                Get.to(() => const UploadPrescriptionScreeen());
                              },
                              child: "New Prescription".text.white.make(),
                            ),
                          ),
                          20.widthBox,
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: themeColor,
                              ),
                              onPressed: () {
                                Get.back();
                                Get.to(() => const PastPrescriptionScreeen());
                              },
                              child: "Past Prescription".text.white.make(),
                            ),
                          ),
                          10.widthBox,
                        ],
                      ),
                      30.heightBox,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.8),
    );
  }

  showLookingForDialog() {
    Get.dialog(Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    10.heightBox,
                    Row(
                      children: [
                        "What are you looking for?".text.xl.bold.make(),
                        const Spacer(),
                        "Close"
                            .text
                            .white
                            .bold
                            .size(12)
                            .make()
                            .pSymmetric(
                              h: 20,
                              v: 6,
                            )
                            .box
                            .withRounded()
                            .color(themeColor)
                            .make()
                            .onTap(() {
                          Get.back();
                        }),
                      ],
                    ).pSymmetric(
                      h: 20,
                    ),
                    Image.asset(
                      "assets/images/popup.png",
                      fit: BoxFit.cover,
                      height: Get.height * 0.17,
                    ),
                    const Divider(
                      color: Colors.black12,
                    ).pSymmetric(
                      h: 20,
                    ),
                    RadioListTile(
                      value: 1,
                      groupValue: 0,
                      onChanged: (value) {
                        onTapRadios("OPD Booking");
                      },
                      title: "OPD Booking".text.make(),
                    ),
                    RadioListTile(
                      value: 2,
                      groupValue: 1,
                      onChanged: (value) {
                        onTapRadios("Blood Investigation Booking");
                      },
                      title: "Blood Investigation Booking".text.make(),
                    ),
                    RadioListTile(
                      value: 3,
                      groupValue: 1,
                      onChanged: (value) {
                        onTapRadios("Imaging (CT/USG etc)");
                      },
                      title: "Imaging (CT/USG etc)".text.make(),
                    ),
                    RadioListTile(
                      value: 4,
                      groupValue: 1,
                      onChanged: (value) {
                        onTapRadios("Surgery");
                      },
                      title: "Surgery".text.make(),
                    ),
                    RadioListTile(
                      value: 5,
                      groupValue: 1,
                      onChanged: (value) {
                        onTapRadios("Home Health Service");
                      },
                      title: "Home Health Service".text.make(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  getProfileData() async {
    String userId = SharedMemory().getUserId();
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}Auth/profile_fetch'));
    request.fields.addAll({'users_id': userId});

    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString();
    log(res);
    if (response.statusCode == 200) {
      var data = json.decode(res);
      currentProfileData.value =
          ProfileModel.fromJson(data['profile_details'][0]);
    } else {
      print(response.reasonPhrase);
    }
  }

  getWalletData() async {
    String userId = SharedMemory().getUserId();
    print("user id is $userId");
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}Wallet/wallet_fetch'));
    request.fields.addAll({'user_id': "1"});

    http.StreamedResponse response = await request.send();
    String res = await response.stream.bytesToString();
    log(res);
    if (response.statusCode == 200) {
      var data = json.decode(res);
      walletBal.value = double.parse(data['wallet_details'][0]['amount']);
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void onReady() {
    GeoDistance distance = GeoDistance();
    distance.getUserLocation();
    getProfileData();
    getWalletData();
    Future.delayed(const Duration(seconds: 3), () {
      showLookingForDialog();
    });
    super.onReady();
  }

  void increment() => count.value++;

  getFeedbackTeamHome() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}Home_health_care/talk_team_enquiry'));
    request.fields.addAll({
      'user_id': currentProfileData.value.id!,
      'enq_name': currentProfileData.value.name!,
      'enq_number': currentProfileData.value.mobile!,
      'enq_mail': currentProfileData.value.email!,
      'enquiry_from': 'home_team'
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.dialog(Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                child: Card(
                  child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      20.heightBox,
                      "Thank you for Choosing Clear Vikalp".text.xl.bold.make(),
                      "Our team will contact on +91 1234567890".text.make(),
                      20.heightBox,
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(Get.width * 0.6, 40),
                              backgroundColor: themeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                          onPressed: () {
                            Get.back();
                          },
                          child: "Okay".text.white.make()),
                      20.heightBox,
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    } else {
      print(response.reasonPhrase);
    }
  }

  getDialogFeedback(value) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}Home_health_care/home_popup_enquiry'));
    request.fields.addAll({
      'user_id': currentProfileData.value.id!,
      'enq_name': currentProfileData.value.name!,
      'enq_number': currentProfileData.value.mobile!,
      'enq_mail': currentProfileData.value.email!,
      'service_name': value,
      'enquiry_from': 'home_popup'
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      log(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
