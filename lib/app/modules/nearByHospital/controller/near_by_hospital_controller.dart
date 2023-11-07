import 'package:clear_vikalp_app/app/modules/home/controllers/home_controller.dart';
import 'package:clear_vikalp_app/app/modules/profile/model/family_member_model.dart';
import 'package:clear_vikalp_app/util/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NearByHospitalController extends GetxController {
  var selectedDepart = {}.obs;
  var selectedFamilyMember = UsermembersList().obs;
  var selectedBookingTime = "Morning".obs;
  String date = "";

  addToNearByHospital({
    required String docId,
    required String departId,
    required String hospitalId,
  }) async {
    var selectBookingId = "";
    if (selectedBookingTime == "Morning") {
      selectBookingId = "1";
    } else if (selectedBookingTime == "Afternoon") {
      selectBookingId = "2";
    } else if (selectedBookingTime == "Evening") {
      selectBookingId = "3";
    } else if (selectedBookingTime == "Anytime") {
      selectBookingId = "4";
    }
    HomeController c = Get.find();
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/service/addtocarthospital'));
    request.fields.addAll({
      'user_id': c.currentProfileData.value.id.toString(),
      'member_id': selectedFamilyMember.value.id.toString(),
      'doctor_id': docId,
      'department_id': departId,
      'hospital_id': hospitalId,
      'booking_date': date,
      'booking_time': selectBookingId
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  dynamic getDepartSearch(List listOfDepartment) {
    return listOfDepartment
        .where((element) => element['id']
            .toString()
            .toLowerCase()
            .contains(selectedDepart['id'].toString().toLowerCase()))
        .toList();
  }
}
