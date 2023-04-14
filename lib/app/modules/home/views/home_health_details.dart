import 'package:clear_vikalp_app/app/modules/home/views/icu_question.dart';
import 'package:clear_vikalp_app/app/modules/home/views/psychology_support.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import 'home_care_equipements.dart';
import 'nursing_questions.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/image.png',
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Apollo Home Health Care',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            VxRating(
                              count: 5,
                              onRatingUpdate: (value) {},
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '4.5',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.info_outlined,
                              color: Colors.black45,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          '1st Floor, Maitri ICON,  Ganesh Mandir Open 24 hours',
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '3.6 km Away',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Near Station Kalwa',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              "Services".text.xl.bold.make(),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  20.widthBox,
                  "Nursing".text.make(),
                  const Spacer(),
                  "Select"
                      .text
                      .white
                      .make()
                      .pSymmetric(
                        h: 20,
                      )
                      .box
                      .withRounded(value: 8)
                      .color(themeColor2)
                      .make(),
                  20.widthBox,
                ],
              )
                  .box
                  .height(40)
                  .withRounded(value: 8)
                  .border(
                    color: themeColor2,
                    width: 1,
                  )
                  .width(double.infinity)
                  .make()
                  .onTap(() {
                Get.to(() => const NursingQuestions());
              }),
              10.heightBox,
              Row(
                children: [
                  20.widthBox,
                  "ICU Setup".text.make(),
                  const Spacer(),
                  "Select"
                      .text
                      .white
                      .make()
                      .pSymmetric(
                        h: 20,
                      )
                      .box
                      .withRounded(value: 8)
                      .color(themeColor2)
                      .make(),
                  20.widthBox,
                ],
              )
                  .box
                  .height(40)
                  .withRounded(value: 8)
                  .border(
                    color: themeColor2,
                    width: 1,
                  )
                  .width(double.infinity)
                  .make()
                  .onTap(() {
                Get.to(() => const ICUQuestion());
              }),
              10.heightBox,
              Row(
                children: [
                  20.widthBox,
                  "Home Equipment".text.make(),
                  const Spacer(),
                  "Select"
                      .text
                      .white
                      .make()
                      .pSymmetric(
                        h: 20,
                      )
                      .box
                      .withRounded(value: 8)
                      .color(themeColor2)
                      .make(),
                  20.widthBox,
                ],
              )
                  .box
                  .height(40)
                  .withRounded(value: 8)
                  .border(
                    color: themeColor2,
                    width: 1,
                  )
                  .width(double.infinity)
                  .make()
                  .onTap(() {
                Get.to(() => const HomeCareEquipment());
              }),
              10.heightBox,
              Row(
                children: [
                  20.widthBox,
                  "Psychotherapy".text.make(),
                  const Spacer(),
                  "Select"
                      .text
                      .white
                      .make()
                      .pSymmetric(
                        h: 20,
                      )
                      .box
                      .withRounded(value: 8)
                      .color(themeColor2)
                      .make(),
                  20.widthBox,
                ],
              )
                  .box
                  .height(40)
                  .withRounded(value: 8)
                  .border(
                    color: themeColor2,
                    width: 1,
                  )
                  .width(double.infinity)
                  .make()
                  .onTap(() {
                Get.to(() => const PsychologySupportQuestion());
              }),
              40.heightBox,
              Image.asset(
                "assets/images/Banner.png",
                fit: BoxFit.cover,
              ),
            ],
          ).pSymmetric(
            h: 20,
          ),
        ));
  }
}
