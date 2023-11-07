import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../resources/app_resources.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: () {
              onPressed();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(themeColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
            child: title.text.white.make())
        .w(double.infinity)
        .h(50)
        .marginOnly(left: 20, right: 20, top: 10, bottom: 10);
  }
}

class ButtonSecondary extends StatelessWidget {
  const ButtonSecondary(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);
  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: () {
              onPressed();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Vx.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        side: const BorderSide(color: themeColor),
                        borderRadius: BorderRadius.circular(10)))),
            child: title.text.size(14).center.color(themeColor).make())
        .w(double.infinity)
        .h(50)
        .marginOnly(left: 20, right: 20, top: 10, bottom: 10);
  }
}

AppBar buildAppBar(String title) {
  return AppBar(
    title: title.text.black.bold.make(),
    centerTitle: true,
    elevation: 0,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Vx.black,
      ),
    ),
  );
}

Widget buildTextField({
  String? hint,
  bool isPassword = false,
  TextEditingController? controller,
  TextInputType? keyboardType
}) =>
    VxTextField(
      borderType: VxTextFieldBorderType.roundLine,
      controller: controller,
      keyboardType: keyboardType,

      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Field can not be empty";
        }
        return null;
      },
      borderColor: Vx.gray400,
      borderRadius: 10,
      hint: hint,
      isPassword: isPassword,
    ).marginAll(10);

Widget buildStepper(double value, int step, String next) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        height: 20,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: LinearProgressIndicator(
              value: value,
              valueColor: const AlwaysStoppedAnimation<Color>(themeColor),
              backgroundColor: Vx.hexToColor("#cdcdcd")),
        ),
      ),
      10.heightBox,
      Row(
        children: ["Step $step".text.make().expand(), next.text.gray500.make()],
      ),
    ],
  );
}

Widget buildNextButton() {
  return Row(children: [
    const Spacer(),
    "Next"
        .text
        .white
        .make()
        .pOnly(left: 40, right: 40, top: 10, bottom: 10)
        .box
        .roundedSM
        .color(themeColor)
        .make(),
    20.widthBox,
  ]).marginAll(10);
}

Widget buildDropdownField(String hint) {
  return Row(
    children: [
      hint.text.gray500.make().expand(),
      const Icon(Icons.keyboard_arrow_down_rounded)
    ],
  ).p(10).box.roundedSM.border(color: Vx.gray400).make();
}

Column buildField(
    {String? title, String? hint, TextEditingController? controller,TextInputType? keyboardType}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.make().marginOnly(left: 10),
      buildTextField(hint: hint, controller: controller,keyboardType: keyboardType),
      10.heightBox
    ],
  );
}

Widget buildBottomPageTitle(String title) =>
    title.text.bold.size(26).color(themeColor).make();
