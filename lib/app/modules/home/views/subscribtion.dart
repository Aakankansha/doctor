import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

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
          'My Subscriptions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                "Clear Vikalp Membership".text.white.bold.make(),
                const Divider(
                  color: Colors.white10,
                ),
                "Rs 499".text.white.xl3.make(),
                "Monthly".text.white.make(),
                "Active ".text.white.bold.make(),
                "Renewal Date: 12/4/2021".text.white.make(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Spacer(),
                    "Renew"
                        .text
                        .white
                        .bold
                        .make()
                        .pSymmetric(
                          h: 40,
                          v: 2,
                        )
                        .box
                        .withRounded()
                        .p8
                        .color(themeColor2)
                        .make(),
                  ],
                ),
              ],
            )
                .pSymmetric(
                  h: 10,
                  v: 10,
                )
                .box
                .withRounded()
                .color(themeColor)
                .make()
                .w(
                  context.screenWidth,
                ),
            20.heightBox,
            "Subscription Benefits".text.bold.make(),
            10.heightBox,
            "1. Get 10% cashback on all your purchases".text.make(),
            10.heightBox,
            "2. Get 10% cashback on all your purchases".text.make(),
            10.heightBox,
            "3. Get 10% cashback on all your purchases".text.make(),
            10.heightBox,
            "4. Get 10% cashback on all your purchases".text.make(),
          ],
        ),
      ),
    );
  }
}
