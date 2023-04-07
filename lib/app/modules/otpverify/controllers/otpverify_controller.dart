import 'dart:convert';
import 'dart:developer';

import 'package:clear_vikalp_app/app/modules/login/views/login_view.dart';
import 'package:clear_vikalp_app/app/modules/main/views/main_view.dart';
import 'package:clear_vikalp_app/app/modules/otpverify/model/user_model.dart';
import 'package:clear_vikalp_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';

class OtpverifyController extends GetxController {
  OtpUserModel? userModel;
  Future verifyOtp({String? mobileNumber, String? otpCode}) async {
    try {
      log("Loading...");
      log("$mobileNumber");
      const String pageUrl = "Auth/verify_otp";
      final body = {
        "mobile": "$mobileNumber",
        "otp": "$otpCode",
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        body: body,
      );

      if (response.statusCode == 200) {
        log(response.body);
        userModel = OtpUserModel.fromJson(jsonDecode(response.body));
        Future.delayed(Duration.zero);

        SharedMemory().setToken(userModel!.token.toString());
        token = userModel!.token.toString();
        Get.to(() => const MainView());
      } else if (response.statusCode == 400) {
        Get.snackbar(
          "Error",
          "Invalid OTP",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        Get.to(() => const LoginView());
      } else {}
    } on Exception {}
  }
}
