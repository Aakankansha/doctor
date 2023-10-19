import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clear_vikalp_app/app/modules/home/views/health_checkup_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'lab_details_screen.dart';

class LabNearbyScreen extends StatefulWidget {
  const LabNearbyScreen({super.key, this.isHomeCheckup = false});
  final bool isHomeCheckup;

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
  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            10.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Row(
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
                        RotateAnimatedText('Cancer'),
                        RotateAnimatedText('Heart'),
                        RotateAnimatedText('Diabetes'),
                        RotateAnimatedText('Kidney'),
                        RotateAnimatedText('Liver'),
                        RotateAnimatedText('Dental'),
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
                  .white
                  .make(),
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
            Expanded(
              child: SingleChildScrollView(
                child: Image.asset(
                  "assets/images/Group 11109 (1).png",
                  fit: BoxFit.cover,
                ).onTap(() {
                  if (widget.isHomeCheckup) {
                    Get.to(() => const HealthCheckupDetails());
                  } else {
                    Get.to(() => const LabDetailsScreen());
                  }
                }),
              ),
            ),
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
          ],
        ));
  }
}
