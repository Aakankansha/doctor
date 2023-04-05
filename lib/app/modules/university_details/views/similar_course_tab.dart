import 'package:clear_vikalp_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SimilarCourseTab extends StatelessWidget {
  const SimilarCourseTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Vx.gray300, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            leading: Image.asset(Assets.images.university.path),
            title: "Cornell university".text.make(),
            subtitle: "New york, United States".text.size(12).gray400.make(),
            trailing: const Icon(Icons.favorite_border_rounded),
          ).marginAll(10);
        }));
  }
}
