import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../util/constant.dart';
import '../../test_score/views/test_score_view.dart';

class PgDetailsController extends GetxController {
  Future pgRegistration({
    String? board10School,
    String? board10Percentage,
    String? board10Year,
    String? board12School,
    String? board12Percentage,
    String? board12Year,
    String? subject,
    String? bachelorUniversityName,
    String? bachelorDegree,
    String? bachelorPercentage,
    String? bachelorYearOfPassing,
    String? masterUniversityName,
    String? masterDegree,
    String? masterPercentage,
    String? masterYearOfPassing,
    String? masterSubject,
  }) async {
    try {
      log("Loading...");
      const String pageUrl = "api/users/pg-details";
      final header = {
        "Authorization": "Bearer $token",
      };
      final body = {
        "lookingFor": "pg/masters",
        "country": "India",
        "programInterested": "PG program",
        "matrixBoard": "$board10School",
        "matrixPercentage": board10Percentage,
        "matrixPassingYear": board10Year,
        "intermediateBoard": "$board12School",
        "intermediatePercentage": board12Percentage,
        "intermediatePassingYear": board12Year,
        "intermediateSubject": "$subject",
        "bachelorUniversityName": "$bachelorUniversityName",
        "bachelorDegree": "$bachelorDegree",
        "bachelorPercentage": bachelorPercentage,
        "bachelorYearOfPassing": bachelorYearOfPassing,
        "masterUniversityName": "$masterUniversityName",
        "masterDegree": "$masterDegree",
        "masterPercentage": masterPercentage,
        "masterYearOfPassing": masterYearOfPassing,
        "masterSubject": "$masterSubject"
      };
      final response = await http.post(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
        body: body,
      );
      if (response.statusCode == 200) {
        log(response.body);
        Get.snackbar("Success", "PG Details Added");
        Get.to(() => const TestScoreView());
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
