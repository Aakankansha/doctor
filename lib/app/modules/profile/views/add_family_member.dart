import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../edit_profile/views/add_family_member.dart';

class FamilyNemberList extends StatelessWidget {
  const FamilyNemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Material(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const AddFamilyMemberScreen());
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: "Add Family".text.make(),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'Family Member List',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            //List of family members
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Full Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Relation',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
        ));
  }
}
