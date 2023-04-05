import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:http/http.dart' as http;
import 'package:clear_vikalp_app/app/modules/main/model/user_model.dart';
import '../../../../util/constant.dart';

class MainController extends GetxController {
  late final PersistentTabController persistentTabController;
  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    persistentTabController = PersistentTabController(initialIndex: 4);
  }

  UserModel? userModel;
  Future<UserModel?> getUserInfo({
    String? feedback,
  }) async {
    try {
      final box = GetStorage();
      log("Loading...");
      const String pageUrl = "api/users/me";
      final header = {
        "Authorization": "Bearer $token",
      };
      final response = await http.get(
        Uri.parse(baseUrl + pageUrl),
        headers: header,
      );
      if (response.statusCode == 200) {
        log("User: ${response.body}");
        userModel = UserModel.fromJson(jsonDecode(response.body));
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
    return userModel;
  }
}
