import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';

import '../controllers/test_score_controller.dart';

class TestScoreView extends GetView<TestScoreController> {
  const TestScoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TestScoreController());
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final ValueNotifier<String> ieltsCoaching = ValueNotifier<String>("Yes");
    final ValueNotifier<String> gmetCoaching = ValueNotifier<String>("Yes");
    final ValueNotifier<String> ieltsScore = ValueNotifier<String>("Academics");
    final formKey = GlobalKey<FormState>();
    final overallController = TextEditingController();
    final actScoreController = TextEditingController();
    final satScoreController = TextEditingController();
    final gmatScoreController = TextEditingController();
    final greScoreController = TextEditingController();
    final lowestBandController = TextEditingController();
    return Scaffold(
      appBar: buildAppBar("Test Score"),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              buildStepper(1.0, 3, "complete").marginOnly(left: 10, right: 10),
              20.heightBox,
              "IELTS Score".text.make().marginOnly(left: 10),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ValueListenableBuilder(
                  valueListenable: ieltsScore,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            ieltsScore.value = "Academics";
                            log("ieltsScore: " + ieltsScore.value);
                          },
                          child: Row(
                            children: [
                              Icon(
                                ieltsScore.value == "Academics"
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: themeColor,
                              ),
                              const SizedBox(width: 8),
                              const Text("Academics"),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ieltsScore.value = "General";
                            log("ieltsCoaching: " + ieltsScore.value);
                          },
                          child: Row(
                            children: [
                              Icon(
                                ieltsScore.value == "General"
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: themeColor,
                              ),
                              const SizedBox(width: 8),
                              const Text("General"),
                            ],
                          ),
                        ),
                        const SizedBox.shrink()
                      ],
                    );
                  },
                ),
              ),
              20.heightBox,
              buildField(
                title: "Overall",
                hint: "Enter here",
                controller: overallController,
              ),
              buildField(title: "Lowest BAND", hint: "Enter here"),
              "Are you interested in IELTS coaching ?"
                  .text
                  .make()
                  .marginOnly(left: 10),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ValueListenableBuilder(
                  valueListenable: ieltsCoaching,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            ieltsCoaching.value = "Yes";
                            log("ieltsScore: " + ieltsCoaching.value);
                          },
                          child: Row(
                            children: [
                              Icon(
                                ieltsCoaching.value == "Yes"
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: themeColor,
                              ),
                              const SizedBox(width: 8),
                              const Text("Yes"),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ieltsCoaching.value = "No";
                            log("ieltsCoaching: " + ieltsCoaching.value);
                          },
                          child: Row(
                            children: [
                              Icon(
                                ieltsCoaching.value == "No"
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: themeColor,
                              ),
                              const SizedBox(width: 8),
                              const Text("No"),
                            ],
                          ),
                        ),
                        const SizedBox.shrink()
                      ],
                    );
                  },
                ),
              ),
              20.heightBox,
              buildField(
                title: "ACT score",
                hint: "Enter here",
                controller: actScoreController,
              ),
              buildField(
                title: "SAT score",
                hint: "Enter here",
                controller: satScoreController,
              ),
              "Are you interested in GMAT/GRE coaching ?"
                  .text
                  .make()
                  .marginOnly(left: 10),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ValueListenableBuilder(
                  valueListenable: gmetCoaching,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            gmetCoaching.value = "Yes";
                            log("gmetCoaching: " + gmetCoaching.value);
                          },
                          child: Row(
                            children: [
                              Icon(
                                gmetCoaching.value == "Yes"
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: themeColor,
                              ),
                              const SizedBox(width: 8),
                              const Text("Yes"),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            gmetCoaching.value = "No";
                            log("gmetCoaching: " + gmetCoaching.value);
                          },
                          child: Row(
                            children: [
                              Icon(
                                gmetCoaching.value == "No"
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: themeColor,
                              ),
                              const SizedBox(width: 8),
                              const Text("No"),
                            ],
                          ),
                        ),
                        const SizedBox.shrink()
                      ],
                    );
                  },
                ),
              ),
              20.heightBox,
              buildField(
                title: "GMAT Score",
                hint: "Enter here",
                controller: gmatScoreController,
              ),
              buildField(
                title: "GRE Score",
                hint: "Enter here",
                controller: greScoreController,
              ),
              40.heightBox,
              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return ButtonPrimary(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading.value = true;
                        FocusManager.instance.primaryFocus?.unfocus();
                        try {
                          await controller.addTestScore(
                            actScore: actScoreController.text,
                            gmatScore: gmatScoreController.text,
                            greScore: greScoreController.text,
                            ieltsScore: ieltsScore.value,
                            interestedInGMATCoaching: gmetCoaching.value,
                            interestedInIELTSCoaching: ieltsCoaching.value,
                            lowestBand: lowestBandController.text,
                            overall: overallController.text,
                            satScore: satScoreController.text,
                          );
                        } catch (e) {
                          log("$e");
                        } finally {
                          isLoading.value = false;
                        }
                      }
                      // Get.toNamed(Routes.MAIN);
                    },
                    title: "Find Universities",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
