import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class PastPrescriptionScreeen extends GetView {
  const PastPrescriptionScreeen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: "Upload Prescription".text.white.size(20).bold.make(),
        elevation: 0,
        backgroundColor: themeColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: Vx.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Submit Past Prescription".text.size(18).bold.make(),
                5.heightBox,
                "Your prescription will be secured and stored with utmost confidentiality."
                    .text
                    .gray500
                    .make(),
                20.heightBox,
                Row(
                  children: [
                    "What is valid prescription?"
                        .text
                        .underline
                        .size(20)
                        .bold
                        .make(),
                    5.widthBox,
                    "ⓘ".text.size(20).make(),
                  ],
                ).onTap(() {
                  Get.dialog(Material(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Vx.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Valid prescription".text.bold.xl.make(),
                                  10.heightBox,
                                  "1. It should be written by Registered Medical Practitioner with date and time"
                                      .text
                                      .bold
                                      .make(),
                                  10.heightBox,
                                  "2. It should contain Name, Qualification and Registration no. of Medical Practitioner"
                                      .text
                                      .bold
                                      .make(),
                                  10.heightBox,
                                  "3. It should contain all patient details with doctor sign and stamp."
                                      .text
                                      .bold
                                      .make(),
                                  // 20.heightBox,
                                  // "If you have any doubts about the prescription, please contact your doctor."
                                  //     .text
                                  //     .bold
                                  //     .make(),
                                  20.heightBox,
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: themeColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: "Ok".text.white.make(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                }),
                20.heightBox,
                Center(
                  child: Image.asset(
                    "assets/images/image 1.png",
                    height: 300,
                  ),
                ),
                20.heightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Flexible(
                      child:
                          "I agree, the uploaded Prescription has been taken from registered medical practices and I will be solely responsible for its authenticity and validity."
                              .text
                              .black
                              .size(16)
                              .make(),
                    ),
                  ],
                ),
                30.heightBox,
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: themeColor,
                    ),
                    onPressed: () {
                      isLoading.value = true;
                      Future.delayed(const Duration(seconds: 2), () {
                        isLoading.value = false;
                        Get.back();
                      });
                    },
                    child: isLoading.value
                        ? const CircularProgressIndicator(
                            color: Vx.white,
                          )
                        : "Upload Prescription".text.white.make(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
