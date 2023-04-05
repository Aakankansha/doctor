import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';

import '../../../core/widgets/app_widgets.dart';
import '../../../routes/app_pages.dart';
import '../controllers/study_preference_controller.dart';

class StudyPreferenceView extends GetView<StudyPreferenceController> {
  const StudyPreferenceView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildNextButton().onInkTap(() {
        Get.toNamed(Routes.UG_DETAILS);
      }),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              "Study preference".text.size(18).bold.make().centered(),
              40.heightBox,
              buildStepper(0.3, 1, "Next: UG details"),
              40.heightBox,
              "What are you looking for ?".text.make(),
              Row(
                children: [
                  RadioListTile(
                          groupValue: 1,
                          value: 1,
                          activeColor: themeColor,
                          contentPadding: const EdgeInsets.all(5),
                          title: "UG/Bachelors".text.size(14).make(),
                          onChanged: (value) {})
                      .expand(),
                  RadioListTile(
                          groupValue: 1,
                          value: 2,
                          activeColor: themeColor,
                          contentPadding: const EdgeInsets.all(5),
                          title: "PG/Masters".text.size(14).make(),
                          onChanged: (value) {})
                      .expand()
                ],
              ),
              20.heightBox,
              "Country Preference".text.make(),
              10.heightBox,
              Row(
                children: [
                  "United States".text.gray500.make().expand(),
                  const Icon(Icons.keyboard_arrow_down_rounded)
                ],
              )
                  .p(10)
                  .box
                  .roundedSM
                  .border(color: Vx.gray400)
                  .make()
                  .onInkTap(() {
                showCountryPicker(
                  context: context,
                  showPhoneCode:
                      true, // optional. Shows phone code before the country name.
                  onSelect: (Country country) {},
                );
              }),
              20.heightBox,
              "Program Interest field".text.make(),
              10.heightBox,
              buildDropdownField("Lorem Ipsum").onInkTap(() {}),
            ],
          ).marginAll(10),
        ),
      ),
    );
  }
}
