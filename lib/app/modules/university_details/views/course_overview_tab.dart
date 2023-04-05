import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/gen/assets.gen.dart';

import '../../../routes/app_pages.dart';

class CourseOverviewTab extends StatelessWidget {
  const CourseOverviewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonSecondary(onPressed: () {}, title: "Apply").expand(),
            ButtonPrimary(
                    onPressed: () {
                      Get.toNamed(Routes.CONSULTATION);
                    },
                    title: "Get consultation")
                .expand()
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Description :".text.bold.make(),
            10.heightBox,
            Faker().lorem.sentences(5).join(" ").text.make().marginOnly(
                  left: 10,
                  right: 10,
                ),
            buildDivider(),
            buildCourseInfo(),
            buildDivider(),
            buildPreRequisties(),
            buildDivider(),
            buildAdmission(),
            buildDivider(),
            buildFeedback(),
          ],
        ).marginAll(10),
      ),
    );
  }

  Column buildFeedback() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Feedback :".text.bold.make(),
        10.heightBox,
        const VxTextField(
          hint: "Add your comment",
          enabled: false,
          fillColor: Vx.white,
        ).onInkTap(() {
          Get.toNamed(Routes.ADD_COMMENT);
        }),
        const VxDivider(
          color: Vx.gray500,
          width: 0.5,
        ),
        20.heightBox,
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(Assets.images.person.path),
                      10.widthBox,
                      "Cody Fisher".text.make()
                    ],
                  ),
                  Row(
                    children: [
                      VxRating(
                          isSelectable: false,
                          selectionColor: Vx.yellow500,
                          onRatingUpdate: (value) {}),
                      10.widthBox,
                      "1 month ago".text.gray400.make().expand()
                    ],
                  ),
                  10.heightBox,
                  Faker()
                      .lorem
                      .sentences(4)
                      .join(" ")
                      .text
                      .gray500
                      .size(14)
                      .make(),
                  10.heightBox
                ],
              );
            })
      ],
    );
  }

  Column buildAdmission() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Admission :".text.bold.make(),
        10.heightBox,
        Row(
          children: [
            "Application fee :".text.make().expand(),
            "Rs.46,000".text.make()
          ],
        ),
        10.heightBox,
        Row(
          children: [
            "Application Deadline :".text.make().expand(),
            "Jun 10,2023".text.make()
          ],
        ),
        15.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.open_in_new_rounded,
              color: themeColor,
            ),
            5.widthBox,
            "Application link".text.make()
          ],
        ),
      ],
    );
  }

  Column buildPreRequisties() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Pre-Requisities :".text.bold.make(),
        10.heightBox,
        "Min test score".text.size(14).make(),
        10.heightBox,
        Row(
          children: ["IELTS :".text.make(), 20.widthBox, "7".text.make()],
        ),
        10.heightBox,
        Row(
          children: ["TOEFL :".text.make(), 20.widthBox, "80".text.make()],
        ),
        15.heightBox,
        "Documents required".text.make(),
        10.heightBox,
        Faker().lorem.sentences(3).join(" ").text.gray500.make(),
      ],
    );
  }

  Column buildCourseInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "This course includes :".text.bold.make(),
        10.heightBox,
        "12 months duration".text.make(),
        10.heightBox,
        "Rs.46,000".text.make(),
        10.heightBox,
        "On campus education".text.make(),
        20.heightBox,
        buildLinks(),
      ],
    );
  }

  Row buildLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.open_in_new_rounded,
              color: themeColor,
            ),
            5.widthBox,
            "Course link".text.make()
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.open_in_new_rounded,
              color: themeColor,
            ),
            5.widthBox,
            "Tution link".text.make()
          ],
        )
      ],
    );
  }

  Widget buildDivider() => const VxDivider().marginOnly(top: 15, bottom: 15);
}
