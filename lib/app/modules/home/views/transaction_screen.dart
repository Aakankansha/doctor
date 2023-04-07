import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

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
          'My Transactions',
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
            Row(
              children: [
                "Transactions".text.bold.xl2.make(),
                const Spacer(),
                "filter"
                    .text
                    .white
                    .bold
                    .make()
                    .pSymmetric(
                      h: 20,
                      v: 5,
                    )
                    .box
                    .black
                    .withRounded(value: 8)
                    .make(),
              ],
            ),
            const SizedBox(height: 30),
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: "Bank Reference ID: 123456789".text.white.size(12).make(),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "12/12/2021 | 4:30 PM".text.white.size(12).make(),
                  "Google Pay: test@okaxis".text.white.size(12).make(),
                  "Health Checkup".text.white.size(12).make(),
                ],
              ),
              trailing: "-₹500".text.xl2.red500.bold.make(),
            ).p8().box.withRounded().color(themeColor).make(),
          ],
        ),
      ),
    );
  }
}
