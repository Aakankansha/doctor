import 'package:get/get.dart';
import 'package:clear_vikalp_app/util/shared_pref.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  final duration = 3;
  var isLogin = false.obs;
  @override
  void onInit() {
    super.onInit();
    String tokens = SharedMemory().getToken();
    Future.delayed(const Duration(seconds: 4), () {
      isLogin.value = true;
      Future.delayed(Duration(seconds: duration), () {
        Get.toNamed(Routes.LOGIN);
      });
    });
  }

  void increment() => count.value++;
}
