import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:clear_vikalp_app/app/modules/privacy/model/privacy_model.dart';

import '../../../../util/constant.dart';

class PrivacyController extends GetxController {
  PrivacyModel? privacyModel;
  Future<PrivacyModel?> privacyNote({
    String? feedback,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "api/support/privacy-policy";
      final header = {"Authorization": "Bearer $token"};
      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
      );
      if (response.statusCode == 200) {
        log(response.body);
        privacyModel = PrivacyModel.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar("Error", response.body);
        log(response.body);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    }
    return privacyModel;
  }
}
