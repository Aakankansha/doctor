import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/home/views/imaging_nearby_view.dart';
import 'package:clear_vikalp_app/app/modules/home/views/know_your_diet.dart';
import 'package:clear_vikalp_app/app/modules/home/views/lab_nearby_view.dart';
import 'package:clear_vikalp_app/app/modules/home/views/refund_status_screen.dart';
import 'package:clear_vikalp_app/app/modules/home/views/subscribtion.dart';
import 'package:clear_vikalp_app/app/modules/home/views/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:status_view/status_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';
import 'cart_screen.dart';
import 'earned_cashback_screen.dart';
import 'home_health_care.dart';
import 'hospital_nearby_view.dart';
import 'my_order_screen.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  var listOfServies = [
    "Hospital\nNearby you",
    "Lab\nNearby you",
    "Imaging Center\nNearby you",
    "Know your\nDiet",
    "Home Health\nCare",
    "Know your\nhealth",
  ];
  var listOfSubstitle = [
    "OPD Appointment",
    "Blood Checkup",
    "CT scan|USG|X-Ray",
    "Healthy Diet Plan",
    "Medical Needs at home",
    "Self Checkup",
  ];
  var listOfImages = [
    "assets/images/1881340.png",
    "assets/images/6401502.png",
    "assets/images/doctor-scanning-young-man-with-ultrasound-diagnostic-machine-4587252-3845873.png",
    "assets/images/706164.png",
    "assets/images/3035041.png",
    "assets/images/1523.png",
  ];

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
        key: _scaffoldkey,
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      5.heightBox,
                      Row(
                        children: [
                          StatusView(
                            radius: 26,
                            spacing: 15,
                            strokeWidth: 2,
                            indexOfSeenStatus: 1,
                            numberOfStatus: 4,
                            padding: 4,
                            centerImageUrl:
                                "https://images.contentstack.io/v3/assets/blt47c9d788546e10c2/blt3d0e316d0ae0c29f/633ecff007fc3813471f0108/AW_image39_1200x600.jpg?format=webply&quality=50",
                            seenColor: themeColor,
                            unSeenColor: Colors.black12,
                          ),
                          10.widthBox,
                          "Raj Kumar"
                              .text
                              .bold
                              .xl
                              .color(const Color(0xff0D0940))
                              .make(),
                          const Spacer(),
                          const Text(
                            '200',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.wallet,
                            size: 30,
                            color: themeColor,
                          ),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        children: [
                          "My Orders".text.bold.make(),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make()
                          .onTap(() {
                        Get.to(() => const MyOrderScreen());
                      }),
                      10.heightBox,
                      Row(
                        children: [
                          "Earned Cashback".text.bold.make(),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make()
                          .onTap(() {
                        Get.to(() => const EarnedCashbackScreen());
                      }),
                      10.heightBox,
                      Row(
                        children: [
                          "Subscription".text.bold.make(),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make()
                          .onTap(() {
                        Get.to(() => const SubscriptionScreen());
                      }),
                      10.heightBox,
                      Row(
                        children: [
                          "Transaction History".text.bold.make(),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make()
                          .onTap(() {
                        Get.to(() => const TransactionScreen());
                      }),
                      10.heightBox,
                      Row(
                        children: [
                          "Refund Status".text.bold.make(),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make()
                          .onTap(() {
                        Get.to(() => const RefundStatusScreen());
                      }),
                      10.heightBox,
                      Row(
                        children: [
                          "Comparative Analysis".text.bold.make(),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make(),
                      10.heightBox,
                      Row(
                        children: [
                          "Offers".text.bold.make(),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make(),
                      10.heightBox,
                      Row(
                        children: [
                          "Help Center".text.bold.make(),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                          ),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make(),
                      10.heightBox,
                      Row(
                        children: [
                          "Logout".text.red500.bold.make(),
                          const Spacer(),
                        ],
                      )
                          .p8()
                          .box
                          .white
                          .border(
                            color: Colors.black12,
                            width: 1,
                          )
                          .withRounded(value: 4)
                          .make(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xffF5F5F5),
        // bottomSheet: Material(
        //   color: Colors.white,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.only(
        //       topLeft: Radius.circular(16),
        //       topRight: Radius.circular(16),
        //     ),
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //       top: 10.0,
        //       bottom: 10,
        //       left: 10,
        //       right: 10,
        //     ),
        //     child: Container(
        //       decoration: const BoxDecoration(
        //         color: themeColor2,
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(16),
        //         ),
        //       ),
        //       height: 60,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           10.widthBox,
        //           Expanded(
        //             child: ListTile(
        //               dense: true,
        //               subtitle: "₹240.00".text.xl.white.make(),
        //               title: "Book X-Ray Scan".text.xl.bold.white.make(),
        //             ),
        //           ),
        //           10.widthBox,
        //           Row(
        //             children: [
        //               "Checkout".text.bold.xl2.white.make(),
        //               const Icon(
        //                 Icons.arrow_forward_ios,
        //                 color: Colors.white,
        //               )
        //             ],
        //           ),
        //           10.widthBox,
        //         ],
        //       ),
        //     ),
        //   ).onTap(() {
        //     Get.to(() => const CartScreen());
        //   }),
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: Row(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/cashback.png",
                  height: 100,
                ),
                VxShimmer(
                  primaryColor: Colors.white12,
                  secondaryColor: Colors.black12,
                  child: Image.asset(
                    "assets/images/cashback.png",
                    height: 100,
                  ),
                ),
              ],
            ).onTap(() {
              controller.showCashback();
            }),
            const Spacer(),
            Stack(
              children: [
                Image.asset(
                  "assets/images/Group 11080 (1).png",
                  height: 90,
                ),
                VxShimmer(
                  primaryColor: Colors.white12,
                  secondaryColor: Colors.black12,
                  child: Image.asset(
                    "assets/images/Group 11080 (1).png",
                    height: 90,
                  ),
                ),
              ],
            ).onTap(() {
              controller.showUploadPrescription();
            }).paddingOnly(
              bottom: 20,
            ),
            30.widthBox,
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.menu_rounded,
                        size: 30,
                      ).onTap(() {
                        _scaffoldkey.currentState!.openDrawer();
                      }),
                      const Spacer(),
                      const Spacer(),
                      Column(
                        children: [
                          "Location".text.size(8).white.make(),
                          "Vasai Road".text.white.bold.make(),
                        ],
                      )
                          .pSymmetric(h: 20, v: 2)
                          .box
                          .withRounded(value: 20)
                          .color(const Color.fromARGB(255, 75, 149, 122))
                          .make()
                          .onTap(() {}),
                      const Spacer(),
                      const Icon(
                        Icons.shopping_cart_outlined,
                        size: 35,
                        color: themeColor,
                      ).onTap(() {
                        Get.to(() => const CartScreen());
                      }),
                      15.widthBox,
                      StatusView(
                        radius: 22,
                        spacing: 15,
                        strokeWidth: 2,
                        indexOfSeenStatus: 1,
                        numberOfStatus: 4,
                        padding: 4,
                        centerImageUrl:
                            "https://images.contentstack.io/v3/assets/blt47c9d788546e10c2/blt3d0e316d0ae0c29f/633ecff007fc3813471f0108/AW_image39_1200x600.jpg?format=webply&quality=50",
                        seenColor: themeColor,
                        unSeenColor: Colors.black12,
                      ),
                    ],
                  ),
                  5.heightBox,
                  "Hello!".text.make(),
                  Row(
                    children: [
                      "Raj Kumar"
                          .text
                          .bold
                          .xl
                          .color(const Color(0xff0D0940))
                          .make(),
                      const Spacer(),
                      const Text(
                        '200',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: themeColor,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.wallet,
                        size: 30,
                        color: themeColor,
                      ),
                    ],
                  ),
                  5.heightBox,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Icon(
                        Icons.search,
                        color: Colors.black45,
                        size: 18.0,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        'Search for',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black45,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          animatedTexts: [
                            RotateAnimatedText('Hospital'),
                            RotateAnimatedText('Lab'),
                            RotateAnimatedText('Imaging Center'),
                            RotateAnimatedText('Symptom'),
                            RotateAnimatedText('Surgery'),
                          ],
                          onTap: () {},
                        ),
                      ),
                    ],
                  )
                      .box
                      .withRounded(value: 8)
                      .width(double.infinity)
                      .height(40)
                      .white
                      .make(),
                  8.heightBox,
                  SizedBox(
                    height: 240,
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 5,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Card(
                                color: index == 0
                                    ? const Color.fromARGB(255, 255, 235, 235)
                                    : index == 1
                                        ? const Color.fromARGB(
                                            255, 223, 243, 255)
                                        : index == 2
                                            ? const Color.fromARGB(
                                                255, 224, 250, 255)
                                            : index == 3
                                                ? const Color.fromARGB(
                                                    255, 246, 239, 255)
                                                : index == 4
                                                    ? const Color.fromARGB(
                                                        255, 235, 231, 255)
                                                    : index == 5
                                                        ? const Color.fromARGB(
                                                            255, 255, 234, 229)
                                                        : const Color.fromARGB(
                                                            255, 221, 255, 242),
                                elevation: 0,
                                child: Column(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Image.asset(
                                              listOfImages[index],
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Text(listOfServies[index],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 54, 54, 54),
                                                fontSize: 9,
                                                fontWeight: FontWeight.w500)),
                                        5.heightBox,
                                      ],
                                    ),
                                  ],
                                ),
                              ).onTap(() {
                                if (index == 0) {
                                  Get.to(() => const HospitalNearbyScreen());
                                } else if (index == 1) {
                                  Get.to(() => const LabNearbyScreen());
                                } else if (index == 4) {
                                  Get.to(
                                      () => const HomeHealthCareNearbyScreen());
                                } else if (index == 2) {
                                  Get.to(() => const ImagingNearbyScreen());
                                } else if (index == 3) {
                                  Get.to(() => const KnowYourDiet());
                                }
                              }).w(MediaQuery.of(context).size.width),
                              Flexible(
                                child: Text(listOfSubstitle[index],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 54, 54, 54),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.support_agent_rounded,
                                  color: Colors.white, size: 30),
                              10.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  "Talk to our team"
                                      .text
                                      .white
                                      .bold
                                      .size(12)
                                      .center
                                      .makeCentered(),
                                  "for your search"
                                      .text
                                      .white
                                      .bold
                                      .size(12)
                                      .center
                                      .makeCentered(),
                                  5.heightBox,
                                ],
                              ),
                              10.widthBox,
                            ],
                          )
                              .p4()
                              .box
                              .color(const Color.fromARGB(255, 0, 162, 236))
                              .withRounded()
                              .make()
                              .onTap(() {
                            Get.dialog(Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Material(
                                      child: Card(
                                        child: Center(
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                20.heightBox,
                                                "Thank you for Choosing Clear Vikalp"
                                                    .text
                                                    .xl
                                                    .bold
                                                    .make(),
                                                "Our team will contact on +91 1234567890"
                                                    .text
                                                    .make(),
                                                20.heightBox,
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            minimumSize: Size(
                                                                MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.6,
                                                                40),
                                                            backgroundColor:
                                                                themeColor,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            )),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: "Okay"
                                                        .text
                                                        .white
                                                        .make()),
                                                20.heightBox,
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                          }),
                        ),
                        10.widthBox,
                        Flexible(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.upload,
                                color: Colors.white, size: 28),
                            10.widthBox,
                            Column(
                              children: [
                                "Upload prescription"
                                    .text
                                    .white
                                    .bold
                                    .center
                                    .size(12)
                                    .makeCentered(),
                                "And we assist you"
                                    .text
                                    .white
                                    .size(12)
                                    .center
                                    .bold
                                    .makeCentered(),
                                5.heightBox,
                              ],
                            ),
                            10.widthBox,
                          ],
                        )
                                .p4()
                                .box
                                .color(const Color.fromARGB(255, 224, 127, 0))
                                .withRounded()
                                .make()
                                .onTap(() {
                          controller.showUploadPrescription();
                        })),
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 120,
                      viewportFraction: 0.8,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Image.asset('assets/images/Group 11077.png'),
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      "Surgery".text.bold.size(14).make(),
                      const Spacer(),
                    ],
                  ),
                  10.heightBox,
                  Image.asset(
                    'assets/images/Group 11083.png',
                    width: 100.w,
                  ),
                  10.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/Banner.png',
                          width: 100.w,
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: "Subscribe"
                              .text
                              .color(themeColor)
                              .bold
                              .size(12)
                              .makeCentered()
                              .box
                              .width(80)
                              .height(25)
                              .color(Colors.white)
                              .withRounded()
                              .make(),
                        ),
                      ],
                    ),
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      "Search By Symptoms".text.bold.size(14).make(),
                      const Spacer(),
                      "View More"
                          .text
                          .size(8)
                          .white
                          .make()
                          .pSymmetric(h: 10, v: 5)
                          .box
                          .withRounded(
                            value: 16,
                          )
                          .color(themeColor)
                          .make(),
                    ],
                  ),
                  10.heightBox,
                  Image.asset(
                    'assets/images/Group 11034 (2).png',
                    width: 100.w,
                  ),
                  30.heightBox,
                  Row(
                    children: [
                      "Screen Your Organ Function".text.bold.size(14).make(),
                      const Spacer(),
                      "View More"
                          .text
                          .size(8)
                          .white
                          .make()
                          .pSymmetric(h: 10, v: 5)
                          .box
                          .withRounded(
                            value: 16,
                          )
                          .color(themeColor)
                          .make(),
                    ],
                  ),
                  10.heightBox,
                  Image.asset(
                    'assets/images/Group 11078 (1).png',
                    width: 100.w,
                  ).onTap(() {
                    Get.to(() => const HospitalNearbyScreen());
                  }),
                  20.heightBox,
                  Image.asset(
                    'assets/images/Group 11099.png',
                  )
                      .pSymmetric(
                    h: 8,
                    v: 10,
                  )
                      .onTap(() {
                    Get.to(() => const HospitalNearbyScreen());
                  }),
                  20.heightBox,
                  Row(
                    children: [
                      "Search Diagnostic Center by\ncommon Procedure"
                          .text
                          .bold
                          .size(14)
                          .make(),
                      const Spacer(),
                      "View More"
                          .text
                          .size(8)
                          .white
                          .make()
                          .pSymmetric(h: 10, v: 5)
                          .box
                          .withRounded(
                            value: 16,
                          )
                          .color(themeColor)
                          .make(),
                    ],
                  ),
                  10.heightBox,
                  Image.asset(
                    'assets/images/Group 11079 (2).png',
                    width: 100.w,
                  ).onTap(() {
                    Get.to(() => const HospitalNearbyScreen());
                  }),
                  20.heightBox,
                  Row(
                    children: [
                      "Get Screening for your Eyes".text.bold.size(14).make(),
                      const Spacer(),
                      "View More"
                          .text
                          .size(8)
                          .white
                          .make()
                          .pSymmetric(h: 10, v: 5)
                          .box
                          .withRounded(
                            value: 16,
                          )
                          .color(themeColor)
                          .make(),
                    ],
                  ),
                  10.heightBox,
                  Image.asset(
                    'assets/images/Group 11081.png',
                    width: 100.w,
                  ),
                  20.heightBox,
                  Row(
                    children: [
                      "Get Your Dental Screened".text.bold.size(14).make(),
                      const Spacer(),
                      "View More"
                          .text
                          .size(8)
                          .white
                          .make()
                          .pSymmetric(h: 10, v: 5)
                          .box
                          .withRounded(
                            value: 16,
                          )
                          .color(themeColor)
                          .make(),
                    ],
                  ),
                  10.heightBox,
                  Image.asset(
                    'assets/images/Group 11103.png',
                    width: 100.w,
                  ).onTap(() {
                    Get.to(() => const HospitalNearbyScreen());
                  }),
                  20.heightBox,
                  Row(
                    children: [
                      "Search Nearby Doctor by Speciality"
                          .text
                          .bold
                          .size(14)
                          .make(),
                      const Spacer(),
                      "View More"
                          .text
                          .size(8)
                          .white
                          .make()
                          .pSymmetric(h: 10, v: 5)
                          .box
                          .withRounded(
                            value: 16,
                          )
                          .color(themeColor)
                          .make(),
                    ],
                  ),
                  10.heightBox,
                  Image.asset(
                    'assets/images/Group 11091.png',
                    width: 100.w,
                  ),
                  20.heightBox,
                  80.heightBox,
                ],
              ),
            ),
          ),
        ));
  }
}
