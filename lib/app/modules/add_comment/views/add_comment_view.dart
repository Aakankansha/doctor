import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';

import '../controllers/add_comment_controller.dart';

class AddCommentView extends GetView<AddCommentController> {
  const AddCommentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("Ratings"),
        body: Column(
          children: [
            "How was your experience with the course".text.make(),
            40.heightBox,
            const VxTextField(
              borderType: VxTextFieldBorderType.roundLine,
              borderRadius: 10,
              hint: "Write a comment",
              maxLine: 10,
              textAlign: TextAlign.start,
            ),
            40.heightBox,
            ButtonPrimary(onPressed: () {}, title: "Submit")
          ],
        ).marginAll(10));
  }
}
