import 'dart:convert';
import 'dart:developer';

import 'package:clear_vikalp_app/util/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';
import '../../otpverify/controllers/otpverify_controller.dart';
import '../../signup/views/signup_view.dart';

class LoginController extends GetxController {
  var mobile = "";
  Future login({String? mobileNumber}) async {
    try {
      log("Loading...");
      const String pageUrl = "Auth/login_user";
      final body = {
        "mobile": "$mobileNumber",
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        body: body,
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        OtpverifyController c = Get.put(OtpverifyController());
        var data = json.decode(response.body);
        Get.toNamed(Routes.OTPVERIFY, arguments: Routes.MAIN);
        if (data["verify_status"] == "1") {
          mobile = mobileNumber.toString();
          Future.delayed(Duration.zero);
          Get.toNamed(Routes.OTPVERIFY, arguments: Routes.MAIN);
        } else {
          c.userId = data["user_id"];
          Get.to(() => const SignupView());
        }
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    }
  }
}
