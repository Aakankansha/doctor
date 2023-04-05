import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class AllImagingCenterPackagesScreen extends StatelessWidget {
  const AllImagingCenterPackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'All Imaging Center Packages',
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'General Package',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '20 Tests Included',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '₹ 1500',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      10.widthBox,
                      const Text(
                        'View Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      )
                          .pSymmetric(
                            h: 20,
                            v: 5,
                          )
                          .box
                          .withRounded()
                          .color(themeColor)
                          .make(),
                      10.widthBox,
                    ],
                  ),
                  5.heightBox,
                ],
              ),
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
