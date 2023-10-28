import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/home/views/geoLocation.dart';
import 'package:clear_vikalp_app/app/modules/home/views/hospital_nearby_view.dart';
import 'package:clear_vikalp_app/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class LabNearbyScreen extends StatefulWidget {
  const LabNearbyScreen(
      {super.key, this.isHomeCheckup = false, this.search = ""});
  final bool isHomeCheckup;
  final String search;

  @override
  State<LabNearbyScreen> createState() => _LabNearbyScreenState();
}

class _LabNearbyScreenState extends State<LabNearbyScreen> {
  List listOfData = [
    {
      "image": "delivery-man.png",
      "name": "Free Home sample collection",
    },
    {
      "image": "accuracy.png",
      "name": "Accurate Reporting..",
    },
    {
      "image": "clock.png",
      "name": "Timely Reporting..",
    },
  ];
  var listOfLabs = [];
  var isLoading = false;
  getLabData(search) async {
    listOfLabs = [];
    setState(() {
      isLoading = true;
    });
    var request =
        http.MultipartRequest('POST', Uri.parse('${baseUrl}service/Labs'));
    request.fields.addAll({
      'search': search,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();

      listOfLabs = json.decode(res)["Lab"];
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

  var hint = "Blood Test";
  var listOfHint = [
    "Blood Test",
    "Urine Test",
    "Thyroid Test",
    "Diabetes Test",
  ];
  TextEditingController searchController = TextEditingController();
  late Timer timer;
  @override
  void initState() {
    getLabData(widget.search);
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
                'Nearby Lab',
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
              10.heightBox,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    getLabData(value);
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
              10.heightBox,
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 50,
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int index, int pageViewIndex) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/${listOfData[index]["image"]}",
                          height: 40,
                        ),
                        10.widthBox,
                        Text(listOfData[index]["name"]).text.bold.make(),
                      ],
                    ),
                  ],
                ).pSymmetric(h: 20),
              ),
              isLoading
                  ? const LoadingShimmerWidget()
                  : ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: listOfLabs.length,
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemBuilder: (context, index) {
                        return Stack(
                          clipBehavior: Clip.antiAlias,
                          children: [
                            Card(
                                elevation: 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  image: listOfLabs[index]
                                                              ["lab_images"] ==
                                                          null
                                                      ? const DecorationImage(
                                                          fit: BoxFit.contain,
                                                          image: AssetImage(
                                                            "assets/images/app_icon.png",
                                                          ),
                                                        )
                                                      : DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            "$baseMediaUrl${listOfLabs[index]["lab_images"].toString().split(",").first}",
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
                                                  listOfLabs[index]["lab_name"]
                                                      .toString()
                                                      .text
                                                      .uppercase
                                                      .size(16)
                                                      .bold
                                                      .make(),
                                                  5.heightBox,
                                                  Row(
                                                    children: [
                                                      "${listOfLabs[index]["google_rating"]}/5"
                                                          .text
                                                          .color(themeColor2)
                                                          .make(),
                                                      const Icon(
                                                        Icons.star_rounded,
                                                        size: 18,
                                                        color: Colors.amber,
                                                      ),
                                                      if (listOfLabs[index]
                                                              ["assure"] ==
                                                          "1")
                                                        Image.asset(
                                                          "assets/images/assured.png",
                                                          height: 25,
                                                        ),
                                                      const Spacer(),
                                                      if (listOfLabs[index][
                                                              "happy_customer"] !=
                                                          "")
                                                        Tooltip(
                                                          triggerMode:
                                                              TooltipTriggerMode
                                                                  .tap,
                                                          message:
                                                              "${listOfLabs[index]["happy_customer"]} Happy Customers ${listOfLabs.first["operation_year"]} years of Operation",
                                                          child: const Icon(
                                                              Icons.info),
                                                        ),
                                                      10.widthBox,
                                                    ],
                                                  ),
                                                  10.heightBox,
                                                  "${listOfLabs[index]["lab_address"]}"
                                                      .text
                                                      .maxLines(3)
                                                      .size(12)
                                                      .color(
                                                          const Color.fromARGB(
                                                              134, 2, 0, 50))
                                                      .make(),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            "${listOfLabs[index]["lab_acrreditation"]}"
                                                .text
                                                .bold
                                                .color(themeColor2)
                                                .make(),
                                            const Spacer(),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        themeColor2),
                                                onPressed: () {},
                                                child: "View Lab"
                                                    .text
                                                    .white
                                                    .make()),
                                          ],
                                        ),
                                        5.heightBox,
                                        if (listOfLabs[index]["latitude"] != "")
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                color: Colors.black54,
                                              ),
                                              "${geoDistance.getDistances(listOfLabs[index]["latitude"], listOfLabs[index]["longitude"])} Km Away"
                                                  .text
                                                  .size(12)
                                                  .bold
                                                  .color(Colors.black54)
                                                  .make(),
                                              const Spacer(),
                                              if (listOfLabs[index]
                                                      ["nearest_station"] !=
                                                  "")
                                                "Nearest Station ${listOfLabs[index]["nearest_station"]}"
                                                    .text
                                                    .size(12)
                                                    .bold
                                                    .color(Colors.black54)
                                                    .make(),
                                              // if (listOfLabs
                                              //         .first["nearest_metro"] !=
                                              //     null)
                                              //   "Nearest Metro ${listOfLabs[index]["nearest_metro"]} "
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
                                )),
                            Positioned(
                              top: 30,
                              left: -25,
                              child: RotationTransition(
                                turns: const AlwaysStoppedAnimation(-45 / 360),
                                child: Container(
                                  width: 120,
                                  height: 20,
                                  color: Colors.yellow,
                                  child: const Text("Assured Cashback",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold))
                                      .centered(),
                                ),
                              ),
                            ),
                          ],
                        ).pSymmetric(h: 10);
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
