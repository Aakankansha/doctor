import 'package:get/get.dart';

import '../controller/aboutus_controller_drawer.dart';


class AboutusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutusControllerDrawer>(
          () => AboutusControllerDrawer(),
    );
  }
}
