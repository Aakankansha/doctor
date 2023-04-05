import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:clear_vikalp_app/app/modules/main/views/main_view.dart';

import '../../../../util/constant.dart';

class FeedbackController extends GetxController {
  Future submitFeedback({
    String? feedback,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "api/support/feedback";
      final header = {"Authorization": "Bearer $token"};
      final body = {
        "feedback": "$feedback",
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
        body: body,
      );
      if (response.statusCode == 200) {
        log(response.body);
        Get.snackbar(
          "Success",
          "Feedback submitted",
        );
        Get.off(() => const MainView());
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
