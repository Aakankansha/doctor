import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class EarnedCashbackScreen extends StatelessWidget {
  const EarnedCashbackScreen({super.key});

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
          'Earned Cashback',
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
          children: [
            const SizedBox(height: 5),
            Row(
              children: [
                "Earned Cashback:".text.white.bold.make(),
                const Spacer(),
                " ₹ 500".text.white.bold.xl3.make()
              ],
            )
                .pSymmetric(
                  h: 10,
                  v: 10,
                )
                .box
                .withRounded()
                .color(themeColor2)
                .make()
                .w(
                  context.screenWidth,
                ),
            const SizedBox(height: 15),
            "Note: Cashback will be credited to your account within 24 hours of your order completed."
                .text
                .gray500
                .make(),
            const SizedBox(height: 15),
            "Cashback History".text.bold.xl.make(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              "Health Checkup".text.bold.make(),
                              const Spacer(),
                              "₹ 100".text.bold.make(),
                            ],
                          ),
                          const SizedBox(height: 5),
                          "Order ID: 123456789".text.make(),
                          const SizedBox(height: 5),
                          "Order Date: 12/12/2021".text.make(),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              "Cashback Status: ".text.make(),
                              "Pending".text.bold.make(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
