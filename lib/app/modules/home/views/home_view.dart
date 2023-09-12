import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/home/views/about_screen.dart';
import 'package:clear_vikalp_app/app/modules/home/views/offer_screen.dart';
import 'package:clear_vikalp_app/app/modules/home/views/privacy_policy.dart';
import 'package:clear_vikalp_app/app/modules/home/views/refund_status_screen.dart';
import 'package:clear_vikalp_app/app/modules/home/views/self_checkup_screen.dart';
import 'package:clear_vikalp_app/app/modules/home/views/subscribtion.dart';
import 'package:clear_vikalp_app/app/modules/home/views/transaction_screen.dart';
import 'package:clear_vikalp_app/app/modules/subscription/subscription.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:status_view/status_view.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';
import 'comparative_analysis.dart';
import 'earned_cashback_screen.dart';
import 'get_surgery_done.dart';
import 'help_center_screen.dart';
import 'home_health_care.dart';
import 'hospital_nearby_view.dart';
import 'imaging_nearby_view.dart';
import 'know_your_diet.dart';
import 'lab_nearby_view.dart';
import 'my_cart.dart';
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
    "assets/images/hospital near by you.png",
    "assets/images/lab.png",
    "assets/images/imaging center.png",
    "assets/images/know your diet.png",
    "assets/images/home helath care.png",
    "assets/images/know your health.png",
  ];
  var listOfSymtoms = [
    "assets/images/fever.png",
    "assets/images/nasal.png",
    "assets/images/mens.png",
    "assets/images/hair.png",
    "assets/images/knee.png",
    "assets/images/stomach.png",
    "assets/images/weight.png",
    "assets/images/back.png",
  ];
  var listOfOrgan = [
    "assets/images/cardiac screening.png",
    "assets/images/dibetes.png",
    "assets/images/full body.png",
    "assets/images/kidney.png",
    "assets/images/liver.png",
    "assets/images/thyroid.png",
  ];
  var listOfOrganTitle = [
    "Cardiac Screening",
    "Diabetes Screening",
    "Full Body Screening",
    "Kidney Screening",
    "Liver/Pancreas Screening",
    "Thyroid Screening",
  ];
  var listOfDiagOrgan = [
    "assets/images/mamography.png",
    "assets/images/ct scan.png",
    "assets/images/MRI.png",
    "assets/images/usg.png",
    "assets/images/2d echo.png",
    "assets/images/color dopleger.png",
  ];
  var listOfDiagTitle = [
    "Mammography",
    "CT Scan",
    "MRI Scan",
    "USG",
    "2D Echo ECG",
    "Color Doppler",
  ];
  var listOfDoctor = [
    "assets/images/pediatric.png",
    "assets/images/cardiac.png",
    "assets/images/medicine.png",
    "assets/images/optho.png",
    "assets/images/surgery.png",
    "assets/images/ortho.png",
  ];
  var listOfDoctorTitle = [
    "Pediatric",
    "Cardiology",
    "General Medicine",
    "Ophthalmology",
    "General Surgery",
    "Orthopaedic",
  ];

  getFeedback() async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://clearviklap.digitalnaman.com/api/index.php/Auth/feedback_save'));
    request.fields.addAll({'user_id': '1', 'feedback': 'Testing Feedback 1'});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldkey,
        drawer: Drawer(
          child: SafeArea(
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
                      Get.to(() => MyOrderScreen());
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
                        .make()
                        .onTap(() {
                      Get.to(() => const ComparativeAnalysis());
                    }),
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
                        .make()
                        .onTap(() {
                      Get.to(() => const OfferScreen());
                    }),
                    10.heightBox,
                    Row(
                      children: [
                        "Privacy Policy".text.bold.make(),
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
                      Get.to(() => const PrivacyPolicy());
                    }),
                    10.heightBox,
                    Row(
                      children: [
                        "About Us".text.bold.make(),
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
                      Get.to(() => const AboutScreen());
                    }),
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
                        .make()
                        .onTap(() {
                      Get.to(() => const HelpCenterScreen());
                    }),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: Row(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/cashback.png",
                  height: 80,
                ),
                VxShimmer(
                  primaryColor: Colors.white12,
                  secondaryColor: Colors.black12,
                  child: Image.asset(
                    "assets/images/cashback.png",
                    height: 80,
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              //    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Get.to(() => const MyCartScreen());
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
                    (homeController.currentProfileData.name ?? "Raj")
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
                    .height(50)
                    .color(const Color(0xffF5F5F5))
                    .make(),
                8.heightBox,
                MainGridFunc(
                    listOfImages: listOfImages,
                    listOfServies: listOfServies,
                    listOfSubstitle: listOfSubstitle),
                TalkToTeam(controller: controller),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 120,
                    viewportFraction: 1,
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
                      Image.asset('assets/images/offers.png'),
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
                ).onTap(() {
                  Get.to(() => const GetSurgeryDoneScreen());
                }),
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
                ).onTap(() {
                  Get.to(() => const GetPremiumScreen());
                }),
                10.heightBox,
                Row(
                  children: [
                    "Search By Symptoms".text.bold.size(14).make(),
                    const Spacer(),
                  ],
                ),
                10.heightBox,
                GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: listOfSymtoms.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              listOfSymtoms[index],
                            )),
                      ).onTap(() {
                        Get.to(() => const HospitalNearbyScreen());
                      });
                    }),
                30.heightBox,
                Row(
                  children: [
                    "Screen Your Organ Function".text.bold.size(14).make(),
                    const Spacer(),
                  ],
                ),
                10.heightBox,
                GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: listOfOrgan.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Positioned(
                            top: 5,
                            left: 5,
                            right: 5,
                            child: listOfOrganTitle[index]
                                .toString()
                                .text
                                .bold
                                .color(themeColor)
                                .size(10)
                                .center
                                .makeCentered(),
                          ),
                          Image.asset(
                            listOfOrgan[index],
                            width: double.infinity,
                          ),
                        ],
                      ).onTap(() {
                        Get.to(() => const LabNearbyScreen());
                      });
                    }),
                10.heightBox,
                Image.asset(
                  'assets/images/Group 11099.png',
                )
                    .pSymmetric(
                  h: 8,
                  v: 10,
                )
                    .onTap(() {
                  Get.to(() => const LabNearbyScreen(
                        isHomeCheckup: true,
                      ));
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
                  ],
                ),
                10.heightBox,
                GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: listOfOrgan.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Positioned(
                            top: 20,
                            right: 10,
                            child: listOfDiagTitle[index]
                                .toString()
                                .text
                                .bold
                                .color(const Color.fromARGB(255, 8, 0, 124))
                                .size(10)
                                .center
                                .makeCentered(),
                          ),
                          Image.asset(
                            listOfDiagOrgan[index],
                            width: double.infinity,
                            colorBlendMode: BlendMode.srcATop,
                            color: const Color.fromARGB(255, 105, 240, 224),
                          ),
                          Image.asset(
                            listOfDiagOrgan[index],
                            width: double.infinity,
                          ),
                        ],
                      ).onTap(() {
                        Get.to(() => const LabNearbyScreen());
                      });
                    }),
                20.heightBox,
                Row(
                  children: [
                    "Get Screening for your Eyes".text.bold.size(14).make(),
                    const Spacer(),
                  ],
                ),
                10.heightBox,
                Image.asset(
                  'assets/images/Group 11111.png',
                  width: 100.w,
                ),
                20.heightBox,
                Row(
                  children: [
                    "Get Your Dental Screened".text.bold.size(14).make(),
                    const Spacer(),
                    // "View More"
                    //     .text
                    //     .size(8)
                    //     .white
                    //     .make()
                    //     .pSymmetric(h: 10, v: 5)
                    //     .box
                    //     .withRounded(
                    //       value: 16,
                    //     )
                    //     .color(themeColor)
                    //     .make(),
                  ],
                ),
                10.heightBox,
                Image.asset(
                  'assets/images/Group 11110.png',
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
                  ],
                ),
                10.heightBox,
                GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: listOfOrgan.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Positioned(
                            top: 5,
                            right: 0,
                            left: 0,
                            child: listOfDoctorTitle[index]
                                .toString()
                                .text
                                .bold
                                .size(10)
                                .center
                                .makeCentered(),
                          ),
                          Image.asset(
                            listOfDoctor[index],
                            width: double.infinity,
                          ),
                        ],
                      ).onTap(() {
                        Get.to(() => const HospitalNearbyScreen());
                      });
                    }),
                80.heightBox,
              ],
            ),
          ),
        ));
  }
}

