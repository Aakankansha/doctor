import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/main/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class WhatAreYouLookingScreen extends StatelessWidget {
  const WhatAreYouLookingScreen({super.key});
  onTapRadios() {
    Get.to(() => const MainView());
    Get.snackbar("Welcome To  Clear Vikalp", "Thank You For Choosing Us",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.black,
        colorText: Colors.white,
        margin: const EdgeInsets.all(20),
        borderRadius: 20,
        snackStyle: SnackStyle.FLOATING,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        mainButton: TextButton(
          onPressed: () {
            Get.back();
          },
          child: "OK".text.white.make(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: "Welcome to Clear Vikalp".text.white.bold.xl.make(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/lady-doctor-checking-patient-2496307-2093272.png",
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              "What are you looking for?".text.xl.bold.make(),
              const Spacer(),
              "Close"
                  .text
                  .white
                  .bold
                  .size(12)
                  .make()
                  .pSymmetric(
                    h: 20,
                    v: 6,
                  )
                  .box
                  .withRounded()
                  .color(themeColor)
                  .make()
                  .onTap(() {
                Get.to(() => const MainView());
              }),
            ],
          ).pSymmetric(
            h: 20,
          ),
          const Divider(
            color: Colors.black12,
          ).pSymmetric(
            h: 20,
          ),
          RadioListTile(
            value: 1,
            groupValue: 0,
            onChanged: (value) {
              onTapRadios();
            },
            title: "OPD Booking".text.make(),
          ),
          RadioListTile(
            value: 2,
            groupValue: 1,
            onChanged: (value) {
              onTapRadios();
            },
            title: "Blood Investigation Booking".text.make(),
          ),
          RadioListTile(
            value: 3,
            groupValue: 1,
            onChanged: (value) {
              onTapRadios();
            },
            title: "Imaging (CT/USG etc)".text.make(),
          ),
          RadioListTile(
            value: 4,
            groupValue: 1,
            onChanged: (value) {
              onTapRadios();
            },
            title: "Surgery".text.make(),
          ),
          RadioListTile(
            value: 5,
            groupValue: 1,
            onChanged: (value) {
              onTapRadios();
            },
            title: "Home Health Service".text.make(),
          ),
        ],
      ),
    );
  }
}
