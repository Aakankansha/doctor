import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/home/views/all_lab_packages.dart';
import 'package:clear_vikalp_app/app/modules/home/views/lab_description_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LabDetailsScreen extends StatelessWidget {
  const LabDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSelf = true;
    bool isProceed = false;
    TextEditingController dateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
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
      bottomSheet: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: themeColor2,
            ),
            width: double.infinity,
            child: Center(
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '1 Test Selected',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    '₹ 500',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Proceed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
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
                        'Lab Name',
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
            15.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.widthBox,
                const Icon(
                  Icons.healing_rounded,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 15,
                ),
                "All Lab Tests Packages"
                    .text
                    .color(Colors.white)
                    .xl
                    .bold
                    .makeCentered(),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                10.widthBox,
              ],
            )
                .p4()
                .box
                .width(
                  context.screenWidth,
                )
                .height(70)
                .withRounded()
                .color(themeColor)
                .make()
                .onTap(() {
              Get.to(() => const AllLabPackagesScreen());
            }),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Available Tests',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            //lab test list
            //search bar lab test  TextFormField
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search Lab Test',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black54,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
                isDense: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  borderSide: BorderSide(color: Colors.black54, width: 1.0),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Blood Test',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            '₹ 500',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          5.widthBox,
                          const Text(
                            '₹630',
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          15.widthBox,
                          index == 1
                              ? Row(
                                  children: const [
                                    Icon(
                                      Icons.add_circle_outline,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        color: themeColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                  ],
                                )
                              : "add"
                                  .text
                                  .color(Colors.white)
                                  .bold
                                  .makeCentered()
                                  .box
                                  .width(60)
                                  .height(25)
                                  .withRounded()
                                  .color(themeColor)
                                  .make()
                                  .onTap(() {
                                  Get.to(() => const LabDescriptionScreen());
                                }),
                        ],
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: "View Details"
                            .text
                            .color(themeColor)
                            .bold
                            .make()
                            .onTap(() {
                          Get.to(() => const LabDescriptionScreen());
                        }),
                      ),
                    ],
                  ),
                )
                    .box
                    .roundedSM
                    .border(
                      color: Colors.black12,
                    )
                    .make()
                    .onTap(() {
                  Get.to(() => const LabDescriptionScreen());
                }).p8();
              },
            ),
          ],
        ),
      )),
    );
  }
}
