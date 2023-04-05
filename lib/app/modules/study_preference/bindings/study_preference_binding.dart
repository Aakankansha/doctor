import 'package:get/get.dart';

import '../controllers/study_preference_controller.dart';

class StudyPreferenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudyPreferenceController>(
      () => StudyPreferenceController(),
    );
  }
}
