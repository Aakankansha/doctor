import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';

import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({Key? key}) : super(key: key);

  final List<PageViewModel> lists = [
    PageViewModel(
        image: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  left: -150,
                  top: -40,
                  child: Image.asset(
                    "assets/images/circle.png",
                    height: 240,
                  )),
              Image.asset("assets/images/splash1.png"),
            ],
          ),
        ),
        title: "Find Trusted Doctors",
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        body:
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old."),
    PageViewModel(
        image: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  right: -150,
                  top: -40,
                  child: Image.asset(
                    "assets/images/circle.png",
                    height: 240,
                  )),
              Image.asset("assets/images/splash2.png"),
            ],
          ),
        ),
        title: "Choose Best Doctors",
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        body: "We will help you achieve your study abroad goals"),
    PageViewModel(
        image: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                  left: -150,
                  top: -40,
                  child: Image.asset(
                    "assets/images/circle.png",
                    height: 240,
                  )),
              Image.asset("assets/images/splash3.png"),
            ],
          ),
        ),
        title: "Easy Appointments",
        decoration: const PageDecoration(
            titleTextStyle:
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        body: "Bringing like-minded people together is our goal"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      isTopSafeArea: true,
      isBottomSafeArea: true,
      pages: lists,
      globalBackgroundColor: Colors.white,
      onDone: () {},
      onChange: (index) {
        controller.currentPage.value = index;
      },
      dotsDecorator: const DotsDecorator(activeColor: themeColor),
      showBackButton: false,
      showSkipButton: true,
      showNextButton: true,
      globalFooter: Obx(() {
        return controller.currentPage.value == 2
            ? Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: ButtonPrimary(
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  title: "Get Started",
                ),
              )
            : "".text.make();
      }),
      next: "Next"
          .text
          .white
          .make()
          .pOnly(left: 15, right: 15, top: 5, bottom: 5)
          .box
          .rounded
          .color(themeColor)
          .make(),
      skip: "Skip".text.color(themeColor).make(),
      overrideDone: ButtonPrimary(onPressed: () {}, title: "Get Started"),
      showDoneButton: false,
    ));
  }
}
