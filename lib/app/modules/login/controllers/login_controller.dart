import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:clear_vikalp_app/app/modules/login/model/otp_model.dart';
import 'package:clear_vikalp_app/util/constant.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  OtpModel? otpModel;
  Future login({String? mobileNumber}) async {
    try {
      log("Loading...");
      const String pageUrl = "api/users/sendOtp";
      final body = {
        "mobile": "+91$mobileNumber",
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        body: body,
      );
      log(response.body);
      if (response.statusCode == 200) {
        otpModel = OtpModel.fromJson(jsonDecode(response.body));

        Future.delayed(Duration.zero);
        Get.toNamed(Routes.OTPVERIFY, arguments: Routes.MAIN);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    }
  }
}
