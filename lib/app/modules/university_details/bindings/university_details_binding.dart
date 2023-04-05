import 'package:get/get.dart';

import '../controllers/university_details_controller.dart';

class UniversityDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UniversityDetailsController>(
      () => UniversityDetailsController(),
    );
  }
}
