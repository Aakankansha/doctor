import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:clear_vikalp_app/app/modules/study_preference/views/study_preference_view.dart';

import '../../../../util/constant.dart';

class SignupController extends GetxController {
  Future singUpUser({
    String? fullName,
    String? mobileNumber,
    String? emailAddress,
    String? password,
    String? confirmPassword,
    String? country,
    String? city,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "api/users/signUp";
      final body = {
        "fullName": "$fullName",
        "mobile": "$mobileNumber",
        "email": "$emailAddress",
        "password": "$password",
        "confirmPassword": "$confirmPassword",
        "country": "$country",
        "city": "$city"
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        body: body,
      );
      if (response.statusCode == 200) {
        log(response.body);
        Future.delayed(Duration.zero);
        Get.snackbar("Done", "Registered successfully");
        await Get.to(() => const StudyPreferenceView());
      } else {
        log(response.body);
        Get.snackbar("Error", response.body);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    }
  }
}
