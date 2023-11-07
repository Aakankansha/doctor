import 'package:carousel_slider/carousel_slider.dart';
import 'package:clear_vikalp_app/app/modules/home/views/home_health_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeHealthCareNearbyScreen extends StatefulWidget {
  const HomeHealthCareNearbyScreen({super.key});

  @override
  State<HomeHealthCareNearbyScreen> createState() =>
      _HomeHealthCareNearbyScreenState();
}

class _HomeHealthCareNearbyScreenState
    extends State<HomeHealthCareNearbyScreen> {
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
                'Nearby Home Health Care',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: TextFormField(
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  hintText: 'Hospital...',
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
            const SizedBox(
              height: 20,
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
            Expanded(
              child: SingleChildScrollView(
                child: Image.asset(
                  "assets/images/Group 11096.png",
                  fit: BoxFit.cover,
                ).onTap(() {
                  Get.to(() => const HomeHealthDetailsScreen());
                }),
              ),
            ),
          ],
        ));
  }
}
