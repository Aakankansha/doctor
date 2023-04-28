import 'dart:developer';

import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../signup/views/signup_view.dart';
import '../controllers/otpverify_controller.dart';

class OtpverifyView extends GetView<OtpverifyController> {
  const OtpverifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpTimerButtonController c = OtpTimerButtonController();

    final formKey = GlobalKey<FormState>();
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final otpController = Get.put(LoginController());
    final otpPinController = TextEditingController();
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: buildAppBar("Verification"),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "A 4 digit code sent to your number".text.gray500.make(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loginController.mobile.text.gray500.make(),
                10.widthBox,
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: "edit".text.color(themeColor).make(),
                )
              ],
            ),
            Center(
              child: Image.asset(
                "assets/images/otp.png",
                height: 25.h,
              ),
            ),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
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
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                "Didn't receive the code?".text.black.make(),
                10.widthBox,
                OtpTimerButton(
                  buttonType: ButtonType.text_button,
                  controller: c,
                  onPressed: () {
                    c.startTimer();
                    controller.resendOtp(loginController.mobile);
                  },
                  text: const Text('Resend OTP'),
                  duration: 30,
                ),
              ],
            ),
            30.heightBox,
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
                              // Get.to(() => const MainView());
                              Get.to(() => const SignupView());
                              // await controller.verifyOtp(
                              //   mobileNumber: loginController.mobile,
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
