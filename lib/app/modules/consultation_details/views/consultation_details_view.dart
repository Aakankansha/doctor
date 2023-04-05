import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../controllers/consultation_details_controller.dart';

class ConsultationDetailsView extends GetView<ConsultationDetailsController> {
  const ConsultationDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Counsultation"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildUniversityProfile(),
            20.heightBox,
            "Description: ".text.make(),
            10.heightBox,
            Faker().lorem.sentences(4).join(" ").text.gray500.make(),
            20.heightBox,
            "About consultation".text.make(),
            10.heightBox,
            Row(
              children: [
                Image.asset(Assets.images.person.path),
                10.widthBox,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  "Larray lobenee".text.make(),
                  "Exp : 21 years".text.gray500.make()
                ])
              ],
            ),
            10.heightBox,
            Faker().lorem.sentences(2).join(" ").text.gray500.make(),
            20.heightBox,
            "Schedule (duration 30 mins)".text.make(),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDate("Mon", "21"),
                buildDate("Tue", "22"),
                buildDate("Wed", "23"),
                buildDate("Fri", "24"),
              ],
            ),
            20.heightBox,
            "Meeting hours".text.make(),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildTime("9:00 Am"),
                buildTime("10:00 Am"),
                buildTime("11:00 Am")
              ],
            ),
            40.heightBox,
            ButtonPrimary(onPressed: () {}, title: "Book Appointment"),
            20.heightBox
          ],
        ).marginAll(10),
      ),
    );
  }

  Widget buildDate(String day, String date) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [day.text.gray500.make(), 10.heightBox, date.text.make()],
    ).p(10).box.border(color: Vx.gray400).roundedSM.make();
  }

  Widget buildTime(String time) {
    return time.text
        .make()
        .pOnly(left: 10, right: 10, top: 5, bottom: 5)
        .box
        .border(color: Vx.gray400)
        .roundedSM
        .make();
  }

  Row buildUniversityProfile() {
    return Row(
      children: [
        10.widthBox,
        Image.asset(
          Assets.images.university.path,
          width: 80,
          height: 80,
        ),
        10.widthBox,
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          "Cornell details".text.make(),
          5.heightBox,
          "MS in Data Science".text.gray400.make(),
          5.heightBox,
          "New york, United States".text.gray400.make(),
        ]).expand(),
        Column(
          children: [
            const Icon(
              Icons.favorite,
              color: themeColor,
            ),
            10.heightBox,
            const Icon(
              Icons.share,
              color: themeColor,
            )
          ],
        ),
        10.widthBox
      ],
    );
  }
}
