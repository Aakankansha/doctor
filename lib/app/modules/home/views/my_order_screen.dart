import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: themeColor2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(
          'My Orders',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    "Health Checkup".text.bold.make(),
                    const Spacer(),
                    "₹ 500".text.bold.make(),
                  ],
                ),
                const SizedBox(height: 5),
                "Order ID: 123456789".text.make(),
                const SizedBox(height: 5),
                "Order Date: 12/12/2021".text.make(),
                const SizedBox(height: 5),
                Row(
                  children: [
                    "Reorder"
                        .text
                        .white
                        .makeCentered()
                        .box
                        .withRounded(value: 8)
                        .p8
                        .color(themeColor2)
                        .make()
                        .expand(),
                    20.widthBox,
                    "Rate & Review"
                        .text
                        .white
                        .makeCentered()
                        .box
                        .withRounded(value: 8)
                        .p8
                        .color(themeColor)
                        .make()
                        .expand(),
                  ],
                ),
              ],
            )
                .p8()
                .box
                .white
                .withRounded()
                .border(
                  color: Colors.grey[200]!,
                  width: 1,
                )
                .make()
          ],
        ),
      ),
    );
  }
}
