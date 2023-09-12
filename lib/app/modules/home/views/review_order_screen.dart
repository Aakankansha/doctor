import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class ReviewOrderScreen extends StatelessWidget {
  const ReviewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: themeColor,
            title: const Text(
              'Review Order',
              style: TextStyle(color: Colors.white),
            )),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        "Booked For".text.xl.white.make(),
                        10.heightBox,
                        const CircleAvatar(
                          radius: 26,
                          backgroundImage: NetworkImage(
                              "https://t4.ftcdn.net/jpg/01/82/22/03/360_F_182220324_QiTjkB3IPwx1zfNltFA4ww3dKQyYvVWB.jpg"),
                        ),
                        5.heightBox,
                        "Richa Tiwari".text.white.make(),
                        "(Self)".text.white.make(),
                      ],
                    ),
                    30.widthBox,
                    Container(
                      width: 2,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    30.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        "Schedule On".text.white.xl.make(),
                        10.heightBox,
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 38,
                        ),
                        20.heightBox,
                        "12/12/2021".text.white.make(),
                        5.heightBox,
                        "(Anytime)".text.white.make(),
                      ],
                    ),
                    const Spacer(),
                  ],
                )
                    .p8()
                    .box
                    .color(themeColor)
                    .withRounded()
                    .make()
                    .pSymmetric(h: 20),
                10.heightBox,
                "Add Address"
                    .text
                    .white
                    .makeCentered()
                    .pSymmetric(h: 40, v: 10)
                    .box
                    .width(double.infinity)
                    .withRounded(value: 6)
                    .color(themeColor)
                    .make()
                    .onTap(() {
                  Get.back();
                }),
                15.heightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Service: OPD Consultation ".text.xl.bold.make(),
                        "Dr. Raj Sharma".text.xl.bold.make(),
                        "Spine Surgeon".text.xl.make(),
                        "Nanavati hospital".text.xl.make(),
                        "Price ₹500".text.xl.bold.make(),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        const Icon(Icons.edit),
                        20.heightBox,
                        const Icon(Icons.delete),
                      ],
                    ),
                  ],
                )
                    .p8()
                    .box
                    .withRounded(value: 12)
                    .border(color: Colors.black26)
                    .make(),
                10.heightBox,
                // "Add More Services".text.xl.bold.make(),
                ElevatedButton(
                  onPressed: () {
                    Get.dialog(
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Card(
                                elevation: 0,
                                color: Colors.white,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      "ALLOW US TO GUIDE YOU",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                        .centered()
                                        .pSymmetric(h: 5, v: 10)
                                        .box
                                        .withRounded(value: 12)
                                        .width(double.infinity)
                                        .color(themeColor2)
                                        .make(),
                                    Image.asset("assets/images/step2.jpg"),
                                    5.heightBox,
                                    "Close"
                                        .text
                                        .white
                                        .make()
                                        .pSymmetric(h: 40, v: 5)
                                        .box
                                        .withRounded(value: 6)
                                        .color(themeColor)
                                        .make()
                                        .onTap(() {
                                      Get.back();
                                    }),
                                    5.heightBox,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    backgroundColor: themeColor2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: "How this will work...!!!"
                      .text
                      .white
                      .size(15)
                      .make()
                      .pSymmetric(h: 10, v: 8),
                ),

                Row(
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: themeColor2,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8),
                    //     ),
                    //   ),
                    //   child:
                    //       "Add More".text.white.make().pSymmetric(h: 20, v: 8),
                    // ).expand(),
                    // 10.widthBox,
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: "Save For Later"
                          .text
                          .white
                          .make()
                          .pSymmetric(h: 20, v: 8),
                    ).expand(),
                  ],
                ),
                10.heightBox,
                "Payment Details:".text.xl2.bold.make(),
                10.heightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Wallet Balance:".text.bold.make(),
                        "(Cashback Balance ₹ 300.75)".text.make(),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Checkbox.adaptive(value: false, onChanged: (v) {}),
                        "Use Wallet".text.bold.make(),
                      ],
                    ),
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    "Consultation Fee:".text.xl.make(),
                    const Spacer(),
                    "₹ 500".text.xl.make(),
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    "Taxes & GST:".text.xl.make(),
                    const Spacer(),
                    "₹ 26".text.xl.make(),
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    "Cashback:".text.xl.make(),
                    const Spacer(),
                    "-₹ 100".text.red400.xl.make(),
                  ],
                ),
                10.heightBox,
                Row(
                  children: [
                    "Total Amount:".text.bold.xl.make(),
                    const Spacer(),
                    "₹ 426".text.xl.bold.make(),
                  ],
                ),
                20.heightBox,
                Row(
                  children: [
                    "Apply Coupon".text.xl.bold.make().box.white.make(),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ).p4().box.roundedFull.color(themeColor).make(),
                  ],
                )
                    .p8()
                    .box
                    .border(
                      color: Colors.black26,
                      width: 1,
                    )
                    .withRounded(value: 8)
                    .make(),
                20.heightBox,
                Image.asset(
                  "assets/images/Banner.png",
                ),
                10.h.heightBox,
              ],
            ),
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {
                homeController.showPaymentDialogSuccess();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: themeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: "Confirm & Pay ₹526.5".text.xl.white.make()),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // floatingActionButton: Padding(
        //   padding: EdgeInsets.only(
        //     bottom: MediaQuery.of(context).size.height * 0.2,
        //   ),
        //   child: Stack(
        //     children: [
        //       Image.asset(
        //         "assets/images/cashback.png",
        //         height: 100,
        //       ),
        //       VxShimmer(
        //         primaryColor: Colors.white12,
        //         secondaryColor: Colors.black12,
        //         child: Image.asset(
        //           "assets/images/cashback.png",
        //           height: 100,
        //         ),
        //       ),
        //     ],
        //   ).onTap(() {
        //     homeController.showCashback();
        //   }),
        // ),
      ),
    );
  }
}
