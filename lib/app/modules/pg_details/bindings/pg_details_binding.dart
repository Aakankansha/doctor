import 'package:get/get.dart';

import '../controllers/pg_details_controller.dart';

class PgDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PgDetailsController>(
      
      () => PgDetailsController(),
      fenix: true
    );
  }
}
