import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import 'add_family_member.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDF9F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBottomPageTitle("Profile"),
            const VxDivider().marginOnly(top: 10, bottom: 10),
            Center(
              child: Stack(
                children: [
                  const Positioned(
                    bottom: 0,
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        value: 0.3,
                        strokeWidth: 8,
                        valueColor: AlwaysStoppedAnimation(themeColor),
                      ),
                    ),
                  ),
                  CircleAvatar(
                      radius: 50,
                      backgroundColor: themeColor,
                      child: InkWell(
                          onTap: () async {},
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/splash1.png"),
                              ),
                            ),
                            child: Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.black45,
                                  shape: BoxShape.circle,
                                ),
                                child: "30%"
                                    .text
                                    .size(14)
                                    .bold
                                    .white
                                    .makeCentered()),
                          ))),
                ],
              ),
            ),
            10.heightBox,
            "Complete Profile to avail all benefits"
                .text
                .color(themeColor)
                .makeCentered(),
            10.heightBox,
            buildOption(Icons.family_restroom, "Family Members").onInkTap(() {
              Get.to(() => const FamilyNemberList());
            }),
            buildOption(Icons.account_circle_sharp, "Edit Profile")
                .onInkTap(() {
              Get.toNamed(Routes.EDIT_PROFILE);
            }),
            buildOption(Icons.privacy_tip_outlined, "Privacy policy")
                .onInkTap(() {
              Get.toNamed(Routes.PRIVACY);
            }),
            buildOption(Icons.info_outline, "About us").onInkTap(() {
              Get.toNamed(Routes.ABOUTUS);
            }),
            buildOption(Icons.feedback_outlined, "Feedback").onInkTap(() {
              Get.toNamed(Routes.FEEDBACK);
            }),
            buildOption(Icons.rate_review_outlined, "Rate Us"),
            const Spacer(),
            "V 1.0.0".text.gray500.makeCentered(),
            20.heightBox,
          ],
        ).marginAll(10),
      ),
    );
  }

  Widget buildOption(IconData iconData, String title) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      tileColor: Vx.gray100,
      leading: Icon(
        iconData,
        size: 22,
        color: themeColor,
      ),
      title: title.text.size(15).make(),
    ).marginOnly(top: 10, bottom: 10);
  }
}
