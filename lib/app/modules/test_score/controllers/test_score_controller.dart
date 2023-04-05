import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';
import '../../main/views/main_view.dart';

class TestScoreController extends GetxController {
  Future addTestScore({
    String? ieltsScore,
    String? overall,
    String? interestedInIELTSCoaching,
    String? actScore,
    String? satScore,
    String? interestedInGMATCoaching,
    String? gmatScore,
    String? greScore,
    String? lowestBand,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "api/users/test-score-details";
      final header = {
        "Authorization": "Bearer $token",
      };
      final body = {
        "ieltsScore": "$ieltsScore",
        "overall": "$overall",
        "interestedInIELTSCoaching": "$interestedInIELTSCoaching",
        "actScore": "$actScore",
        "satScore": satScore,
        "interestedInGMATCoaching": "$interestedInGMATCoaching",
        "gmatScore": "$gmatScore",
        "greScore": "$greScore",
        "lowestBand": "$lowestBand"
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        log(response.body);
        Get.snackbar("Success", "Test Score Added");
        Get.to(() => const MainView());
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
