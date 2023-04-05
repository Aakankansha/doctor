import 'package:get/get.dart';

import '../controllers/upload_prescription_controller.dart';

class UgDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadPrescriptionController>(
      () => UploadPrescriptionController(),
    );
  }
}
