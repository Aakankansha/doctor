import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clear_vikalp_app/app/modules/privacy/controllers/privacy_controller.dart';

import '../../../core/widgets/app_widgets.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({Key? key}) : super(key: key);

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    controller.privacyNote();
  }

  final controller = Get.put(PrivacyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Privacy Policy"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/Doctor hunt text (1).png"),
      ),
      // body: FutureBuilder(
      //   future: controller.privacyNote(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting ||
      //         controller.privacyModel == null) {
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     } else {
      //       return Padding(
      //         padding: const EdgeInsets.all(20),
      //         child: SafeArea(
      //           child: SingleChildScrollView(
      //             child: Text(
      //               "${controller.privacyModel!.content}",
      //             ),
      //           ),
      //         ),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
