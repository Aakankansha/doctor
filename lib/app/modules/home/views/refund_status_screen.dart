import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class RefundStatusScreen extends StatelessWidget {
  const RefundStatusScreen({super.key});

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
          'Refund Status',
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
            "Refund Status".text.bold.xl2.make(),
            const SizedBox(height: 10),
            "Refund ID: 1234567890".text.make(),
            const SizedBox(height: 10),
            "Refund Amount: ₹ 500".text.make(),
            const SizedBox(height: 10),
            "Refund Date: 12/12/2020".text.make(),
            const SizedBox(height: 10),
            "Refund Status: Refunded".text.make(),
            const SizedBox(height: 10),
            "Refund Mode: Bank Transfer".text.make(),
            const SizedBox(height: 10),
            "Refund Bank Name: ICICI Bank".text.make(),
            const SizedBox(height: 10),
            "Refund Bank Account Number: 1234567890".text.make(),
            const SizedBox(height: 10),
            "Refund Bank IFSC Code: ICIC0001234".text.make(),
            const SizedBox(height: 10),
            "Refund Bank Account Holder Name: John Doe".text.make(),
            const SizedBox(height: 10),
            "Refund Bank Account Holder Address: 123, ABC Street, XYZ City, 123456"
                .text
                .make(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
