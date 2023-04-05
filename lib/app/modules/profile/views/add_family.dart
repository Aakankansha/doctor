import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddFamilyScreen extends StatelessWidget {
  const AddFamilyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Family Member',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Name".text.bold.make(),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
