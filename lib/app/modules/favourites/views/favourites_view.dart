import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';

import '../../../../gen/assets.gen.dart';
import '../controllers/favourites_controller.dart';

class FavouritesView extends GetView<FavouritesController> {
  const FavouritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("Favourites"),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: ((context, index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Vx.gray300, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: Image.asset(Assets.images.university.path),
                title: "Cornell university".text.make(),
                subtitle:
                    "New york, United States".text.size(12).gray400.make(),
                trailing: const Icon(Icons.favorite_border_rounded),
              ).marginAll(10);
            })));
  }
}
