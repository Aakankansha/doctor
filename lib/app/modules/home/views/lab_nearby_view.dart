import 'package:animated_text_kit/animated_text_kit.dart';
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
            Expanded(
              child: SingleChildScrollView(
                child: Image.asset(
                  "assets/images/Group 11102.png",
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
          ],
        ));
  }
}
