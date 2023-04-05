import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/modules/notification/controllers/notification_controller.dart';

import '../../../core/widgets/app_widgets.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    controller.callNotifications();
  }

  final controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBottomPageTitle("Notifications").marginAll(10),
            controller.notification.isNotEmpty
                ? Center(
                    child: Column(
                      children: [
                        80.heightBox,
                        Image.asset(
                          "assets/images/icon-notification.png",
                          height: 180,
                        ),
                        30.heightBox,
                        "No Notification Found".text.xl2.bold.make(),
                      ],
                    ),
                  ).marginAll(10)
                : Image.asset("assets/images/Group 11084.png"),
            // : ListView.builder(
            //     itemCount: controller.notification.length,
            //     itemBuilder: ((context, index) {
            //       return Row(
            //         children: [
            //           Image.asset(Assets.images.marketing.path),
            //           10.widthBox,
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               "NCC 5030 (203213..)"
            //                   .text
            //                   .size(16)
            //                   .color(themeColor)
            //                   .make(),
            //               "Ncc (Y) 5030 marketing management (SU2022)"
            //                   .text
            //                   .size(14)
            //                   .gray400
            //                   .make(),
            //               10.heightBox,
            //               "June 6 at 4:16 pm".text.gray400.size(12).make(),
            //               10.heightBox,
            //               const VxDivider(
            //                 color: Vx.gray300,
            //                 type: VxDividerType.horizontal,
            //               ),
            //               10.heightBox
            //             ],
            //           ).expand()
            //         ],
            //       ).marginAll(10);
            //     })).expand()
          ],
        ),
      ),
    );
  }
}
