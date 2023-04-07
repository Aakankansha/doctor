import 'dart:developer';

import 'package:clear_vikalp_app/util/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

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
      log(response.body);
      if (response.statusCode == 200) {
        mobile = mobileNumber.toString();
        Future.delayed(Duration.zero);
        Get.toNamed(Routes.OTPVERIFY, arguments: Routes.MAIN);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    }
  }
}