class TalkToTeam extends StatelessWidget {
  const TalkToTeam({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.support_agent_rounded,
                    color: Colors.white, size: 24),
                10.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Talk to our team".text.white.bold.size(10).make(),
                    "for your search".text.white.bold.size(10).make(),
                    5.heightBox,
                  ],
                ),
                5.widthBox,
              ],
            )
                .p4()
                .box
                .linearGradient([
                  const Color(0xff1CB37D),
                  const Color(0xff021753),
                ])
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
                                          style: ElevatedButton.styleFrom(
                                              minimumSize: Size(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  40),
                                              backgroundColor: themeColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              )),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: "Okay".text.white.make()),
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
              const Icon(Icons.upload, color: Colors.white, size: 24),
              5.widthBox,
              Column(
                children: [
                  "Upload prescription".text.white.bold.center.size(10).make(),
                  "And we assist you".text.white.size(10).bold.make(),
                  5.heightBox,
                ],
              ),
              10.widthBox,
            ],
          )
                  .p4()
                  .box
                  .linearGradient([
                    const Color(0xff1CB37D),
                    const Color(0xff021753),
                  ])
                  .withRounded()
                  .make()
                  .onTap(() {
                    controller.showUploadPrescription();
                  })),
        ],
      ),
    );
  }
}

