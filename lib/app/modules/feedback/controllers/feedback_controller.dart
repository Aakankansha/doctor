import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';

class FeedbackController extends GetxController {
  Future submitFeedback({
    String? feedback,
  }) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrl}Auth/feedback_save'));
      request.fields.addAll({
        'user_id': '1',
        'feedback': feedback ?? "feedback",
      });

      http.StreamedResponse response = await request.send();
      print(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        Get.back();
        Get.snackbar(
          "Feedback submitted",
          "Thank you for your feedback",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        print(response.reasonPhrase);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    }
  }
}
