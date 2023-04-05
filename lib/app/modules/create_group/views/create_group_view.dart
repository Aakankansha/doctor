import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/gen/assets.gen.dart';

import '../controllers/create_group_controller.dart';

class CreateGroupView extends GetView<CreateGroupController> {
  const CreateGroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("New Group"),
      bottomNavigationBar: ButtonPrimary(
        onPressed: () {},
        title: "Create",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VxTextField(
            borderType: VxTextFieldBorderType.roundLine,
            borderRadius: 10,
            hint: "Name",
            borderColor: Vx.gray400,
            fillColor: Vx.white,
          ),
          20.heightBox,
          "Invite people (Optional)".text.gray400.make(),
          ListView.builder(
              itemCount: 5,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(300),
                      child: Image.asset(Assets.images.person.path)),
                  title: "larry boone".text.make(),
                  trailing: "Send invite"
                      .text
                      .color(themeColor)
                      .make()
                      .pOnly(left: 15, right: 15, top: 5, bottom: 5)
                      .box
                      .border(color: themeColor)
                      .roundedSM
                      .make(),
                );
              }).expand()
        ],
      ).marginAll(10),
    );
  }
}