class MainGridFunc extends StatelessWidget {
  const MainGridFunc({
    super.key,
    required this.listOfImages,
    required this.listOfServies,
    required this.listOfSubstitle,
  });

  final List<String> listOfImages;
  final List<String> listOfServies;
  final List<String> listOfSubstitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.9,
            crossAxisSpacing: 5,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: index == 0
                            ? [
                                Colors.white,
                                const Color.fromARGB(255, 255, 235, 235)
                              ]
                            : index == 1
                                ? [
                                    Colors.white,
                                    const Color.fromARGB(255, 223, 243, 255)
                                  ]
                                : index == 2
                                    ? [
                                        Colors.white,
                                        const Color.fromARGB(255, 224, 250, 255)
                                      ]
                                    : index == 3
                                        ? [
                                            Colors.white,
                                            const Color.fromARGB(
                                                255, 239, 255, 243)
                                          ]
                                        : index == 4
                                            ? [
                                                Colors.white,
                                                const Color.fromARGB(
                                                    255, 235, 231, 255)
                                              ]
                                            : index == 5
                                                ? [
                                                    Colors.white,
                                                    const Color.fromARGB(
                                                        255, 255, 234, 229)
                                                  ]
                                                : [
                                                    Colors.white,
                                                    const Color.fromARGB(
                                                        255, 221, 255, 242)
                                                  ]),
                    // color: index == 0
                    //     ? const Color.fromARGB(255, 255, 235, 235)
                    //     : index == 1
                    //         ? const Color.fromARGB(255, 223, 243, 255)
                    //         : index == 2
                    //             ? const Color.fromARGB(255, 224, 250, 255)
                    //             : index == 3
                    //                 ? const Color.fromARGB(255, 239, 255, 243)
                    //                 : index == 4
                    //                     ? const Color.fromARGB(
                    //                         255, 235, 231, 255)
                    //                     : index == 5
                    //                         ? const Color.fromARGB(
                    //                             255, 255, 234, 229)
                    //                         : const Color.fromARGB(
                    //                             255, 221, 255, 242),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Image.asset(
                                listOfImages[index],
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Text(listOfServies[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 54, 54, 54),
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
                    Get.to(() => const HomeHealthCareNearbyScreen());
                  } else if (index == 2) {
                    Get.to(() => const ImagingNearbyScreen());
                  } else if (index == 3) {
                    Get.to(() => const KnowYourDiet());
                  } else if (index == 5) {
                    Get.to(() => const SelfCheckUpScreen());
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
    );
  }
}
