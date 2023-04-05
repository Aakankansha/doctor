import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';

import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  const FeedbackView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedbackController());
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final feedbackController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppBar("Feedback"),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              "Send your feedback".text.make(),
              10.heightBox,
              "Tell us your honest feedback to help us improve"
                  .text
                  .gray500
                  .make(),
              20.heightBox,
              VxTextField(
                borderType: VxTextFieldBorderType.roundLine,
                borderRadius: 10,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return "Write a feedback";
                  }
                  return null;
                },
                onSubmitted: (v) async {
                  if (formKey.currentState!.validate()) {
                    isLoading.value = true;
                    try {
                      await controller.submitFeedback(
                        feedback: feedbackController.text,
                      );
                    } catch (e) {
                      log("$e");
                      Get.snackbar("Error", "$e");
                    } finally {
                      isLoading.value = false;
                    }
                  }
                },
                controller: feedbackController,
                borderColor: themeColor,
                maxLine: 10,
                clear: false,
                hint: "Write a feedback",
                textAlign: TextAlign.start,
              ),
              40.heightBox,
              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return isLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : ButtonPrimary(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              isLoading.value = true;
                              try {
                                await controller.submitFeedback(
                                  feedback: feedbackController.text,
                                );
                              } catch (e) {
                                log("$e");
                                Get.snackbar("Error", "$e");
                              } finally {
                                isLoading.value = false;
                              }
                            }
                          },
                          title: "Submit",
                        );
                },
              ),
            ],
          ).marginAll(10),
        ),
      )),
    );
  }
}
