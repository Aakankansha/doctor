import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:clear_vikalp_app/app/modules/profile/views/profile_view.dart';

import '../../../../util/constant.dart';

class EditProfileController extends GetxController {
  Future editProfile({
    String? name,
    String? email,
    String? mobile,
    String? educationDetails,
    String? subject,
    String? collegeName,
    String? specialization,
    String? expectedScore,
    String? engTestScore,
    String? aptitudeTestScore,
    File? profile,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "api/users/me";
      final header = {
        "Authorization": "Bearer $token",
      };
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(baseUrl + pageUrl),
      );
      request.headers.addAll(header);
      profile == null
          ? null
          : request.files.add(http.MultipartFile(
              "profile",
              File(profile.path).readAsBytes().asStream(),
              File(profile.path).lengthSync(),
              filename: "profile picture",
            ));

      request.fields.addAll({
        "name": "$name",
        "email": "$email",
        "mobile": "$mobile",
        "educationDetails": "$educationDetails",
        "subject": "$subject",
        "collegeName": "$collegeName",
        "specialization": "$specialization",
        "expectedScore": "$expectedScore",
        "engTestScore": "$engTestScore",
        "aptitudeTestScore": "$aptitudeTestScore",
      });
      final response = await request.send();
      if (response.statusCode == 200) {
        Get.snackbar("Update", "Profile updated");
        Get.off(const ProfileView());
      }
    } on Exception catch (e) {
      log("Exception: $e");
      Get.snackbar("Error", "$e");
    } catch (e) {
      log("Error: $e");
    }
    return null;
  }
}
