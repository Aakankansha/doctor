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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    //   Get.to(() => const HospitalDetailsScreen());
                  },
                  decoration: InputDecoration(
                    hintText: 'Imaging Center...',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
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
