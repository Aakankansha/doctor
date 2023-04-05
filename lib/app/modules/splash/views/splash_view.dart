import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.find();
    return Scaffold(
        body: Obx(
      () => controller.isLogin.value == false
          ? const Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: FadeIn(
                  duration: Duration(seconds: 2),
                  child: Text(
                      "Bringing Best Possible Healthcare Options on a Single Platform",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: themeColor,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            )
          : Center(
              child: FadeIn(
                duration: const Duration(seconds: 3),
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
    ));
  }
}
