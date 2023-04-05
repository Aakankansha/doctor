import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/gen/assets.gen.dart';

import '../controllers/trainer_details_controller.dart';

class TrainerDetailsView extends GetView<TrainerDetailsController> {
  const TrainerDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Details"),
      bottomNavigationBar: ButtonPrimary(
        title: "Book Appointment",
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildProfile().p(10),
            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    "Consultation fees".text.gray500.make(),
                    10.heightBox,
                    Row(
                      children: [
                        "\$33/min".text.red500.lineThrough.make(),
                        10.widthBox,
                        "\$30/min".text.make(),
                      ],
                    )
                  ],
                ).p(10),
                const Spacer(),
                const VxDivider(
                  type: VxDividerType.vertical,
                  color: Vx.gray300,
                ).h(60),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Mins of consultation".text.gray500.make(),
                    10.heightBox,
                    "665666 mins".text.make(),
                  ],
                ).p(10),
              ],
            )
                .box
                .border(color: Vx.gray300)
                .roundedSM
                .margin(const EdgeInsets.only(left: 10, right: 10))
                .make(),
            20.heightBox,
            "Skills".text.make(),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 50, crossAxisCount: 3),
                itemBuilder: (ctx, index) {
                  return "Lorem Ipsum"
                      .text
                      .size(12)
                      .white
                      .make()
                      .centered()
                      .box
                      .roundedSM
                      .color(themeColor)
                      .margin(const EdgeInsets.all(10))
                      .make();
                }),
            10.heightBox,
            "About me".text.make(),
            Faker().lorem.sentences(5).join(" ").text.gray500.make(),
            20.heightBox,
            "Customer Reviews".text.make(),
            10.heightBox,
            Row(
              children: [
                const Icon(
                  Icons.star,
                  size: 18,
                  color: Vx.yellow500,
                ),
                10.widthBox,
                "4.91 out of 5".text.make(),
              ],
            ),
            15.heightBox,
            ListView.builder(
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Vx.gray400, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: "Lorem Ipsum".text.make(),
                    subtitle: "June 7,2022".text.make(),
                    trailing: VxRating(
                      onRatingUpdate: (value) {},
                      selectionColor: Vx.yellow500,
                      isSelectable: false,
                    ),
                  ).marginAll(5);
                }))
          ],
        ).marginAll(10),
      ),
    );
  }

  Row buildProfile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(Assets.images.person.path),
        10.widthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            "Kristin Watson".text.make(),
            5.heightBox,
            Row(
              children: [
                "4.96".text.size(10).make(),
                5.widthBox,
                const Icon(
                  Icons.star,
                  size: 18,
                  color: Vx.yellow500,
                ),
                10.widthBox,
                "Exp 12 yrs".text.size(10).make(),
              ],
            ),
            5.heightBox,
            Row(
              children: ["Hindi, English".text.gray600.size(12).make()],
            )
          ],
        ).expand(),
        "Follow"
            .text
            .white
            .make()
            .paddingOnly(left: 15, right: 15, top: 5, bottom: 5)
            .box
            .color(themeColor)
            .roundedSM
            .make()
      ],
    );
  }
}
