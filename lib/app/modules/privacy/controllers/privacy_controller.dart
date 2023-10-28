import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';

class PrivacyController extends GetxController {
  var privacyModel;
  Future<void> privacyNote({
    String? feedback,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "Auth/privacy_policy_fetch";

      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
      );
      if (response.statusCode == 200) {
        log(response.body);
        privacyModel = json.decode(response.body)['privacy_policy'][0]
            ["privacy_policy_content"];
      } else {
        Get.snackbar("Error", response.body);
        log(response.body);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    }
  }
}
