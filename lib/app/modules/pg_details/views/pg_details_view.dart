import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/widgets/app_widgets.dart';
import '../controllers/pg_details_controller.dart';

class PgDetailsView extends GetView<PgDetailsController> {
  const PgDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     final controller = Get.put(PgDetailsController());
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final formKey = GlobalKey<FormState>();
    final board10SchoolController = TextEditingController();
    final board10PercentageController = TextEditingController();
    final board10YearController = TextEditingController();
    final board12SchoolController = TextEditingController();
    final board12PercentageController = TextEditingController();
    final board12YearController = TextEditingController();
    final subjectController = TextEditingController();
    final bachelorDegreeController = TextEditingController();
    final bachelorPercentageController = TextEditingController();
    final bachelorUniversityNameController = TextEditingController();
    final bachelorYearOfPassingController = TextEditingController();
    final masterDegreeController = TextEditingController();
    final masterPercentageController = TextEditingController();
    final masterSubjectController = TextEditingController();
    final masterUniversityNameController = TextEditingController();
    final masterYearOfPassingController = TextEditingController();
    return Scaffold(
      appBar: buildAppBar("PG details"),
      // bottomNavigationBar: buildNextButton().onInkTap(() {
      //   Get.toNamed(Routes.TEST_SCORE);
      // }),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildStepper(0.8, 2, "Next: Test scores").marginAll(10),
              20.heightBox,
              buildField(
                title: "10th Board",
                hint: "Enter here",
                controller: board10SchoolController,
              ),
              buildField(
                title: "10th class percentage",
                hint: "Enter here",
                controller: board10PercentageController,
              ),
              buildField(
                title: "Year of passing",
                hint: "Enter here",
                controller: board10YearController,
              ),
              buildField(
                title: "12th Board",
                hint: "Enter here",
                controller: board12SchoolController,
              ),
              buildField(
                title: "12th class percentage",
                hint: "Enter here",
                controller: board12PercentageController,
              ),
              buildField(
                title: "Year of passing",
                hint: "Enter here",
                controller: board12YearController,
              ),
              buildField(
                title: "Subject",
                hint: "Lorem Ipsum",
                controller: subjectController,
              ),
              buildField(
                title: "University name",
                hint: "Enter here",
                controller: bachelorUniversityNameController,
              ),
              buildField(
                title: "Bachelors degree",
                hint: "Enter here",
                controller: bachelorDegreeController,
              ),
              buildField(
                title: "Percentage",
                hint: "Enter here",
                controller: bachelorPercentageController,
              ),
              buildField(
                title: "Year of passing",
                hint: "Enter here",
                controller: bachelorYearOfPassingController,
              ),
              buildField(
                title: "Master’s degree",
                hint: "Enter here",
                controller: masterDegreeController,
              ),
              buildField(
                title: "Percentage",
                hint: "Enter here",
                controller: masterPercentageController,
              ),
              buildField(
                title: "University name",
                hint: "Enter here",
                controller: masterUniversityNameController,
              ),
              buildField(
                title: "Year of passing",
                hint: "Enter here",
                controller: masterYearOfPassingController,
              ),
              buildField(
                title: "Master Subject",
                hint: "Enter here",
                controller: masterSubjectController,
              ),
              20.heightBox,
              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return isLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : buildNextButton().onInkTap(() async {
                          if (formKey.currentState!.validate()) {
                            isLoading.value = true;
                            try {
                              await controller.pgRegistration(
                                board10School: board10SchoolController.text,
                                board10Percentage:
                                    board10PercentageController.text,
                                board10Year: board10YearController.text,
                                board12School: board12SchoolController.text,
                                board12Percentage:
                                    board12PercentageController.text,
                                board12Year: board12YearController.text,
                                subject: subjectController.text,
                                bachelorDegree: bachelorDegreeController.text,
                                bachelorPercentage:
                                    bachelorPercentageController.text,
                                bachelorUniversityName:
                                    bachelorUniversityNameController.text,
                                bachelorYearOfPassing:
                                    bachelorYearOfPassingController.text,
                                masterDegree: masterDegreeController.text,
                                masterPercentage:
                                    masterPercentageController.text,
                                masterSubject: masterSubjectController.text,
                                masterUniversityName:
                                    masterUniversityNameController.text,
                                masterYearOfPassing:
                                    masterYearOfPassingController.text,
                              );
                              // Get.toNamed(Routes.TEST_SCORE);
                            } catch (e) {
                              Get.snackbar("Error", "$e");
                              log("$e");
                            } finally {
                              isLoading.value = false;
                            }
                          }
                        });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
