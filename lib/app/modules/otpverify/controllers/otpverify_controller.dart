import 'dart:convert';
import 'dart:developer';

import 'package:clear_vikalp_app/app/modules/home/controllers/home_controller.dart';
import 'package:clear_vikalp_app/app/modules/login/views/login_view.dart';
import 'package:clear_vikalp_app/app/modules/main/views/main_view.dart';
import 'package:clear_vikalp_app/app/modules/otpverify/model/user_model.dart';
import 'package:clear_vikalp_app/app/modules/signup/views/signup_view.dart';
import 'package:clear_vikalp_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';

class OtpverifyController extends GetxController {
  UserModel userModel = UserModel();
  HomeController homeController = Get.put(HomeController());
  String userId = '';
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
      log(response.body);
      if (response.statusCode == 200) {
        log(response.body);
        var data = json.decode(response.body);
        if (data["verify_status"] == 1) {
          userModel = UserModel.fromJson(data["user"]);
          homeController.currentUserModel.value = userModel;
          log(userModel.userId.toString());
          SharedMemory().setUserId(userModel.id!);

          Get.to(() => const MainView());
        } else {
          Get.to(() => const SignupView());
        }
      } else if (response.statusCode == 401) {
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

  resendOtp(mobile) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}Auth/resend_otp'));
    request.fields.addAll({'mobile': mobile});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      Get.snackbar(
        "Success",
        "OTP sent successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      print(response.reasonPhrase);
    }
  }
}
