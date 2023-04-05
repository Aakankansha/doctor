import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/login/controllers/login_controller.dart';

import '../../signup/views/signup_view.dart';
import '../controllers/otpverify_controller.dart';

class OtpverifyView extends GetView<OtpverifyController> {
  const OtpverifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final otpController = Get.put(LoginController());
    final otpPinController = TextEditingController();
    return Scaffold(
      appBar: buildAppBar("Verification"),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "A 5 digit code sent to your number".text.gray500.make(),
            Row(
              children: [
                "123456798".text.gray500.make(),
                10.widthBox,
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: "edit".text.color(themeColor).make(),
                )
              ],
            ),
            20.heightBox,
            // Text(
            //   "OTP: ${otpController.otpModel!.otp}",
            //   style: TextStyle(
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PinCodeTextField(
                // validator: (value) {
                //   if (value!.contains(RegExp(r'[a-z]')) ||
                //       value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ||
                //       value.contains(RegExp(r'[A-Z]'))) {
                //     return 'OTP can only be digits';
                //   } else if (value.length == 5) {
                //     return null;
                //   } else if (value.isEmpty) {
                //     return "Enter OTP";
                //   } else if (value != otpController.otpModel!.otp) {
                //     return 'Incorrect OTP';
                //   }
                //   return null;
                // },
                appContext: context,
                length: 5,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                onAutoFillDisposeAction: AutofillContextAction.commit,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle,
                  selectedColor: Colors.red,
                  inactiveColor: Colors.grey,
                  fieldWidth: 7.h,
                  fieldHeight: 10.h,
                  borderRadius: BorderRadius.circular(10),
                  activeFillColor: Colors.white,
                ),
                controller: otpPinController,
                onCompleted: (v) {
                  log("Completed");
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: (value) {
                  log(value);
                },
                beforeTextPaste: (text) {
                  log("Allowing to paste $text");
                  return true;
                },
              ),
            ),
            80.heightBox,
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
                              Get.to(() => const SignupView());
                              // await controller.verifyOtp(
                              //   mobileNumber:
                              //       otpController.otpModel!.otpToSend!.mobile,
                              //   otpCode: otpPinController.text,
                              // );
                            } on Exception catch (e) {
                              log("$e");
                            } finally {
                              isLoading.value = false;
                            }
                          }
                        },
                        title: "VERIFY",
                      );
              },
            ),
          ],
        ).marginAll(10),
      ),
    );
  }

  Widget buildOTPField() {
    return const TextField(
            textAlign: TextAlign.center,
            maxLength: 1,
            decoration:
                InputDecoration(border: InputBorder.none, counterText: ""))
        .box
        .width(50)
        .height(50)
        .roundedFull
        .border(color: themeColor)
        .make();
  }
}