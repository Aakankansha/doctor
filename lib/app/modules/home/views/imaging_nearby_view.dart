import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'imaging_center_details.dart';

class ImagingNearbyScreen extends StatefulWidget {
  const ImagingNearbyScreen({super.key});

  @override
  State<ImagingNearbyScreen> createState() => _ImagingNearbyScreenState();
}

class _ImagingNearbyScreenState extends State<ImagingNearbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: const Color(0xffF5F5F5),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nearby Imaging Center',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: const [
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
              5.heightBox,
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
                          RotateAnimatedText('X-Ray'),
                          RotateAnimatedText('CT Scan'),
                          RotateAnimatedText('MRI'),
                          RotateAnimatedText('Ultrasound'),
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
                  height: 120,
                  viewportFraction: 0.8,
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
                        Image.asset('assets/images/Group 11077.png'),
              ),
              Image.asset(
                "assets/images/Group 11101.png",
                fit: BoxFit.cover,
              ).onTap(() {
                Get.to(() => const ImagingCenterDetailsScreen());
              }),
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
