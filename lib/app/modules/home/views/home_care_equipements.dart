import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class HomeCareEquipment extends StatelessWidget {
  const HomeCareEquipment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: themeColor,
        title: const Text(
          'Home Care Equipments',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: TextFormField(
                readOnly: true,
                onTap: () {},
                decoration: InputDecoration(
                  hintText: 'Search Equipment...',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              'Oxygen Concentrator',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              Icons.info,
                                              color: Colors.grey,
                                            ).onTap(() {
                                              Get.dialog(
                                                Dialog(
                                                  backgroundColor: Colors.white,
                                                  child: SizedBox(
                                                    height: 400,
                                                    width: double.infinity,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          "Oxygen Concentrator"
                                                              .text
                                                              .bold
                                                              .xl
                                                              .make(),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                                                              .text
                                                              .make()
                                                              .pOnly(left: 10),
                                                          10.heightBox,
                                                          "1. Lorem ipsum dolor site et dolore magna aliqua."
                                                              .text
                                                              .make()
                                                              .pOnly(left: 10),
                                                          5.heightBox,
                                                          "2. Lorem ipsum dolor site et dolore magna aliqua."
                                                              .text
                                                              .make()
                                                              .pOnly(left: 10),
                                                          5.heightBox,
                                                          "3. Lorem ipsum dolor site et dolore magna aliqua."
                                                              .text
                                                              .make()
                                                              .pOnly(left: 10),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                        "lorem ipsum dolor sit amet, nisi ut aliquip ex ea commodo consequat."
                                            .text
                                            .make()
                                            .pOnly(right: 10),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Row(
                                          children: [
                                            Text(
                                              'Rs. 5000',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Rs. 6000',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              10.heightBox,
                              Row(
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            Size(context.width / 3, 40),
                                        backgroundColor: index == 0
                                            ? themeColor
                                            : Colors.white,
                                        side: const BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                      onPressed: () {},
                                      child: "Rent"
                                          .text
                                          .color(index == 0
                                              ? Colors.white
                                              : Colors.grey)
                                          .make()),
                                  10.widthBox,
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize:
                                            Size(context.width / 3, 40),
                                        backgroundColor: index != 1
                                            ? Colors.white
                                            : themeColor,
                                        side: const BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                      onPressed: () {},
                                      child: "Purchase"
                                          .text
                                          .color(index != 1
                                              ? Colors.grey
                                              : Colors.white)
                                          .make())
                                ],
                              ),
                            ]),
                          ));
                    })),
          ],
        ),
      ),
    );
  }
}
