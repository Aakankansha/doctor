import 'package:clear_vikalp_app/app/modules/home/views/review_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key});

  final TextEditingController dateController = TextEditingController();
  bool isSelf = false;

  @override
  Widget build(BuildContext context) {
    getDialog() {
      bool isProceed = true;
      Get.bottomSheet(
        StatefulBuilder(builder: (context, set) {
          return isProceed != true
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Your booking OPD Consultation for".text.xl2.bold.make(),
                      "Dr. Raj Sharma".text.xl.bold.make(),
                      "Spine Surgeon".text.xl.make(),
                      "Nanavati hospital".text.xl.make(),
                      20.heightBox,
                      "Date for booking".text.xl.make(),
                      10.heightBox,
                      TextFormField(
                        controller: dateController,
                        readOnly: true,
                        onTap: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now().add(
                                const Duration(days: 60),
                              ),
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    /// use `colorScheme: ` for more
                                    // date picker dialogBackground color in simple case
                                    dialogBackgroundColor: Colors.white,
                                    timePickerTheme:
                                        TimePickerTheme.of(context).copyWith(
                                      //background color of time picker
                                      backgroundColor: Colors.lightBlueAccent,
                                    ),
                                  ),
                                  child: child!,
                                );
                              }).then((value) {
                            set(() {
                              dateController.text =
                                  " ${value!.day}/${value.month}/${value.year}";
                            });
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          hintText: "Select Date",
                        ),
                      ),
                      20.heightBox,
                      "Time for booking".text.xl.make(),
                      20.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: "Morning"
                                .text
                                .xl
                                .makeCentered()
                                .p12()
                                .box
                                .white
                                .withRounded(value: 6)
                                .make(),
                          ),
                          20.widthBox,
                          Expanded(
                            child: "Afternoon"
                                .text
                                .xl
                                .makeCentered()
                                .p12()
                                .box
                                .white
                                .withRounded(value: 6)
                                .make(),
                          ),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        children: [
                          Expanded(
                            child: "Evening"
                                .text
                                .xl
                                .makeCentered()
                                .p12()
                                .box
                                .white
                                .withRounded(value: 6)
                                .make(),
                          ),
                          20.widthBox,
                          Expanded(
                            child: "Anytime"
                                .text
                                .xl
                                .makeCentered()
                                .p12()
                                .box
                                .white
                                .withRounded(value: 6)
                                .make(),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            set(() {
                              isProceed = false;
                            });
                            Get.back();
                            Get.to(() => const ReviewOrderScreen());
                          },
                          child: "Proceed".text.white.make()),
                      10.heightBox,
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Booking for ?".text.xl2.bold.make(),
                      10.heightBox,
                      Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Column(
                            children: [
                              const CircleAvatar(
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    "https://t4.ftcdn.net/jpg/01/82/22/03/360_F_182220324_QiTjkB3IPwx1zfNltFA4ww3dKQyYvVWB.jpg"),
                              ),
                              5.heightBox,
                              "(Self)".text.gray500.make(),
                              "Richa Tiwari".text.make(),
                            ],
                          )
                              .p8()
                              .box
                              .withRounded()
                              .color(!isSelf
                                  ? Colors.transparent
                                  : themeColor.withOpacity(0.1))
                              .make()
                              .onTap(() {
                            set(() {
                              isSelf = true;
                            });
                          }),
                          20.widthBox,
                          Column(
                            children: [
                              const CircleAvatar(
                                radius: 26,
                                backgroundImage: NetworkImage(
                                    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2021/03/08/962158-nirmala-sitharaman-5.jpg"),
                              ),
                              5.heightBox,
                              "(Mother)".text.gray500.make(),
                              "Anaya Tiwari".text.make(),
                            ],
                          )
                              .p8()
                              .box
                              .withRounded()
                              .color(isSelf
                                  ? Colors.transparent
                                  : themeColor.withOpacity(0.1))
                              .make()
                              .onTap(() {
                            set(() {
                              isSelf = false;
                            });
                          }),
                          20.widthBox,
                          const CircleAvatar(
                            radius: 26,
                            backgroundColor: themeColor,
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeColor,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            set(() {
                              isProceed = true;
                            });
                          },
                          child: "Proceed".text.white.make()),
                      10.heightBox,
                    ],
                  ),
                );
        }),
        backgroundColor: Colors.white,
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: themeColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    "Health Checkup".text.bold.make(),
                    const Spacer(),
                    "₹ 500".text.bold.make(),
                  ],
                ),
                const SizedBox(height: 5),
                "Order ID: 123456789".text.make(),
                const SizedBox(height: 5),
                "Order Date: 12/12/2021".text.make(),
                const SizedBox(height: 5),
                Row(
                  children: [
                    "Order Status:".text.make(),
                    5.widthBox,
                    "In Progress".text.yellow600.make(),
                  ],
                ),
                const SizedBox(height: 10),
                Row(children: [
                  "View Details"
                      .text
                      .white
                      .makeCentered()
                      .box
                      .withRounded(value: 8)
                      .p8
                      .color(Colors.blue)
                      .make()
                      .expand(),
                  20.widthBox,
                  "Reschedule"
                      .text
                      .white
                      .makeCentered()
                      .box
                      .withRounded(value: 8)
                      .p8
                      .color(themeColor)
                      .make()
                      .expand(),
                ]),
                const SizedBox(height: 10),
                Row(
                  children: [
                    "Cancel Order"
                        .text
                        .white
                        .makeCentered()
                        .box
                        .withRounded(value: 8)
                        .p8
                        .color(themeColor2)
                        .make()
                        .onTap(() {
                      Get.dialog(
                        Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: const ColorScheme.light().copyWith(
                              primary: themeColor,
                            ),
                          ),
                          child: AlertDialog(
                            title: const Text("Cancel Order"),
                            content:
                                const Text("Do you want to reschedule Order?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  getDialog();
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).expand(),
                    20.widthBox,
                    "Rate & Review"
                        .text
                        .white
                        .makeCentered()
                        .box
                        .withRounded(value: 8)
                        .p8
                        .color(themeColor)
                        .make()
                        .expand(),
                  ],
                ),
              ],
            )
                .p8()
                .box
                .white
                .withRounded()
                .border(
                  color: Colors.grey[200]!,
                  width: 1,
                )
                .make(),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    "Health Checkup".text.bold.make(),
                    const Spacer(),
                    "₹ 500".text.bold.make(),
                  ],
                ),
                const SizedBox(height: 5),
                "Order ID: 123456789".text.make(),
                const SizedBox(height: 5),
                "Order Date: 12/12/2021".text.make(),
                const SizedBox(height: 5),
                Row(
                  children: [
                    "Order Status:".text.make(),
                    5.widthBox,
                    "Completed".text.green500.make(),
                  ],
                ),
                const SizedBox(height: 10),
                "View Details"
                    .text
                    .white
                    .makeCentered()
                    .box
                    .withRounded(value: 8)
                    .p8
                    .color(Colors.blue)
                    .make(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    "Reorder"
                        .text
                        .white
                        .makeCentered()
                        .box
                        .withRounded(value: 8)
                        .p8
                        .color(themeColor2)
                        .make()
                        .onTap(() {
                      getDialog();
                    }).expand(),
                    20.widthBox,
                    "Rate & Review"
                        .text
                        .white
                        .makeCentered()
                        .box
                        .withRounded(value: 8)
                        .p8
                        .color(themeColor)
                        .make()
                        .expand(),
                  ],
                ),
              ],
            )
                .p8()
                .box
                .white
                .withRounded()
                .border(
                  color: Colors.grey[200]!,
                  width: 1,
                )
                .make(),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
