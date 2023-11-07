import 'dart:convert';
import 'dart:developer';

import 'package:clear_vikalp_app/app/modules/aboutus/model/about_us_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';

class AboutusControllerDrawer extends GetxController {
  AboutUsModel? aboutUsModel;
  Future<AboutUsModel?> aboutUs({
    String? feedback,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "Auth/about_fetch";

      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
      );
      if (response.statusCode == 200) {
        log(response.body);
        aboutUsModel =
            AboutUsModel.fromJson(jsonDecode(response.body)["about_us"][0]);
      } else {
        Get.snackbar("Error", response.body);
        log(response.body);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    }
    return aboutUsModel;
  }
}
