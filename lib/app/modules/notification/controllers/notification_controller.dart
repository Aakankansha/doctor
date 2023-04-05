import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';

class NotificationController extends GetxController {
  List notification = [];
  Future callNotifications() async {
    try {
      log("Loading...");
      const String pageUrl = "api/users/notifications";
      final header = {
        "Authorization": "Bearer $token",
      };
      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
      );
      log(response.body);
      if (response.statusCode == 200) {
        if (response.body == "no notifications found") {
          notification = [];
        }

        // aboutUsModel = AboutUsModel.fromJson(jsonDecode(response.body));
      } else {
        log(response.body);
        Get.snackbar("Error", response.body);
      }
    } on Exception catch (e) {
      log("$e");
      Get.snackbar("Error", "$e");
    } catch (e) {
      log("$e");
    }
    return null;
  }
}
