import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'lab_details_screen.dart';

class LabNearbyScreen extends StatefulWidget {
  const LabNearbyScreen({super.key});

  @override
  State<LabNearbyScreen> createState() => _LabNearbyScreenState();
}

class _LabNearbyScreenState extends State<LabNearbyScreen> {
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
                'Nearby Lab',
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: TextFormField(
                readOnly: true,
                onTap: () {
                  //   Get.to(() => const HospitalDetailsScreen());
                },
                decoration: InputDecoration(
                  hintText: 'Lab...',
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
            Expanded(
              child: SingleChildScrollView(
                child: Image.asset(
                  "assets/images/Group 11102.png",
                  fit: BoxFit.cover,
                ).onTap(() {
                  Get.to(() => const LabDetailsScreen());
                }),
              ),
            ),
          ],
        ));
  }
}
