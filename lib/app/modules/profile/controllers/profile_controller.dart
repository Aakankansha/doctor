import 'dart:convert';

import 'package:clear_vikalp_app/app/modules/profile/model/family_member_model.dart';
import 'package:clear_vikalp_app/util/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  var familyList = <UsermembersList>[].obs;
  Future<List<dynamic>> getFamilyList() async {
    List list = [];
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}Home_health_care/user_member_fetch'));
    request.fields.addAll({'user_id': '10'});

    http.StreamedResponse response = await request.send();
    var body = await response.stream.bytesToString();
    print(body);
    if (response.statusCode == 200) {
      list = jsonDecode(body)['usermembers_list'] as List<dynamic>;

      familyList.value = list.map((e) => UsermembersList.fromJson(e)).toList();
      return familyList;
    } else {
      print(response.reasonPhrase);
    }
    return familyList;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    getFamilyList();
  }
}
