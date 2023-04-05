import 'package:clear_vikalp_app/app/modules/home/views/review_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class LabDescriptionScreen extends StatefulWidget {
  const LabDescriptionScreen({super.key});

  @override
  State<LabDescriptionScreen> createState() => _LabDescriptionScreenState();
}

class _LabDescriptionScreenState extends State<LabDescriptionScreen> {
  bool isInstruction = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            backgroundColor: themeColor,
            title: const Text(
              'Lab Test Name',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/image.png',
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Lab Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              VxRating(
                                count: 5,
                                onRatingUpdate: (value) {},
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                '4.5',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.info_outlined,
                                color: Colors.black45,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            '1st Floor, Maitri ICON,  Ganesh Mandir Open 24 hours',
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3.6 km Away',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Near Station Kalwa',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                20.heightBox,
                "Lab Test Name".text.xl2.make(),
                10.heightBox,
                "Description:".text.xl.make(),
                5.heightBox,
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                    .text
                    .make(),
                10.heightBox,
                "Test Report:".text.xl.make(),
                5.heightBox,
                "Lorem Ipsum is simply  scrambled it to make a type specimen book."
                    .text
                    .make(),
                20.heightBox,
                Row(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.healing_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Test Includes',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                        .pSymmetric(
                          h: 20,
                          v: 10,
                        )
                        .box
                        .color(isInstruction ? Vx.gray400 : themeColor)
                        .withRounded()
                        .make()
                        .onTap(() {
                      setState(() {
                        isInstruction = false;
                      });
                    }).expand(),
                    10.widthBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Test Instructions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                        .pSymmetric(
                          h: 20,
                          v: 10,
                        )
                        .box
                        .color(!isInstruction ? Vx.gray400 : themeColor)
                        .withRounded()
                        .make()
                        .onTap(() {
                      setState(() {
                        isInstruction = true;
                      });
                    }).expand(),
                  ],
                ),
                20.heightBox,
                isInstruction
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          "Test Instructions".text.xl.bold.make(),
                          10.heightBox,
                          "1.Get Enough sleep,at least 6 hours 24 hours,prior to the checkup"
                              .text
                              .make(),
                          10.heightBox,
                          "2.Avoid strenuous exercise 24 hours prior to the checkup"
                              .text
                              .make(),
                          10.heightBox,
                          "3.Avoid alcohol 24 hours prior to the checkup"
                              .text
                              .make(),
                          10.heightBox,
                          "4.Avoid smoking 24 hours prior to the checkup"
                              .text
                              .make(),
                          10.heightBox,
                          "5.Avoid caffeine 24 hours prior to the checkup"
                              .text
                              .make(),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          "Test Includes".text.xl.bold.make(),
                          10.heightBox,
                          "1.Cholesterol Test".text.make(),
                          10.heightBox,
                          "2.Urine Routine Test".text.make(),
                          10.heightBox,
                          "3.Chest X-Ray Test".text.make(),
                        ],
                      ),
              ]),
        ),
        bottomSheet: SizedBox(
                height: 70,
                width: double.infinity,
                child: Row(
                  children: [
                    10.widthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.heightBox,
                        "Test Name".text.xl2.white.make(),
                        "₹ 1500".text.xl.white.make(),
                      ],
                    ),
                    const Spacer(),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            10.widthBox,
                            "Book Now".text.xl2.bold.white.make(),
                          ],
                        ),
                      )
                          .box
                          .color(themeColor2)
                          .withRounded(value: 30)
                          .make()
                          .onTap(() {
                        bool isProceed = false;
                        bool isSelf = false;
                        TextEditingController dateController =
                            TextEditingController();
                        Get.bottomSheet(
                          StatefulBuilder(builder: (context, set) {
                            return isProceed == true
                                ? Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        "Your booking Lab Consultation for"
                                            .text
                                            .xl2
                                            .bold
                                            .make(),
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
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                      /// use `colorScheme: ` for more
                                                      // date picker dialogBackground color in simple case
                                                      dialogBackgroundColor:
                                                          Colors.white,
                                                      timePickerTheme:
                                                          TimePickerTheme.of(
                                                                  context)
                                                              .copyWith(
                                                        //background color of time picker
                                                        backgroundColor: Colors
                                                            .lightBlueAccent,
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
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
                                              minimumSize: const Size(
                                                  double.infinity, 50),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              set(() {
                                                isProceed = false;
                                              });
                                              Get.back();
                                              Get.to(() =>
                                                  const ReviewOrderScreen());
                                            },
                                            child: "Proceed".text.white.make()),
                                        10.heightBox,
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        "Booking for ?".text.xl2.bold.make(),
                                        10.heightBox,
                                        Wrap(
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
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
                                                    : themeColor
                                                        .withOpacity(0.1))
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
                                                    : themeColor
                                                        .withOpacity(0.1))
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
                                              minimumSize: const Size(
                                                  double.infinity, 50),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                      }),
                    ),
                  ],
                ))
            .pSymmetric(h: 10, v: 2)
            .box
            .topRounded()
            .color(themeColor)
            .make());
  }
}
