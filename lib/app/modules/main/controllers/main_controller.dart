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
}
