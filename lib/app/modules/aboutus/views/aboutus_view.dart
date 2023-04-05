import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/aboutus/controllers/aboutus_controller.dart';

class AboutusView extends StatefulWidget {
  const AboutusView({Key? key}) : super(key: key);

  @override
  State<AboutusView> createState() => _AboutusViewState();
}

class _AboutusViewState extends State<AboutusView> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    controller.aboutUs();
  }

  final controller = Get.put(AboutusController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("About Us"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset("assets/images/s.png"),
      ),
      // body: FutureBuilder(
      //   future: controller.aboutUs(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting ||
      //         controller.aboutUsModel == null) {
      //       return const Center(
      //         child: CircularProgressIndicator.adaptive(),
      //       );
      //     } else {
      //       return Padding(
      //         padding: const EdgeInsets.all(20),
      //         child: SafeArea(
      //           child: SingleChildScrollView(
      //             child: Text(
      //               "${controller.aboutUsModel!.aboutus}",
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
