import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:clear_vikalp_app/app/modules/pg_details/views/pg_details_view.dart';

import '../../../../util/constant.dart';

class UploadPrescriptionController extends GetxController {
  Future ugRegistration({
    String? board10School,
    String? board10Percentage,
    String? board10Year,
    String? board12School,
    String? board12Percentage,
    String? board12Year,
    String? subject,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "api/users/ug-details";
      final header = {
        "Authorization": "Bearer $token",
      };
      final body = {
        "lookingFor": "ug/bachelors",
        "country": "India",
        "programInterested": "UG program",
        "matrixBoard": "$board10School",
        "matrixPercentage": board10Percentage!,
        "matrixPassingYear": board10Year!,
        "intermediateBoard": "$board12School",
        "intermediatePercentage": board12Percentage!,
        "intermediatePassingYear": board12Year!,
        "subject": "$subject",
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
        body: body,
      );
      if (response.statusCode == 200) {
        log(response.body);
        Get.snackbar("Success", "UG Details Added");
        Get.to(() => const PgDetailsView());
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
