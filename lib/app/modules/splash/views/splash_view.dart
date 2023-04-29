import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Padding(
            padding: const EdgeInsets.all(12.0),
            child: controller.isLogin.value
                ? Center(
                    child: FadeIn(
                      duration: const Duration(seconds: 2),
                      child: Image.asset("assets/images/first_screen.png"),
                    ),
                  )
                : Center(
                    child: FadeIn(
                      duration: const Duration(seconds: 2),
                      child: Image.asset("assets/images/test.jpg"),
                    ),
                  )),
      ),
    );
  }
}
