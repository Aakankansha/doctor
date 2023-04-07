import 'package:clear_vikalp_app/app/modules/main/model/user_model.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainController extends GetxController {
  late final PersistentTabController persistentTabController;
  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    persistentTabController = PersistentTabController(initialIndex: 4);
  }

  UserModel? userModel;
  // Future<UserModel?> getUserInfo({

  // }) async {
  //   try {
  //     final box = GetStorage();
  //     log("Loading...");
  //     const String pageUrl = "Auth/profile_fetch";

  //     final response = await http.post(
  //       Uri.parse(baseUrl + pageUrl),
  //users_id
  //       headers: header,
  //     );
  //     if (response.statusCode == 200) {
  //       log("User: ${response.body}");
  //       userModel = UserModel.fromJson(jsonDecode(response.body));
  //     } else {
  //       log(response.body);
  //       Get.snackbar("Error", response.body);
  //     }
  //   } on Exception catch (e) {
  //     log("$e");
  //     Get.snackbar("Error", "$e");
  //   } catch (e) {
  //     log("$e");
  //   }
  //   return userModel;
  // }
}
