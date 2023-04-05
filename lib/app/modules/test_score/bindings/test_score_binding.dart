import 'package:get/get.dart';

import '../controllers/test_score_controller.dart';

class TestScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestScoreController>(
      () => TestScoreController(),
    );
  }
}
