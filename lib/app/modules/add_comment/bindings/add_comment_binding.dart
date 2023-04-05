import 'package:get/get.dart';

import '../controllers/add_comment_controller.dart';

class AddCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCommentController>(
      () => AddCommentController(),
    );
  }
}
