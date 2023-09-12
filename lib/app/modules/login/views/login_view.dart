import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../routes/app_pages.dart';
import '../../main/views/main_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController c = Get.put(LoginController());
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final mobileNumberController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              20.heightBox,
              Image.asset(
                "assets/images/login.png",
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  controller: mobileNumberController,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  validator: (value) {
                    if (value!.contains(RegExp(r'[a-z]')) ||
                        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ||
                        value.contains(RegExp(r'[A-Z]')) ||
                        value.length != 10) {
                      return 'Please enter valid mobile number';
                    } else {
                      return null;
                    }
                  },
                  autofillHints: const [AutofillHints.telephoneNumber],
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 240, 240, 240),
                    filled: true,
                    prefixIcon: const SizedBox(
                      width: 80,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Row(
                          children: [
                            Text("IN +91"),
                            Icon(Icons.keyboard_arrow_down_rounded),
                          ],
                        ),
                      ),
                    ),
                    hintText: "Mobile number",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 240, 240),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 240, 240),
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 240, 240),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 240, 240),
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 240, 240, 240),
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                  ),
                ),
              ),
              // buildMobileTextField(controller: mobileNumberController),
              10.heightBox,
              ValueListenableBuilder(
                valueListenable: isLoading,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return isLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : ButtonPrimary(
                          onPressed: () async {
                            Get.to(() => const MainView());
                            // if (formKey.currentState!.validate()) {
                            //   isLoading.value = true;
                            //   try {
                            //     // Get.toNamed(Routes.OTPVERIFY,
                            //     //     arguments: Routes.MAIN);
                            //     await controller.login(
                            //       mobileNumber: mobileNumberController.text,
                            //     );
                            //   } finally {
                            //     isLoading.value = false;
                            //   }
                            // }
                          },
                          title: "Login",
                        );
                },
              ),
              10.heightBox,
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "By registering you agree to".text.make(),
                      "Terms & Condition"
                          .text
                          .color(themeColor)
                          .make()
                          .onInkTap(() {
                        // Get.toNamed(Routes.SIGNUP);
                      }),
                    ],
                  ),
                  "of the Company".text.make(),
                ],
              ),
            ],
          ).w(double.infinity),
        ),
      )),
    );
  }

  // Widget buildMobileTextField({TextEditingController? controller}) {
  //   return Row(
  //     children: [
  //       10.widthBox,
  //       "IN +91".text.make(),
  //       5.widthBox,
  //       const Icon(Icons.keyboard_arrow_down_rounded),
  //       5.widthBox,
  //       TextFormField(
  //         validator: (value) {
  //           if (value!.contains(RegExp(r'[a-z]')) ||
  //               value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')) ||
  //               value.contains(RegExp(r'[A-Z]')) ||
  //               value.length != 10) {
  //             return 'Please enter valid mobile number';
  //           } else {
  //             return null;
  //           }
  //         },
  //         controller: controller,
  //         decoration: const InputDecoration(
  //           border: InputBorder.none,
  //           hintText: "Mobile number",
  //         ),
  //       ).expand()
  //     ],
  //   )
  //       .box
  //       .roundedSM
  //       .border(color: Vx.gray400)
  //       .margin(const EdgeInsets.all(10))
  //       .make();
  // }
}

class BuildBottomOption extends StatelessWidget {
  const BuildBottomOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            const VxDivider().expand(),
            " Or continue with ".text.gray500.make(),
            const VxDivider().expand()
          ],
        ).marginOnly(left: 50, right: 50),
        20.heightBox,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.widthBox,
            Image.asset(Assets.images.google.path, width: 14, height: 14),
            10.widthBox,
            "Login with google".text.size(12).color(themeColor).make(),
            10.widthBox
          ],
        ).p(5).box.border(color: themeColor).rounded.make(),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "Not a member? ".text.make(),
            "Register now".text.color(themeColor).make().onInkTap(() {
              Get.toNamed(Routes.SIGNUP);
            })
          ],
        ),
        20.heightBox,
      ],
    );
  }
}
