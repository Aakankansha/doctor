import 'package:clear_vikalp_app/app/modules/home/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class KnowYourDietDetails extends StatelessWidget {
  const KnowYourDietDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            "Have a Query on your diet?".text.bold.make(),
            "Contact our experience dietician".text.bold.make(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const CartScreen());
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: "Contact Dietician".text.make(),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Know Your Diet Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Image.asset(
          "assets/images/Diet-Chart-for-Diabetics-Foods-to-Eat-Foods-to-Avoid-Infographic.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
