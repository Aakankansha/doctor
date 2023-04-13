import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeHealthDetailsScreen extends StatefulWidget {
  const HomeHealthDetailsScreen({super.key});

  @override
  State<HomeHealthDetailsScreen> createState() =>
      _HomeHealthDetailsScreenState();
}

class _HomeHealthDetailsScreenState extends State<HomeHealthDetailsScreen> {
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
                'Nearby Home Health Care',
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
              Image.asset(
                "assets/images/Group 11100.png",
                fit: BoxFit.cover,
              ).onTap(() {
                // Get.to(() => const HomeHealthDetailsScreen());
              }),
            ],
          ),
        ));
  }
}
