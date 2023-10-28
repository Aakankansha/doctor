import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/home/views/geoLocation.dart';
import 'package:clear_vikalp_app/app/modules/home/views/hospital_details_screen.dart';
import 'package:clear_vikalp_app/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class HospitalNearbyScreen extends StatefulWidget {
  const HospitalNearbyScreen({super.key, this.search = ""});
  final String search;

  @override
  State<HospitalNearbyScreen> createState() => _HospitalNearbyScreenState();
}

class _HospitalNearbyScreenState extends State<HospitalNearbyScreen> {
  bool isLoading = true;
  List listOfDoctor = [];
  getHospitalData(search) async {
    listOfDoctor = [];
    setState(() {
      isLoading = true;
    });
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}service/hospitals'));
    request.fields.addAll({
      'search': search,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();

      listOfDoctor = json.decode(res)["hospital"];
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.reasonPhrase);
    }
  }

  var hint = "Kidney";
  var listOfHint = [
    "Kidney",
    "Heart",
    "Cancer",
    "Diabetes",
    "Liver",
    "Dental",
  ];
  late Timer timer;
  @override
  void initState() {
    getHospitalData(widget.search);

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        hint = listOfHint[Random().nextInt(listOfHint.length)];
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GeoDistance geoDistance = GeoDistance();

    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xffF5F5F5),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nearby Hospital',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 20,
                  ),
                  Text(
                    'Vasai Road',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    getHospitalData(value);
                  },
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black45,
                    ),
                    hintText: "Search for $hint",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black45,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 22.0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     children: <Widget>[
              //       const SizedBox(
              //         width: 20.0,
              //       ),
              //       const Icon(
              //         Icons.search,
              //         color: Colors.black45,
              //         size: 18.0,
              //       ),
              //       const SizedBox(
              //         width: 5.0,
              //       ),
              //       const Text(
              //         'Search for',
              //         style: TextStyle(
              //           fontSize: 14.0,
              //           color: Colors.black45,
              //         ),
              //       ),
              //       const SizedBox(
              //         width: 5.0,
              //       ),
              //       DefaultTextStyle(
              //         style: const TextStyle(
              //           fontSize: 14.0,
              //           color: Colors.black45,
              //         ),
              //         child: AnimatedTextKit(
              //           isRepeatingAnimation: true,
              //           repeatForever: true,
              //           animatedTexts: [
              //             RotateAnimatedText('Cancer'),
              //             RotateAnimatedText('Heart'),
              //             RotateAnimatedText('Diabetes'),
              //             RotateAnimatedText('Kidney'),
              //             RotateAnimatedText('Liver'),
              //             RotateAnimatedText('Dental'),
              //           ],
              //           onTap: () {},
              //         ),
              //       ),
              //     ],
              //   )
              //       .box
              //       .withRounded(value: 8)
              //       .width(double.infinity)
              //       .height(50)
              //       .white
              //       .make(),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 120,
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: 4,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Image.asset('assets/images/offers.png'),
              ).pSymmetric(
                h: 20,
              ),
              isLoading
                  ? const LoadingShimmerWidget()
                  : ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: listOfDoctor.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (context, index) {
                        return Card(
                            elevation: 4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          3.widthBox,
                                          Container(
                                            width: 100,
                                            height: 110,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: listOfDoctor[index]
                                                            ["hospital_img"] ==
                                                        null
                                                    ? const DecorationImage(
                                                        fit: BoxFit.contain,
                                                        image: AssetImage(
                                                          "assets/images/app_icon.png",
                                                        ),
                                                      )
                                                    : DecorationImage(
                                                        fit: BoxFit.contain,
                                                        image: NetworkImage(
                                                          "$baseMediaUrl${listOfDoctor[index]["hospital_img"].toString().split(",").first}",
                                                        ),
                                                      ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(12))),
                                          ),
                                          10.widthBox,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                listOfDoctor[index]
                                                        ["hospital_name"]
                                                    .toString()
                                                    .text
                                                    .uppercase
                                                    .size(18)
                                                    .bold
                                                    .make(),
                                                5.heightBox,
                                                Row(
                                                  children: [
                                                    "${listOfDoctor[index]["google_rating"]}/5"
                                                        .text
                                                        .color(themeColor2)
                                                        .make(),
                                                    const Icon(
                                                      Icons.star_rounded,
                                                      size: 18,
                                                      color: Colors.amber,
                                                    ),
                                                    if (listOfDoctor[index]
                                                            ["assure"] ==
                                                        "1")
                                                      Image.asset(
                                                        "assets/images/assured.png",
                                                        height: 25,
                                                      ),
                                                    const Spacer(),
                                                    if (listOfDoctor[index][
                                                            "happy_customer"] !=
                                                        "")
                                                      Tooltip(
                                                        triggerMode:
                                                            TooltipTriggerMode
                                                                .tap,
                                                        message:
                                                            "${listOfDoctor[index]["happy_customer"]} Happy Customers ${listOfDoctor.first["operation_year"]} years of Operation",
                                                        child: const Icon(
                                                            Icons.info),
                                                      ),
                                                    10.widthBox,
                                                  ],
                                                ),
                                                10.heightBox,
                                                "${listOfDoctor[index]["address"]}"
                                                    .text
                                                    .maxLines(3)
                                                    .size(12)
                                                    .color(const Color.fromARGB(
                                                        134, 2, 0, 50))
                                                    .make(),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          "${listOfDoctor[index]["acrreditation"]}"
                                              .text
                                              .bold
                                              .color(themeColor2)
                                              .make(),
                                          const Spacer(),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: themeColor2),
                                              onPressed: () {
                                                Get.to(() =>
                                                    HospitalDetailsScreen(
                                                      hospitalDetails:
                                                          listOfDoctor[index],
                                                    ));
                                              },
                                              child: "View Doctor"
                                                  .text
                                                  .white
                                                  .make()),
                                        ],
                                      ),
                                      5.heightBox,
                                      if (listOfDoctor[index]["latitude"] != "")
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.black54,
                                            ),
                                            "${geoDistance.getDistances(listOfDoctor[index]["latitude"], listOfDoctor[index]["longitude"])} Km Away"
                                                .text
                                                .size(12)
                                                .bold
                                                .color(Colors.black54)
                                                .make(),
                                            const Spacer(),
                                            if (listOfDoctor[index]
                                                    ["nearest_station"] !=
                                                "")
                                              "Nearest Station ${listOfDoctor[index]["nearest_station"]}"
                                                  .text
                                                  .size(12)
                                                  .bold
                                                  .color(Colors.black54)
                                                  .make(),
                                            // if (listOfDoctor
                                            //         .first["nearest_metro"] !=
                                            //     null)
                                            //   "Nearest Metro ${listOfDoctor[index]["nearest_metro"]} "
                                            //       .text
                                            //       .size(12)
                                            //       .bold
                                            //       .color(Colors.black54)
                                            //       .make()
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            )).pSymmetric(h: 10);
                      }),
              // Image.asset(
              //   "assets/images/Group 11109.png",
              //   fit: BoxFit.cover,
              // ).onTap(() {
              //   Get.to(() => const HospitalDetailsScreen());
              // }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/Banner.png",
                ),
              ),
            ],
          ),
        ));
  }
}

class LoadingShimmerWidget extends StatelessWidget {
  const LoadingShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children: [
        VxShimmer(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            height: 140,
          ),
        ),
        20.heightBox,
        VxShimmer(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            height: 140,
          ),
        ),
        20.heightBox,
        VxShimmer(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            height: 140,
          ),
        ),
        20.heightBox,
        VxShimmer(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            height: 140,
          ),
        ),
        20.heightBox,
        VxShimmer(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(12)),
            width: double.infinity,
            height: 140,
          ),
        )
      ],
    );
  }
}
