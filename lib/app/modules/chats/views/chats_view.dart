import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';

import '../controllers/chats_controller.dart';

class ChatsView extends GetView<ChatsController> {
  const ChatsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Chats General"),
      bottomNavigationBar: const TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.send_rounded),
            hintText: "Type a message"),
      )
          .box
          .border(color: Vx.gray400)
          .roundedSM
          .margin(const EdgeInsets.all(15))
          .make(),
      body: const Center(
        child: Text(
          'Chats will show here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
