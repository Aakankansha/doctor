import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainController extends GetxController {
  late final PersistentTabController persistentTabController;
  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    persistentTabController = PersistentTabController(initialIndex: 4);
  }

  var userModel;
  Future<void> getUserInfo() async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://clearviklap.digitalnaman.com/api/index.php/Auth/profile_fetch'));
    request.fields.addAll({'users_id': '1'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      userModel = jsonDecode(res)["profile_details"][0];
    } else {
      print(response.reasonPhrase);
    }
  }
}
